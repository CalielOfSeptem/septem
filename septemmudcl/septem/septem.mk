##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=septem
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/septem/septemmudcl
ProjectPath            :=/home/ken/git-repos/septem/septemmudcl/septem
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=ken
Date                   :=08/04/17
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="septem.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -lz -ldl
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../telnetpp/include $(IncludeSwitch)../../terminalpp/include $(IncludeSwitch)../../ttvfs/ttvfs $(IncludeSwitch)../../odin/include $(IncludeSwitch)../../septem/include $(IncludeSwitch)../../septem/include/script $(IncludeSwitch)../../septem/include/scriptable_entities $(IncludeSwitch)../../../cereal/include $(IncludeSwitch)../../AngelscriptUtils/src $(IncludeSwitch)../../sol2 $(IncludeSwitch)/home/ken/git-repos/lua-5.3.4/src $(IncludeSwitch)../../plog/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)pthread $(LibrarySwitch)boost_system $(LibrarySwitch)boost_program_options $(LibrarySwitch)boost_filesystem $(LibrarySwitch)boost_thread $(LibrarySwitch)odin $(LibrarySwitch)telnetpp $(LibrarySwitch)terminalpp $(LibrarySwitch)cryptopp $(LibrarySwitch)ttvfs $(LibrarySwitch)lua 
ArLibs                 :=  "pthread" "boost_system" "boost_program_options" "boost_filesystem" "boost_thread" "odin" "telnetpp" "terminalpp" "cryptopp" "ttvfs" "lua" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/usr/lib/x86_64-linux-gnu/ $(LibraryPathSwitch)../odin/Debug $(LibraryPathSwitch)../telnetpp/Debug $(LibraryPathSwitch)../terminalpp/Debug $(LibraryPathSwitch)../ttvfs/Debug $(LibraryPathSwitch)../angelscript/Debug $(LibraryPathSwitch)../AngelscriptUtils/Debug $(LibraryPathSwitch)/home/ken/git-repos/lua-5.3.4/src $(LibraryPathSwitch)/usr/local/bin/ 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -std=c++14 -Wall -Wl,--no-as-needed -ldl $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_account.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_septem.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(ObjectSuffix): ../../septem/src/communication.cpp $(IntermediateDirectory)/up_up_septem_src_communication.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/communication.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(DependSuffix): ../../septem/src/communication.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(DependSuffix) -MM ../../septem/src/communication.cpp

$(IntermediateDirectory)/up_up_septem_src_communication.cpp$(PreprocessSuffix): ../../septem/src/communication.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_communication.cpp$(PreprocessSuffix) ../../septem/src/communication.cpp

$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(ObjectSuffix): ../../septem/src/entity_manager.cpp $(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/entity_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(DependSuffix): ../../septem/src/entity_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(DependSuffix) -MM ../../septem/src/entity_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(PreprocessSuffix): ../../septem/src/entity_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_entity_manager.cpp$(PreprocessSuffix) ../../septem/src/entity_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(ObjectSuffix): ../../septem/src/account_manager.cpp $(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/account_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(DependSuffix): ../../septem/src/account_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(DependSuffix) -MM ../../septem/src/account_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(PreprocessSuffix): ../../septem/src/account_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_account_manager.cpp$(PreprocessSuffix) ../../septem/src/account_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_main.cpp$(ObjectSuffix): ../../septem/src/main.cpp $(IntermediateDirectory)/up_up_septem_src_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_main.cpp$(DependSuffix): ../../septem/src/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_main.cpp$(DependSuffix) -MM ../../septem/src/main.cpp

$(IntermediateDirectory)/up_up_septem_src_main.cpp$(PreprocessSuffix): ../../septem/src/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_main.cpp$(PreprocessSuffix) ../../septem/src/main.cpp

$(IntermediateDirectory)/up_up_septem_src_account.cpp$(ObjectSuffix): ../../septem/src/account.cpp $(IntermediateDirectory)/up_up_septem_src_account.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/account.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_account.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_account.cpp$(DependSuffix): ../../septem/src/account.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_account.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_account.cpp$(DependSuffix) -MM ../../septem/src/account.cpp

$(IntermediateDirectory)/up_up_septem_src_account.cpp$(PreprocessSuffix): ../../septem/src/account.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_account.cpp$(PreprocessSuffix) ../../septem/src/account.cpp

$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(ObjectSuffix): ../../septem/src/septem.cpp $(IntermediateDirectory)/up_up_septem_src_septem.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/septem.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(DependSuffix): ../../septem/src/septem.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(DependSuffix) -MM ../../septem/src/septem.cpp

$(IntermediateDirectory)/up_up_septem_src_septem.cpp$(PreprocessSuffix): ../../septem/src/septem.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_septem.cpp$(PreprocessSuffix) ../../septem/src/septem.cpp

$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(ObjectSuffix): ../../septem/src/vfs/filesystem_manager.cpp $(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/vfs/filesystem_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(DependSuffix): ../../septem/src/vfs/filesystem_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(DependSuffix) -MM ../../septem/src/vfs/filesystem_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(PreprocessSuffix): ../../septem/src/vfs/filesystem_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_vfs_filesystem_manager.cpp$(PreprocessSuffix) ../../septem/src/vfs/filesystem_manager.cpp

$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(ObjectSuffix): ../../septem/src/server/context_impl.cpp $(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/server/context_impl.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(DependSuffix): ../../septem/src/server/context_impl.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(DependSuffix) -MM ../../septem/src/server/context_impl.cpp

$(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(PreprocessSuffix): ../../septem/src/server/context_impl.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_server_context_impl.cpp$(PreprocessSuffix) ../../septem/src/server/context_impl.cpp

$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(ObjectSuffix): ../../septem/src/server/connection.cpp $(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/server/connection.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(DependSuffix): ../../septem/src/server/connection.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(DependSuffix) -MM ../../septem/src/server/connection.cpp

$(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(PreprocessSuffix): ../../septem/src/server/connection.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_server_connection.cpp$(PreprocessSuffix) ../../septem/src/server/connection.cpp

$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(ObjectSuffix): ../../septem/src/server/client.cpp $(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/server/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(DependSuffix): ../../septem/src/server/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(DependSuffix) -MM ../../septem/src/server/client.cpp

$(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(PreprocessSuffix): ../../septem/src/server/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_server_client.cpp$(PreprocessSuffix) ../../septem/src/server/client.cpp

$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(ObjectSuffix): ../../septem/src/server/httpserv.cpp $(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/server/httpserv.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(DependSuffix): ../../septem/src/server/httpserv.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(DependSuffix) -MM ../../septem/src/server/httpserv.cpp

$(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(PreprocessSuffix): ../../septem/src/server/httpserv.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_server_httpserv.cpp$(PreprocessSuffix) ../../septem/src/server/httpserv.cpp

$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(ObjectSuffix): ../../septem/src/env/room.cpp $(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/septem/src/env/room.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(DependSuffix): ../../septem/src/env/room.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(DependSuffix) -MM ../../septem/src/env/room.cpp

$(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(PreprocessSuffix): ../../septem/src/env/room.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_septem_src_env_room.cpp$(PreprocessSuffix) ../../septem/src/env/room.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


