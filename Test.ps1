$$	Contains the last token in the last line received by the session.
$?	
Contains the execution status of the last operation. Equivalent to %errorlevel% in the CMD shell. See also $LastExitCode below.
It contains TRUE if the last operation succeeded and FALSE if it failed. ReadOnly, AllScope

In PowerShell versions 1—6, containing a statement within parentheses (...), subexpression syntax $(...) or array expression @(...) will always reset $? to True, so that (Write-Error) shows $? as True.
This has been changed in PowerShell 7, so that $? will always reflect the actual success of the last command run in these expressions.

In the case of calling an external program, if any information output is passed to stderr then PowerShell will set $? to $false.
External console / terminal programs communicate their success status solely via their exit code, which PowerShell reflects in the automatic $LASTEXITCODE variable, see below.

$^	Contains the first token in the last line received by the session.
$_	
Contains the current object in the pipeline.
You can use this variable in commands that perform an action on every object or on selected objects in a pipeline:

In a foreach-object cmdlet to represent the current object from the pipeline.
In a try-catch clause to contain the error information as an object of type ErrorRecord.
In a switch statement to contain the value of the expression passed to the switch statement
$Allnodes	This variable is available inside of a DSC configuration document when configuration data has been passed into it by using the -ConfigurationData parameter.
For more information, see "Separating Configuration and Environment Data"
$Args	Contains an array of the undeclared parameters and/or parameter values that are passed to a function, script, or script block. When you create a function, you can declare the parameters by using the param keyword or by adding a comma-separated list of parameters in parentheses after the function name.
$ConsoleFileName	Contains the path of the console file (.psc1) that was most recently used in the session. This variable is populated when you start PowerShell with the PSConsoleFile parameter or when you use the Export-Console cmdlet to export snap-in names to a console file.

When you use the Export-Console cmdlet without parameters, it automatically updates the console file that was most recently used in the session. You can use this automatic variable to determine which file will be updated.
ReadOnly, AllScope
$Error	Contains an array of error objects that represent the most recent errors. Constant
The most recent error is the first error object in the array ($Error[0]). Function to unwrap the error array via Idera.
$ErrorView	Contains the value controlling the view in which errors are displayed.
The $ErrorView variable accepts strings or ErrorView objects and has a default value of ConciseView. If a string other than an accepted value is defined, an error is thrown.
Accepted values:
CategoryView - Only displays the error category information.
ConciseView - Only displays the error message. If the error is a parser error or comes from a script, a location pointer is included. This view was added in PowerShell 7.0
NormalView - Provides a standard PowerShell error view containing the error message, location, category info and more.
$Event	Contains a PSEventArgs object that represents the event that is being processed. This variable is populated only within the Action block of an event registration command, such as Register-ObjectEvent. The value of this variable is the same object that the Get-Event cmdlet returns. Therefore, you can use the properties of the $Event variable, such as $Event.TimeGenerated , in an Action script block.
$EventArgs	Contains an object that represents the first event argument that derives from EventArgs of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceEventArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$EventSubscriber	Contains a PSEventSubscriber object that represents the event subscriber of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable is the same object that the Get-EventSubscriber cmdlet returns.
$ExecutionContext	Contains an EngineIntrinsics object that represents the execution context of the Windows PowerShell host. You can use this variable to find the execution objects that are available to cmdlets. Constant, AllScope
$False	Contains FALSE. You can use this variable to represent FALSE in commands and scripts instead of using the string "false". The string can be interpreted as TRUE if it is converted to a non-empty string or to a non-zero integer. Constant, AllScope
$ForEach	Contains the enumerator of a ForEach-Object loop. You can use the properties and methods of enumerators on the value of the $ForEach variable. This variable exists only while the For loop is running. It is deleted when the loop is completed. [More]
$HOME	Contains the full path of the user's home directory. ReadOnly, AllScope This variable is the equivalent of the %HomeDrive%%HomePath% environment variables, typically C:\Users\<user>
$Host	Contains an object that represents the current host application for Windows PowerShell. You can use this variable to represent the current host in commands or to display or change the properties of the host, such as $Host.version or $Host.CurrentCulture, or $host.ui.rawui.setbackgroundcolor("Red"). Constant, AllScope
$Input	
An enumerator that contains the input that is passed to a function. The $Input variable is case-sensitive and is available only in functions and in script blocks. (Script blocks are essentially unnamed functions.)

