﻿Library InstallHelper;

uses
  FastMM4 in '..\..\Library\Core\FastMem\FastMM4.pas',
  WIndows,
  SysUtils,
  OdbcCore in '..\..\Libraries\db\OdbcCore.pas',
  OdbcExtras in '..\..\Libraries\db\OdbcExtras.pas',
  OdbcHeaders in '..\..\Libraries\db\OdbcHeaders.pas',
  IdSoapDebug in '..\..\Libraries\indysoap\IdSoapDebug.pas',
  IdSoapResourceStrings in '..\..\Libraries\indysoap\IdSoapResourceStrings.pas',
  OdbcImplementation in '..\..\Libraries\db\OdbcImplementation.pas',
  RegExpr in '..\..\reference-platform\support\RegExpr.pas',
  EncodeSupport in '..\..\reference-platform\Support\EncodeSupport.pas',
  StringSupport in '..\..\reference-platform\Support\StringSupport.pas',
  MathSupport in '..\..\reference-platform\Support\MathSupport.pas',
  SystemSupport in '..\..\reference-platform\Support\SystemSupport.pas',
  DateSupport in '..\..\reference-platform\Support\DateSupport.pas',
  MemorySupport in '..\..\reference-platform\Support\MemorySupport.pas',
  ErrorSupport in '..\..\reference-platform\Support\ErrorSupport.pas',
  ThreadSupport in '..\..\reference-platform\Support\ThreadSupport.pas',
  BytesSupport in '..\..\reference-platform\Support\BytesSupport.pas',
  AdvStringBuilders in '..\..\reference-platform\Support\AdvStringBuilders.pas',
  AdvObjects in '..\..\reference-platform\Support\AdvObjects.pas',
  AdvExceptions in '..\..\reference-platform\Support\AdvExceptions.pas',
  AdvFactories in '..\..\reference-platform\Support\AdvFactories.pas',
  FileSupport in '..\..\reference-platform\Support\FileSupport.pas',
  AdvControllers in '..\..\reference-platform\Support\AdvControllers.pas',
  AdvPersistents in '..\..\reference-platform\Support\AdvPersistents.pas',
  AdvFilers in '..\..\reference-platform\Support\AdvFilers.pas',
  ColourSupport in '..\..\reference-platform\Support\ColourSupport.pas',
  AdvPersistentLists in '..\..\reference-platform\Support\AdvPersistentLists.pas',
  AdvObjectLists in '..\..\reference-platform\Support\AdvObjectLists.pas',
  AdvItems in '..\..\reference-platform\Support\AdvItems.pas',
  AdvCollections in '..\..\reference-platform\Support\AdvCollections.pas',
  AdvIterators in '..\..\reference-platform\Support\AdvIterators.pas',
  AdvClassHashes in '..\..\reference-platform\Support\AdvClassHashes.pas',
  AdvHashes in '..\..\reference-platform\Support\AdvHashes.pas',
  HashSupport in '..\..\reference-platform\Support\HashSupport.pas',
  AdvStringHashes in '..\..\reference-platform\Support\AdvStringHashes.pas',
  AdvStringIntegerMatches in '..\..\reference-platform\Support\AdvStringIntegerMatches.pas',
  AdvStreams in '..\..\reference-platform\Support\AdvStreams.pas',
  AdvParameters in '..\..\reference-platform\Support\AdvParameters.pas',
  AdvFiles in '..\..\reference-platform\Support\AdvFiles.pas',
  AdvMemories in '..\..\reference-platform\Support\AdvMemories.pas',
  AdvBuffers in '..\..\reference-platform\Support\AdvBuffers.pas',
  AdvStreamFilers in '..\..\reference-platform\Support\AdvStreamFilers.pas',
  AdvExclusiveCriticalSections in '..\..\reference-platform\Support\AdvExclusiveCriticalSections.pas',
  AdvThreads in '..\..\reference-platform\Support\AdvThreads.pas',
  AdvSignals in '..\..\reference-platform\Support\AdvSignals.pas',
  AdvSynchronizationRegistries in '..\..\reference-platform\Support\AdvSynchronizationRegistries.pas',
  AdvTimeControllers in '..\..\reference-platform\Support\AdvTimeControllers.pas',
  AdvInt64Matches in '..\..\reference-platform\Support\AdvInt64Matches.pas',
  AdvLargeIntegerMatches in '..\..\reference-platform\Support\AdvLargeIntegerMatches.pas',
  AdvStringLargeIntegerMatches in '..\..\reference-platform\Support\AdvStringLargeIntegerMatches.pas',
  AdvStringLists in '..\..\reference-platform\Support\AdvStringLists.pas',
  AdvCSVFormatters in '..\..\reference-platform\Support\AdvCSVFormatters.pas',
  AdvTextFormatters in '..\..\reference-platform\Support\AdvTextFormatters.pas',
  AdvFormatters in '..\..\reference-platform\Support\AdvFormatters.pas',
  AdvCSVExtractors in '..\..\reference-platform\Support\AdvCSVExtractors.pas',
  AdvTextExtractors in '..\..\reference-platform\Support\AdvTextExtractors.pas',
  AdvExtractors in '..\..\reference-platform\Support\AdvExtractors.pas',
  AdvCharacterSets in '..\..\reference-platform\Support\AdvCharacterSets.pas',
  AdvOrdinalSets in '..\..\reference-platform\Support\AdvOrdinalSets.pas',
  AdvStreamReaders in '..\..\reference-platform\Support\AdvStreamReaders.pas',
  AdvStringStreams in '..\..\reference-platform\Support\AdvStringStreams.pas',
  AdvStringMatches in '..\..\reference-platform\Support\AdvStringMatches.pas',
  AdvXMLEntities in '..\..\reference-platform\Support\AdvXMLEntities.pas',
  AdvXMLFormatters in '..\..\reference-platform\Support\AdvXMLFormatters.pas',
  AdvDispatchers in '..\..\reference-platform\support\AdvDispatchers.pas',
  CurrencySupport in '..\..\reference-platform\support\CurrencySupport.pas',
  AdvProfilers in '..\..\reference-platform\support\AdvProfilers.pas',
  AdvIntegerMatches in '..\..\reference-platform\support\AdvIntegerMatches.pas',
  AdvEvents in '..\..\reference-platform\support\AdvEvents.pas',
  AdvMethods in '..\..\reference-platform\support\AdvMethods.pas',
  AdvIntegerLists in '..\..\reference-platform\support\AdvIntegerLists.pas',
  KDate in '..\..\reference-platform\support\KDate.pas',
  KDBManager in '..\..\Libraries\db\KDBManager.pas',
  kCritSct in '..\..\reference-platform\support\kCritSct.pas',
  KSettings in '..\..\Libraries\db\KSettings.pas',
  KDBLogging in '..\..\Libraries\db\KDBLogging.pas',
  KDBDialects in '..\..\reference-platform\support\KDBDialects.pas',
  DateAndTime in '..\..\reference-platform\support\DateAndTime.pas',
  DecimalSupport in '..\..\reference-platform\support\DecimalSupport.pas',
  GUIDSupport in '..\..\reference-platform\support\GUIDSupport.pas',
  HL7V2DateSupport in '..\..\reference-platform\support\HL7V2DateSupport.pas',
  AdvGenerics in '..\..\reference-platform\support\AdvGenerics.pas',
  KDBOdbcExpress in '..\..\Libraries\db\KDBOdbcExpress.pas';

