##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=angelscript
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/septem/septemmudcl
ProjectPath            :=/home/ken/git-repos/septem/septemmudcl/angelscript
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=ken
Date                   :=28/03/17
CodeLitePath           :=/home/ken/.codelite
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/lib$(ProjectName).a
Preprocessors          :=$(PreprocessorSwitch)AS_USE_STLNAMES=1 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="angelscript.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../angelscript/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g --std=c++14 $(Preprocessors)
CFLAGS   :=  -g $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory) $(OutputFile)

$(OutputFile): $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo $(Objects1) >> $(ObjectsFileList)
	$(AR) $(ArchiveOutputSwitch)$(OutputFile) @$(ObjectsFileList) $(ArLibs)
	@$(MakeDirCommand) "/home/ken/git-repos/septem/septemmudcl/.build-debug"
	@echo rebuilt > "/home/ken/git-repos/septem/septemmudcl/.build-debug/angelscript"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


./Debug:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(ObjectSuffix): ../../angelscript/source/as_string.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_string.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(DependSuffix): ../../angelscript/source/as_string.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(DependSuffix) -MM ../../angelscript/source/as_string.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(PreprocessSuffix): ../../angelscript/source/as_string.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_string.cpp$(PreprocessSuffix) ../../angelscript/source/as_string.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(ObjectSuffix): ../../angelscript/source/as_scriptengine.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_scriptengine.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(DependSuffix): ../../angelscript/source/as_scriptengine.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(DependSuffix) -MM ../../angelscript/source/as_scriptengine.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(PreprocessSuffix): ../../angelscript/source/as_scriptengine.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptengine.cpp$(PreprocessSuffix) ../../angelscript/source/as_scriptengine.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(ObjectSuffix): ../../angelscript/source/as_restore.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_restore.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(DependSuffix): ../../angelscript/source/as_restore.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(DependSuffix) -MM ../../angelscript/source/as_restore.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(PreprocessSuffix): ../../angelscript/source/as_restore.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_restore.cpp$(PreprocessSuffix) ../../angelscript/source/as_restore.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(ObjectSuffix): ../../angelscript/source/as_outputbuffer.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_outputbuffer.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(DependSuffix): ../../angelscript/source/as_outputbuffer.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(DependSuffix) -MM ../../angelscript/source/as_outputbuffer.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(PreprocessSuffix): ../../angelscript/source/as_outputbuffer.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_outputbuffer.cpp$(PreprocessSuffix) ../../angelscript/source/as_outputbuffer.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(ObjectSuffix): ../../angelscript/source/as_thread.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_thread.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(DependSuffix): ../../angelscript/source/as_thread.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(DependSuffix) -MM ../../angelscript/source/as_thread.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(PreprocessSuffix): ../../angelscript/source/as_thread.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_thread.cpp$(PreprocessSuffix) ../../angelscript/source/as_thread.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_arm.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_arm.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_arm.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_arm.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_arm.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_arm.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_arm.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(ObjectSuffix): ../../angelscript/source/as_generic.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_generic.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(DependSuffix): ../../angelscript/source/as_generic.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(DependSuffix) -MM ../../angelscript/source/as_generic.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(PreprocessSuffix): ../../angelscript/source/as_generic.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_generic.cpp$(PreprocessSuffix) ../../angelscript/source/as_generic.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(ObjectSuffix): ../../angelscript/source/as_bytecode.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_bytecode.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(DependSuffix): ../../angelscript/source/as_bytecode.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(DependSuffix) -MM ../../angelscript/source/as_bytecode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(PreprocessSuffix): ../../angelscript/source/as_bytecode.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_bytecode.cpp$(PreprocessSuffix) ../../angelscript/source/as_bytecode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_x64_mingw.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_x64_mingw.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_x64_mingw.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_x64_mingw.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_x64_mingw.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_mingw.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_x64_mingw.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(DependSuffix): ../../angelscript/source/as_callfunc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(ObjectSuffix): ../../angelscript/source/as_gc.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_gc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(DependSuffix): ../../angelscript/source/as_gc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(DependSuffix) -MM ../../angelscript/source/as_gc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(PreprocessSuffix): ../../angelscript/source/as_gc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_gc.cpp$(PreprocessSuffix) ../../angelscript/source/as_gc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(ObjectSuffix): ../../angelscript/source/as_builder.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_builder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(DependSuffix): ../../angelscript/source/as_builder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(DependSuffix) -MM ../../angelscript/source/as_builder.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(PreprocessSuffix): ../../angelscript/source/as_builder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_builder.cpp$(PreprocessSuffix) ../../angelscript/source/as_builder.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(ObjectSuffix): ../../angelscript/source/as_scriptobject.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_scriptobject.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(DependSuffix): ../../angelscript/source/as_scriptobject.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(DependSuffix) -MM ../../angelscript/source/as_scriptobject.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(PreprocessSuffix): ../../angelscript/source/as_scriptobject.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptobject.cpp$(PreprocessSuffix) ../../angelscript/source/as_scriptobject.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(ObjectSuffix): ../../angelscript/source/as_atomic.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_atomic.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(DependSuffix): ../../angelscript/source/as_atomic.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(DependSuffix) -MM ../../angelscript/source/as_atomic.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(PreprocessSuffix): ../../angelscript/source/as_atomic.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_atomic.cpp$(PreprocessSuffix) ../../angelscript/source/as_atomic.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(ObjectSuffix): ../../angelscript/source/as_objecttype.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_objecttype.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(DependSuffix): ../../angelscript/source/as_objecttype.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(DependSuffix) -MM ../../angelscript/source/as_objecttype.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(PreprocessSuffix): ../../angelscript/source/as_objecttype.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_objecttype.cpp$(PreprocessSuffix) ../../angelscript/source/as_objecttype.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_ppc_64.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_ppc_64.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_ppc_64.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_ppc_64.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_ppc_64.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc_64.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_ppc_64.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(ObjectSuffix): ../../angelscript/source/as_context.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_context.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(DependSuffix): ../../angelscript/source/as_context.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(DependSuffix) -MM ../../angelscript/source/as_context.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(PreprocessSuffix): ../../angelscript/source/as_context.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_context.cpp$(PreprocessSuffix) ../../angelscript/source/as_context.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(ObjectSuffix): ../../angelscript/source/as_variablescope.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_variablescope.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(DependSuffix): ../../angelscript/source/as_variablescope.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(DependSuffix) -MM ../../angelscript/source/as_variablescope.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(PreprocessSuffix): ../../angelscript/source/as_variablescope.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_variablescope.cpp$(PreprocessSuffix) ../../angelscript/source/as_variablescope.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(ObjectSuffix): ../../angelscript/source/as_scriptcode.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_scriptcode.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(DependSuffix): ../../angelscript/source/as_scriptcode.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(DependSuffix) -MM ../../angelscript/source/as_scriptcode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(PreprocessSuffix): ../../angelscript/source/as_scriptcode.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptcode.cpp$(PreprocessSuffix) ../../angelscript/source/as_scriptcode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(ObjectSuffix): ../../angelscript/source/as_string_util.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_string_util.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(DependSuffix): ../../angelscript/source/as_string_util.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(DependSuffix) -MM ../../angelscript/source/as_string_util.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(PreprocessSuffix): ../../angelscript/source/as_string_util.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_string_util.cpp$(PreprocessSuffix) ../../angelscript/source/as_string_util.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_ppc.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_ppc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_ppc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_ppc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_ppc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_ppc.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_ppc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(ObjectSuffix): ../../angelscript/source/as_configgroup.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_configgroup.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(DependSuffix): ../../angelscript/source/as_configgroup.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(DependSuffix) -MM ../../angelscript/source/as_configgroup.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(PreprocessSuffix): ../../angelscript/source/as_configgroup.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_configgroup.cpp$(PreprocessSuffix) ../../angelscript/source/as_configgroup.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(ObjectSuffix): ../../angelscript/source/as_memory.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_memory.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(DependSuffix): ../../angelscript/source/as_memory.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(DependSuffix) -MM ../../angelscript/source/as_memory.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(PreprocessSuffix): ../../angelscript/source/as_memory.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_memory.cpp$(PreprocessSuffix) ../../angelscript/source/as_memory.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_xenon.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_xenon.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_xenon.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_xenon.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_xenon.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_xenon.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_xenon.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(ObjectSuffix): ../../angelscript/source/as_typeinfo.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_typeinfo.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(DependSuffix): ../../angelscript/source/as_typeinfo.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(DependSuffix) -MM ../../angelscript/source/as_typeinfo.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(PreprocessSuffix): ../../angelscript/source/as_typeinfo.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_typeinfo.cpp$(PreprocessSuffix) ../../angelscript/source/as_typeinfo.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_x86.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_x86.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_x86.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_x86.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_x86.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x86.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_x86.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(ObjectSuffix): ../../angelscript/source/as_globalproperty.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_globalproperty.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(DependSuffix): ../../angelscript/source/as_globalproperty.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(DependSuffix) -MM ../../angelscript/source/as_globalproperty.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(PreprocessSuffix): ../../angelscript/source/as_globalproperty.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_globalproperty.cpp$(PreprocessSuffix) ../../angelscript/source/as_globalproperty.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_sh4.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_sh4.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_sh4.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_sh4.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_sh4.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_sh4.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_sh4.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(ObjectSuffix): ../../angelscript/source/as_tokenizer.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_tokenizer.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(DependSuffix): ../../angelscript/source/as_tokenizer.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(DependSuffix) -MM ../../angelscript/source/as_tokenizer.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(PreprocessSuffix): ../../angelscript/source/as_tokenizer.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_tokenizer.cpp$(PreprocessSuffix) ../../angelscript/source/as_tokenizer.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(ObjectSuffix): ../../angelscript/source/as_compiler.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_compiler.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(DependSuffix): ../../angelscript/source/as_compiler.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(DependSuffix) -MM ../../angelscript/source/as_compiler.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(PreprocessSuffix): ../../angelscript/source/as_compiler.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_compiler.cpp$(PreprocessSuffix) ../../angelscript/source/as_compiler.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(ObjectSuffix): ../../angelscript/source/as_scriptfunction.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_scriptfunction.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(DependSuffix): ../../angelscript/source/as_scriptfunction.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(DependSuffix) -MM ../../angelscript/source/as_scriptfunction.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(PreprocessSuffix): ../../angelscript/source/as_scriptfunction.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptfunction.cpp$(PreprocessSuffix) ../../angelscript/source/as_scriptfunction.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(ObjectSuffix): ../../angelscript/source/as_scriptnode.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_scriptnode.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(DependSuffix): ../../angelscript/source/as_scriptnode.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(DependSuffix) -MM ../../angelscript/source/as_scriptnode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(PreprocessSuffix): ../../angelscript/source/as_scriptnode.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_scriptnode.cpp$(PreprocessSuffix) ../../angelscript/source/as_scriptnode.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_x64_msvc.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_x64_msvc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_x64_msvc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_x64_msvc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_x64_msvc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_msvc.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_x64_msvc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(ObjectSuffix): ../../angelscript/source/as_module.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_module.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(DependSuffix): ../../angelscript/source/as_module.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(DependSuffix) -MM ../../angelscript/source/as_module.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(PreprocessSuffix): ../../angelscript/source/as_module.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_module.cpp$(PreprocessSuffix) ../../angelscript/source/as_module.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_mips.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_mips.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_mips.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_mips.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_mips.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_mips.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_mips.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(ObjectSuffix): ../../angelscript/source/as_datatype.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_datatype.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(DependSuffix): ../../angelscript/source/as_datatype.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(DependSuffix) -MM ../../angelscript/source/as_datatype.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(PreprocessSuffix): ../../angelscript/source/as_datatype.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_datatype.cpp$(PreprocessSuffix) ../../angelscript/source/as_datatype.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(ObjectSuffix): ../../angelscript/source/as_callfunc_x64_gcc.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_callfunc_x64_gcc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(DependSuffix): ../../angelscript/source/as_callfunc_x64_gcc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(DependSuffix) -MM ../../angelscript/source/as_callfunc_x64_gcc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(PreprocessSuffix): ../../angelscript/source/as_callfunc_x64_gcc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_callfunc_x64_gcc.cpp$(PreprocessSuffix) ../../angelscript/source/as_callfunc_x64_gcc.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(ObjectSuffix): ../../angelscript/source/as_parser.cpp $(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/source/as_parser.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(DependSuffix): ../../angelscript/source/as_parser.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(DependSuffix) -MM ../../angelscript/source/as_parser.cpp

$(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(PreprocessSuffix): ../../angelscript/source/as_parser.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_source_as_parser.cpp$(PreprocessSuffix) ../../angelscript/source/as_parser.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptmath/scriptmathcomplex.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptmath/scriptmathcomplex.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(DependSuffix): ../../angelscript/add_on/scriptmath/scriptmathcomplex.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptmath/scriptmathcomplex.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptmath/scriptmathcomplex.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmathcomplex.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptmath/scriptmathcomplex.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptmath/scriptmath.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptmath/scriptmath.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(DependSuffix): ../../angelscript/add_on/scriptmath/scriptmath.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptmath/scriptmath.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptmath/scriptmath.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptmath_scriptmath.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptmath/scriptmath.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(ObjectSuffix): ../../angelscript/add_on/scripthelper/scripthelper.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scripthelper/scripthelper.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(DependSuffix): ../../angelscript/add_on/scripthelper/scripthelper.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(DependSuffix) -MM ../../angelscript/add_on/scripthelper/scripthelper.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(PreprocessSuffix): ../../angelscript/add_on/scripthelper/scripthelper.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scripthelper_scripthelper.cpp$(PreprocessSuffix) ../../angelscript/add_on/scripthelper/scripthelper.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptgrid/scriptgrid.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptgrid/scriptgrid.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(DependSuffix): ../../angelscript/add_on/scriptgrid/scriptgrid.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptgrid/scriptgrid.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptgrid/scriptgrid.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptgrid_scriptgrid.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptgrid/scriptgrid.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(ObjectSuffix): ../../angelscript/add_on/contextmgr/contextmgr.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/contextmgr/contextmgr.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(DependSuffix): ../../angelscript/add_on/contextmgr/contextmgr.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(DependSuffix) -MM ../../angelscript/add_on/contextmgr/contextmgr.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(PreprocessSuffix): ../../angelscript/add_on/contextmgr/contextmgr.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_contextmgr_contextmgr.cpp$(PreprocessSuffix) ../../angelscript/add_on/contextmgr/contextmgr.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptstdstring/scriptstdstring.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(DependSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptstdstring/scriptstdstring.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptstdstring/scriptstdstring.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(DependSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptstdstring_scriptstdstring_utils.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptstdstring/scriptstdstring_utils.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptbuilder/scriptbuilder.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptbuilder/scriptbuilder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(DependSuffix): ../../angelscript/add_on/scriptbuilder/scriptbuilder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptbuilder/scriptbuilder.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptbuilder/scriptbuilder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptbuilder_scriptbuilder.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptbuilder/scriptbuilder.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(ObjectSuffix): ../../angelscript/add_on/scripthandle/scripthandle.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scripthandle/scripthandle.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(DependSuffix): ../../angelscript/add_on/scripthandle/scripthandle.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(DependSuffix) -MM ../../angelscript/add_on/scripthandle/scripthandle.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(PreprocessSuffix): ../../angelscript/add_on/scripthandle/scripthandle.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scripthandle_scripthandle.cpp$(PreprocessSuffix) ../../angelscript/add_on/scripthandle/scripthandle.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(ObjectSuffix): ../../angelscript/add_on/datetime/datetime.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/datetime/datetime.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(DependSuffix): ../../angelscript/add_on/datetime/datetime.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(DependSuffix) -MM ../../angelscript/add_on/datetime/datetime.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(PreprocessSuffix): ../../angelscript/add_on/datetime/datetime.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_datetime_datetime.cpp$(PreprocessSuffix) ../../angelscript/add_on/datetime/datetime.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptfile/scriptfile.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptfile/scriptfile.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(DependSuffix): ../../angelscript/add_on/scriptfile/scriptfile.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptfile/scriptfile.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptfile/scriptfile.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfile.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptfile/scriptfile.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptfile/scriptfilesystem.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptfile/scriptfilesystem.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(DependSuffix): ../../angelscript/add_on/scriptfile/scriptfilesystem.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptfile/scriptfilesystem.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptfile/scriptfilesystem.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptfile_scriptfilesystem.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptfile/scriptfilesystem.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptdictionary/scriptdictionary.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptdictionary/scriptdictionary.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(DependSuffix): ../../angelscript/add_on/scriptdictionary/scriptdictionary.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptdictionary/scriptdictionary.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptdictionary/scriptdictionary.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptdictionary_scriptdictionary.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptdictionary/scriptdictionary.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptarray/scriptarray.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptarray/scriptarray.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(DependSuffix): ../../angelscript/add_on/scriptarray/scriptarray.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptarray/scriptarray.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptarray/scriptarray.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptarray_scriptarray.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptarray/scriptarray.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(ObjectSuffix): ../../angelscript/add_on/serializer/serializer.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/serializer/serializer.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(DependSuffix): ../../angelscript/add_on/serializer/serializer.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(DependSuffix) -MM ../../angelscript/add_on/serializer/serializer.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(PreprocessSuffix): ../../angelscript/add_on/serializer/serializer.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_serializer_serializer.cpp$(PreprocessSuffix) ../../angelscript/add_on/serializer/serializer.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(ObjectSuffix): ../../angelscript/add_on/weakref/weakref.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/weakref/weakref.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(DependSuffix): ../../angelscript/add_on/weakref/weakref.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(DependSuffix) -MM ../../angelscript/add_on/weakref/weakref.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(PreprocessSuffix): ../../angelscript/add_on/weakref/weakref.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_weakref_weakref.cpp$(PreprocessSuffix) ../../angelscript/add_on/weakref/weakref.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(ObjectSuffix): ../../angelscript/add_on/scriptany/scriptany.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/scriptany/scriptany.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(DependSuffix): ../../angelscript/add_on/scriptany/scriptany.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(DependSuffix) -MM ../../angelscript/add_on/scriptany/scriptany.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(PreprocessSuffix): ../../angelscript/add_on/scriptany/scriptany.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_scriptany_scriptany.cpp$(PreprocessSuffix) ../../angelscript/add_on/scriptany/scriptany.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(ObjectSuffix): ../../angelscript/add_on/debugger/debugger.cpp $(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/angelscript/add_on/debugger/debugger.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(DependSuffix): ../../angelscript/add_on/debugger/debugger.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(DependSuffix) -MM ../../angelscript/add_on/debugger/debugger.cpp

$(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(PreprocessSuffix): ../../angelscript/add_on/debugger/debugger.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_angelscript_add_on_debugger_debugger.cpp$(PreprocessSuffix) ../../angelscript/add_on/debugger/debugger.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