In a function without a Begin, Process, or End block, the $Input variable enumerates the collection of all input to the function.
In the Begin block, the $Input variable contains no data.
In the Process block, the $Input variable contains the object that is currently in the pipeline.
In the End block, the $Input variable enumerates the collection of all input to the function.
You cannot use the $Input variable inside both the Process block and the End block in the same function or script block.

Since $Input is an enumerator, accessing any of its properties causes $input to no longer be available.
You can store $Input in another variable to reuse the $Input properties.

Enumerators contain properties and methods you can use to retrieve loop values and change the current loop iteration [More].

The $Input variable is also available to the command specified by the -Command parameter of pwsh when invoked from the command line. The following example is run from the Windows Command shell. Echo Hello | pwsh -Command """$input World!"""

$IsCoreCLR	Contains $True if the current session is running on the .NET Core Runtime (CoreCLR). Otherwise contains $False.
$IsLinux	Contains $True if the current session is running on a Linux operating system. Otherwise contains $False.
$IsMacOS	Contains $True if the current session is running on a MacOS operating system. Otherwise contains $False.
$IsWindows	Contains $TRUE if the current session is running on a Windows operating system. Otherwise contains $FALSE.
$LastExitCode	Contains the exit code of the last Windows-based program that was run.
If ($LASTEXITCODE -eq 0) { "It worked!" }
$Matches	The $Matches variable works with the -match and -not match operators. When you submit scalar input to the -match or -notmatch operator, and either one detects a match, they return a Boolean value and populate the $Matches automatic variable with a hash table of any string values that were matched. For more information about the -match operator, see about_comparison_operators.
$MyInvocation	
Contains an object with information about the current command, such as a script, function, or script block. You can use the information in the object, such as the path and file name of the script ($myinvocation.mycommand.path) or the name of a function ($myinvocation.mycommand.name) to identify the current command.

Beginning in PowerShell 3.0, MyInvocation has the following new properties:

PSScriptRoot - Contains the full path to the script that invoked the current command. The value of this property is populated only when the caller is a script.
PSCommandPath - Contains the full path and file name of the script that invoked the current command. The value of this property is populated only when the caller is a script.
Unlike the $PSScriptRoot and $PSCommandPath automatic variables, the PSScriptRoot and PSCommandPath properties of the $MyInvocation automatic variable contain information about the invoker or calling script, not the current script.

See also $PSScriptRoot