function StrToPChar(AStr: AnsiString): PAnsiChar;
begin
  if AStr = '' then
    Result := NIL
  else
    begin
    AStr := AStr + #0;
    GetMem(Result, Length(AStr) + 1);
    Move(AStr[1], Result^, Length(AStr));
    end;
end;

procedure CommaAdd(var AStr: AnsiString; AStrToAdd: AnsiString);
begin
  if AStr = '' then
    AStr := AStrToAdd
  else
    AStr := AStr + ', ' + AStrToAdd;
end;

function GetString(name : AnsiString):AnsiString;
var
  odbc: TOEAdministrator;
  rex : TRegExpr;
  i : integer;
Begin
  if name = 'dbcfg-drivers' then
  begin
    result := '';
    odbc := TOEAdministrator.create(THenv.create);
    try
      odbc.DataSourceType := dsSystem;
      rex := TRegExpr.create;
      try
        rex.Expression := '^.*sql.*$';
        for i := 0 to odbc.Drivers.count -1  do
          if rex.exec(lowercase(odbc.Drivers[i])) then
            CommaAdd(result, ansiString(odbc.Drivers[i]));
      finally
        rex.Free;
      end;
//      showmessage('drivers = '+result);
    finally
      odbc.free;
    end;
  end
  else
    result := 'Unknown ('+name+')';
end;

Function MyDllGetString(name : PAnsiChar) : PAnsiChar; stdcall;
begin
  result := StrToPChar(GetString(name));
end;

Function MyDllCheckDatabase(Server, Database, Username, Password, Version : PAnsiChar) : PAnsiChar; stdcall;
var
  conn : TKDBManager;
  db : TKDBConnection;
  meta : TKDBMetaData;
  ver : String;
begin
  try
    conn := TKDBOdbcDirect.Create('config', 1, 0, 'SQL Server Native Client 11.0', server, database, username, password);
    try
      db := conn.GetConnection('test');
      try
        meta := db.FetchMetaData;
        try
          try
            ver := db.Lookup('Config', 'ConfigKey', '8', 'Value', '');
            if (ver <> Version) then
              result := StrToPchar(ver)
            else
              result := nil;
          except
            result := StrToPchar('dbi');
          end;
        finally
          meta.free;
        end;
        db.Release;
      except
        on e : exception do
        begin
          db.Error(e);
          raise;
        end;
      end;
    finally
      conn.free;
    end;
  except
    on e:exception do
      result := StrToPchar(e.Message);
  end;
