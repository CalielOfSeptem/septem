##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ttvfs
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/Se7enMud/se7enmudcl
ProjectPath            :=/home/ken/git-repos/Se7enMud/se7enmudcl/ttvfs
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=ken
Date                   :=17/03/17
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
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ttvfs.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
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
CXXFLAGS :=  -g $(Preprocessors)
CFLAGS   :=  -g $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory) $(OutputFile)

$(OutputFile): $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(AR) $(ArchiveOutputSwitch)$(OutputFile) @$(ObjectsFileList) $(ArLibs)
	@$(MakeDirCommand) "/home/ken/git-repos/Se7enMud/se7enmudcl/.build-debug"
	@echo rebuilt > "/home/ken/git-repos/Se7enMud/se7enmudcl/.build-debug/ttvfs"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


./Debug:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSRoot.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSRoot.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSRoot.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSRoot.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSRoot.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSRoot.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSRoot.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSDebug.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSDebug.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSDebug.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSDebug.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSDebug.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDebug.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSDebug.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSDir.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSDir.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSDir.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSDir.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSDir.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDir.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSDir.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSBase.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSBase.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSBase.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSBase.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSBase.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSBase.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSBase.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSDirInternal.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSDirInternal.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSDirInternal.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSDirInternal.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSDirInternal.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirInternal.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSDirInternal.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSTools.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSTools.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSTools.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSTools.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSTools.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSTools.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSTools.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSSystemPaths.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSSystemPaths.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSSystemPaths.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSSystemPaths.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSSystemPaths.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSSystemPaths.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSSystemPaths.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSFileFuncs.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSFileFuncs.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSFileFuncs.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSFileFuncs.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSFileFuncs.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFileFuncs.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSFileFuncs.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSDirView.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSDirView.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSDirView.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSDirView.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSDirView.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSDirView.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSDirView.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSLoader.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSLoader.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSLoader.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSLoader.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSLoader.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSLoader.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSLoader.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(ObjectSuffix): ../../ttvfs/ttvfs/VFSFile.cpp $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/ttvfs/ttvfs/VFSFile.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(DependSuffix): ../../ttvfs/ttvfs/VFSFile.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(DependSuffix) -MM ../../ttvfs/ttvfs/VFSFile.cpp

$(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(PreprocessSuffix): ../../ttvfs/ttvfs/VFSFile.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_ttvfs_ttvfs_VFSFile.cpp$(PreprocessSuffix) ../../ttvfs/ttvfs/VFSFile.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


