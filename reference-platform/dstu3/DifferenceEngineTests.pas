unit DifferenceEngineTests;

interface

uses
  SysUtils, classes,
  ActiveX, ComObj, Variants, StringSupport, AdvGenerics, TextUtilities,
  FHIRTestWorker, FHIRResources, FHIRBase, FHIRParser, FHIRTypes, DifferenceEngine,
  MsXml, MsXmlParser, DUnitX.TestFramework;

Type
  [TextFixture]
  TDifferenceEngineTests = Class (TObject)
  Private
  Published
  End;

  DifferenceEngineTestCaseAttribute = class (CustomTestCaseSourceAttribute)
  protected
    function GetCaseInfoArray : TestCaseInfoArray; override;
  end;

  [TextFixture]
  TDifferenceEngineTest = Class (TObject)
  private
    function findTest(index : integer) : IXMLDOMElement;
    function parseResource(elem : IXMLDOMElement) : TFhirResource;
    function AsXml(res : TFHIRResource) : String;
    procedure CompareXml(name, mode : String; expected, obtained : TFHIRResource);
    procedure execCase(name : String; mode : String; input : TFhirResource; diff : TFhirParameters; output : TFhirResource);
  Published
    [DifferenceEngineTestCase]
    procedure DifferenceEngineTest(Name : String);
  End;

implementation

var
  tests : IXMLDOMDocument2;

{ DifferenceEngineTestCaseAttribute }

function DifferenceEngineTestCaseAttribute.GetCaseInfoArray: TestCaseInfoArray;
var
  test : IXMLDOMElement;
  i : integer;
  s : String;
begin
  tests := TMsXmlParser.Parse('C:\work\org.hl7.fhir\build\tests\patch\fhir-path-tests.xml');
  test := TMsXmlParser.FirstChild(tests.documentElement);
  i := 0;
  while test <> nil do
  begin
    s := VarToStrDef(test.getAttribute('name'), '');
    SetLength(result, i+1);
    result[i].Name := s;
    SetLength(result[i].Values, 1);
    result[i].Values[0] := inttostr(i);
    inc(i);
    test := TMsXmlParser.NextSibling(test);
  end;
end;


{ TDifferenceEngineTest }

function TDifferenceEngineTest.findTest(index : integer): IXMLDOMElement;
var
  i : integer;
begin
  result := TMsXmlParser.FirstChild(tests.documentElement);
  i := 0;
  while i < index do
  begin
    result := TMsXmlParser.NextSibling(result);
    inc(i);
  end;
end;

procedure TDifferenceEngineTest.DifferenceEngineTest(Name: String);
var
  test : IXMLDOMElement;
  input, output : TFhirResource;
  diff : TFhirParameters;
begin
  test := findTest(StrToInt(name));
  input := parseResource(TMsXmlParser.NamedChild(test, 'input'));
  try
    output := parseResource(TMsXmlParser.NamedChild(test, 'output'));
    try
      diff := parseResource(TMsXmlParser.NamedChild(test, 'diff')) as TFHIRParameters;
      try
        execCase(test.getAttribute('name'), test.getAttribute('mode'), input, diff, output);
      finally
        diff.Free;
      end;
    finally
      output.free;
    end;
  finally
    input.Free;
  end;
end;

function TDifferenceEngineTest.AsXml(res: TFHIRResource): String;
var
  p : TFHIRXmlComposer;
  s : TStringStream;
begin
  p := TFHIRXmlComposer.Create(nil, 'en');
  try
    s := TStringStream.Create;
    try
      p.Compose(s, res, true);
      result := s.DataString;
    finally
      s.Free;
    end;
  finally
    p.Free;
  end;

end;

procedure TDifferenceEngineTest.CompareXml(name, mode : String; expected, obtained: TFHIRResource);
var
  e, o : String;
begin
  e := asXml(expected);
  o := asXml(obtained);
  StringToFile(e, 'c:\temp\expected.xml', TEncoding.UTF8);
  StringToFile(o, 'c:\temp\obtained.xml', TEncoding.UTF8);
  Assert.IsTrue(e = o, mode+' does not match for '+name);
end;

procedure TDifferenceEngineTest.execCase(name: String; mode : String; input: TFhirResource; diff: TFhirParameters; output: TFhirResource);
var
  engine : TDifferenceEngine;
  delta : TFhirParameters;
  outcome : TFhirResource;
  html : String;
begin
  if (mode = 'both') or (mode = 'reverse') then
  begin
    engine := TDifferenceEngine.Create(TTestingWorkerContext.Use);
    try
      delta := engine.generateDifference(input, output, html);
      try
        compareXml(name, 'Difference', diff, delta);
      finally
        delta.Free;
      end;
    finally
      engine.free;
    end;
  end;

  if (mode = 'both') or (mode = 'forwards') then
  begin
    engine := TDifferenceEngine.Create(TTestingWorkerContext.Use);
    try
      outcome := engine.applyDifference(input, diff) as TFhirResource;
      try
        compareXml(name, 'Output', output, outcome);
      finally
        outcome.Free;
      end;
    finally
      engine.free;
    end;
  end;

end;

function TDifferenceEngineTest.parseResource(elem: IXMLDOMElement): TFhirResource;
var
  p : TFHIRXmlParser;
begin
  p := TFHIRXmlParser.Create(nil, 'en');
  try
    p.Element := TMsXmlParser.FirstChild(elem);
    p.Parse;
    result := p.resource.Link;
  finally
    p.Free;
  end;

end;

initialization
  TDUnitX.RegisterTestFixture(TDifferenceEngineTest);
  TDUnitX.RegisterTestFixture(TDifferenceEngineTests);
end.