end;

Type
  TInstallerCallback = procedure(IntParam: Integer; StrParam: WideString) of object;

  TCommandCapturer = class (TAdvObject)
  private
    carry : String;
    callback : TInstallerCallback;
    procedure process(dBuffer: array of Char);
    procedure processLine(s : String);
  public
    procedure Execute(CommandLine, WorkDir : string);
  end;

procedure msg(s : String);
begin
//  MessageBox(0, PWideChar(s), 'installer', MB_OK);
end;

procedure TCommandCapturer.Execute(CommandLine, WorkDir: string);
const
  CReadBuffer = 2400;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dBuffer: array [0 .. CReadBuffer] of Char;
  dRead: DWORD;
  dRunning: DWORD;
  dAvailable: DWORD;
begin
  msg(commandLine);
  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := true;
  saSecurity.lpSecurityDescriptor := nil;
  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
    try
      msg('piped');
      FillChar(suiStartup, SizeOf(TStartupInfo), #0);
      suiStartup.cb := SizeOf(TStartupInfo);
      suiStartup.hStdInput := hRead;
      suiStartup.hStdOutput := hWrite;
      suiStartup.hStdError := hWrite;
      suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      suiStartup.wShowWindow := SW_HIDE;
      if CreateProcess(nil, PChar(CommandLine), @saSecurity, @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, pchar(workdir), suiStartup,
        piProcess) then
        try
          msg('executed');
          repeat
            dRunning := WaitForSingleObject(piProcess.hProcess, 100);
            PeekNamedPipe(hRead, nil, 0, nil, @dAvailable, nil);
            if (dAvailable > 0) then
              repeat
                dRead := 0;
                ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
                pBuffer[dRead] := #0;
                OemToCharW(pBuffer, dBuffer);
                try
                  Process(dBuffer);
                except
                  TerminateProcess(piProcess.hProcess, 0);
                  raise;
                end;
              until (dRead < CReadBuffer);
              sleep(50);
          until (dRunning <> WAIT_TIMEOUT);
        finally
          CloseHandle(piProcess.hProcess);
          CloseHandle(piProcess.hThread);
        end
      else
        RaiseLastWin32Error;
    finally
      CloseHandle(hRead);
      CloseHandle(hWrite);
    end;
end;

procedure TCommandCapturer.process(dBuffer: array of Char);
var
  s : String;
  lines : TArray<String>;
  i : integer;
begin
  s := carry+dBuffer;
  lines := s.split(['♪◙']);
  for i := 0 to length(lines) - 2 do
    processLine(lines[i]);
  carry := lines[length(lines) - 1];
end;

procedure TCommandCapturer.processLine(s: String);
var
  l, r : String;
begin
  if (s <> '') then
  begin
    msg(s);
    if (s.StartsWith('##> ')) then // ignore the rest
    begin
      StringSplit(s.Substring(4), ' ', l, r);
      if SameText(l, 'Exception') then
        raise Exception.Create(r)
      else
        CallBack(StrToIntDef(l, 0), r);
    end;
  end;
end;

Function MyDllInstallSnomed(ExeName, Source, Dest, Version : PAnsiChar; Callback: TInstallerCallback) : PAnsiChar; stdcall;
var
  cmd : TCommandCapturer;
begin
  try
    cmd := TCommandCapturer.Create;
    try
      cmd.callback := Callback;
      cmd.Execute('"'+exename+'" -installer -snomed-rf2 "'+Source+'" -sver "'+Version+'" -sdest "'+dest+'"', ExtractFilePath(exeName));
    finally
      cmd.Free;
    end;
    result := nil;
  except
    on e:exception do
      result := StrToPchar(e.Message);
  end;
end;

Function MyDllInstallDatabase(ExeName, IniFile, Password : PAnsiChar; load : PAnsiChar; Callback: TInstallerCallback) : PAnsiChar; stdcall;
var
  cmd : TCommandCapturer;
begin
  try
    cmd := TCommandCapturer.Create;
    try
      cmd.callback := Callback;
      if (load = nil) then
        cmd.Execute('"'+exename+'" -installer -remount -password "'+Password+'" -ini "'+IniFile+'+', ExtractFilePath(exeName))
      else
        cmd.Execute('"'+exename+'" -installer -remount -password "'+Password+'" -ini "'+IniFile+'" -load "'+load+'"', ExtractFilePath(exeName));
    finally
      cmd.Free;
    end;
    result := nil;
  except
    on e:exception do
      result := StrToPchar(e.Message);
  end;
end;

exports MyDllGetString;
exports MyDllCheckDatabase;
exports MyDllInstallSnomed;
exports MyDllInstallDatabase;

End.