$NestedPromptLevel	Contains the current prompt level. A value of 0 indicates the original prompt level. The value is incremented when you enter a nested level and decremented when you exit it. For example, Windows PowerShell presents a nested command prompt when you use the $Host.EnterNestedPrompt method. Windows PowerShell also presents a nested command prompt when you reach a breakpoint in the Windows PowerShell debugger. When you enter a nested prompt, Windows PowerShell pauses the current command, saves the execution context, and increments the value of the $NestedPromptLevel variable. To create additional nested command prompts (up to 128 levels) or to return to the original command prompt, complete the command, or type "exit". The $NestedPromptLevel variable helps you track the prompt level. You can create an alternative Windows PowerShell command prompt that includes this value so that it is always visible.
$NULL	Contains a NULL or empty value. A scalar value that contains nothing. PowerShell treats $null as an object with a value, that is, as an explicit placeholder, so you can use $null to represent an empty value in a series of values.
$OFS	$OFS is a special variable that stores a string that you want to use as an output field separator. Use this variable when you are converting an array to a string. By default, the value of $OFS is " ", but you can change the value of $OFS in your session, by typing $OFS="value". If you are expecting the default value of " " in your script, module, or configuration output, be careful that the $OFS default value has not been changed elsewhere in your code.
$PID	Contains the process identifier (PID) of the process that is hosting the current Windows PowerShell session. Constant, AllScope
If you stop this process, you will brute force kill the PowerShell host that is executing the script.
$Profile	Contains the full path of the Windows PowerShell profile for the current user and the current host application. You can use this variable to represent the profile in commands. For example, you can use it in a command to determine whether a profile has been created: test-path $profile Or, you can use it in a command to create a profile: new-item -type file -path $pshome -force You can also use it in a command to open the profile in Notepad: notepad $profile
$PSBoundParameters	Contains a dictionary of the active parameters and their current values. This variable has a value only in a scope where parameters are declared, such as a script or function. You can use it to display or change the current values of parameters or to pass parameter values to another script or function. For example: function test { param($a, $b) # Display the parameters in dictionary format. $psboundparameters # Call the Test1 function with $a and $b. test1 @psboundparameters }
$PsCmdlet	Contains an object that represents the cmdlet or advanced function that is being run. You can use the properties and methods of the object in your cmdlet or function code to respond to the conditions of use. For example, the ParameterSetName property contains the name of the parameter set that is being used, and the ShouldProcess method adds the WhatIf and Confirm parameters to the cmdlet dynamically. For more information about the $PSCmdlet automatic variable, see about_Functions_Advanced.
$PSCommandPath	Contains the full path and file name of the script that is being run. This variable is valid in all scripts.
$PsCulture	Contains the name of the culture currently in use in the operating system. The culture determines the display format of items such as numbers, currrency, and dates. This is the value of the System.Globalization.CultureInfo.CurrentCulture.Name property of the system. To get the System.Globalization.CultureInfo object for the system, use Get-Culture. ReadOnly, AllScope
$PSDebugContext	While debugging, this variable contains information about the debugging environment. Otherwise, it contains a NULL value. As a result, you can use it to indicate whether the debugger has control. When populated, it contains a PsDebugContext object that has Breakpoints and InvocationInfo properties. The InvocationInfo property has several useful properties, including the Location property. The Location property indicates the path of the script that is being debugged.
$PsHome	Contains the full path of the installation directory for Windows PowerShell, Constant, AllScope
Typically, %windir%\System32\WindowsPowerShell\v1.0
You can use this variable in the paths of Windows PowerShell files. For example, the following command searches the conceptual Help topics for the word "variable": select-string -pattern variable -path $pshome\*.txt
$PSitem	Represents the current input object, this is exactly the same as $_ it just provides an alternative name to make your pipeline code easier to read. Available in PowerShell 3.0 and greater.
$PSScriptRoot	Contains the directory from which the script or script module is being executed.
This variable allows scripts to use the module path to access other resources. In PowerShell 3.0+ this is available everywhere, not just in modules.
$PSScriptRoot will only be populated if the script has been saved to file and the entire file is executed, i.e. by pressing F5.
If only a selection of code is executed using F8, $PSScriptRoot will be empty.
$PSSenderInfo	Contains information about the user who started the PSSession, including the user identity and the time zone of the originating computer. This variable is available only in PSSessions.
The $PSSenderInfo variable includes a user-configurable property, ApplicationArguments, which, by default, contains only the $PSVersionTable from the originating session. To add data to the ApplicationArguments property, use the ApplicationArguments parameter of the New-PSSessionOption cmdlet.
$PsUICulture	Contains the name of the user interface (UI) culture that is currently in use in the operating system. The UI culture determines which text strings are used for user interface elements, such as menus and messages. This is the value of the System.Globalization.CultureInfo.CurrentUICulture.Name property of the system. To get the System.Globalization.CultureInfo object for the system, use Get-UICulture. ReadOnly, AllScope
$PsVersionTable	Contains a read-only hash table (Constant, AllScope) that displays details about the version of PowerShell that is running in the current session. The table includes the following items:
  CLRVersion          The version of the common language runtime (CLR)
  BuildVersion        The build number of the current version
  PSVersion           The Windows PowerShell version number
  WSManStackVersion      The version number of the WS-Management stack
  PSCompatibleVersions   Versions of PowerShell that are compatible with the current version.
  SerializationVersion   The version of the serialization method
  PSRemotingProtocolVersion  The version of the PowerShell remote management protocol
  SerializationVersion  The version of the serialization method
  WSManStackVersion     The version number of the WS-Management stack
$Pwd	Contains a path object that represents the full path of the current directory.
PowerShell supports multiple runspaces per process. Each runspace has its own current directory. This is not the same as the current directory of the process: [System.Environment]::CurrentDirectory
$Sender	Contains the object that generated this event. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the Sender property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$ShellID	Contains the identifier of the current shell. Constant, AllScope
$SourceArgs	Contains objects that represent the event arguments of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$SourceEventArgs	Contains an object that represents the first event argument that derives from EventArgs of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$switch	Contains the enumerator, not the resulting values, of a Switch statement.
The $switch variable exists only while the Switch statement is running; it's deleted when the switch statement completes execution. For more information, see about_Switch. Enumerators contain properties and methods you can use to retrieve loop values and change the current loop iteration [More].
$StackTrace	Contains a stack trace for the most recent error.
$This	In a script block that defines a script property or script method, the $This variable refers to the object that is being extended.
In a custom class, the $this variable refers to the class object itself allowing access to properties and methods defined in the class.
$True	Contains TRUE. You can use this variable to represent TRUE in commands and scripts. Constant, AllScope