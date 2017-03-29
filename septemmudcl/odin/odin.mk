##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=odin
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/septem/septemmudcl
ProjectPath            :=/home/ken/git-repos/septem/septemmudcl/odin
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
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="odin.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../odin/include 
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
CXXFLAGS :=  -g -O0 -Wall -std=c++14 $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(ObjectSuffix) 



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
	@$(MakeDirCommand) "/home/ken/git-repos/septem/septemmudcl/.build-debug"
	@echo rebuilt > "/home/ken/git-repos/septem/septemmudcl/.build-debug/odin"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


./Debug:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(ObjectSuffix): ../../odin/src/tokenise.cpp $(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/odin/src/tokenise.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(DependSuffix): ../../odin/src/tokenise.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(DependSuffix) -MM ../../odin/src/tokenise.cpp

$(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(PreprocessSuffix): ../../odin/src/tokenise.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_odin_src_tokenise.cpp$(PreprocessSuffix) ../../odin/src/tokenise.cpp

$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(ObjectSuffix): ../../odin/src/net/server.cpp $(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/odin/src/net/server.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(DependSuffix): ../../odin/src/net/server.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(DependSuffix) -MM ../../odin/src/net/server.cpp

$(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(PreprocessSuffix): ../../odin/src/net/server.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_odin_src_net_server.cpp$(PreprocessSuffix) ../../odin/src/net/server.cpp

$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(ObjectSuffix): ../../odin/src/net/socket.cpp $(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/odin/src/net/socket.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(DependSuffix): ../../odin/src/net/socket.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(DependSuffix) -MM ../../odin/src/net/socket.cpp

$(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(PreprocessSuffix): ../../odin/src/net/socket.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_odin_src_net_socket.cpp$(PreprocessSuffix) ../../odin/src/net/socket.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


