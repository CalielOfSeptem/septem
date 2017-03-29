##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=se7en
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/Se7enMud/se7enmudcl
ProjectPath            :=/home/ken/git-repos/Se7enMud/se7enmudcl/se7en
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)AS_USE_STLNAMES=1 $(PreprocessorSwitch)AS_STRING_OBJNAME=\"string\" $(PreprocessorSwitch)_CRT_SECURE_NO_WARNINGS $(PreprocessorSwitch)AS_NO_EXCEPTIONS 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="se7en.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -lz
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../telnetpp/include $(IncludeSwitch)../../terminalpp/include $(IncludeSwitch)../../ttvfs/ttvfs $(IncludeSwitch)../../odin/include $(IncludeSwitch)../../se7en/include $(IncludeSwitch)../../se7en/include/script $(IncludeSwitch)../../se7en/include/scriptable_entities $(IncludeSwitch)../../../cereal/include $(IncludeSwitch)../../AngelscriptUtils/src $(IncludeSwitch)../../sol2 $(IncludeSwitch)../lua/src $(IncludeSwitch)../../plog/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)pthread $(LibrarySwitch)boost_system $(LibrarySwitch)boost_program_options $(LibrarySwitch)boost_filesystem $(LibrarySwitch)odin $(LibrarySwitch)telnetpp $(LibrarySwitch)terminalpp $(LibrarySwitch)cryptopp $(LibrarySwitch)ttvfs $(LibrarySwitch)angelscript $(LibrarySwitch)AngelscriptUtils $(LibrarySwitch)lua 
ArLibs                 :=  "pthread" "boost_system" "boost_program_options" "boost_filesystem" "odin" "telnetpp" "terminalpp" "cryptopp" "ttvfs" "angelscript" "AngelscriptUtils" "lua" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/usr/lib/x86_64-linux-gnu/ $(LibraryPathSwitch)../odin/Debug $(LibraryPathSwitch)../telnetpp/Debug $(LibraryPathSwitch)../terminalpp/Debug $(LibraryPathSwitch)../ttvfs/Debug $(LibraryPathSwitch)../angelscript/Debug $(LibraryPathSwitch)../AngelscriptUtils/Debug $(LibraryPathSwitch)../lua/build $(LibraryPathSwitch)/usr/local/bin/ 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -std=c++14 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_account.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(ObjectSuffix) 



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
$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(ObjectSuffix): ../../se7en/src/communication.cpp $(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/communication.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(DependSuffix): ../../se7en/src/communication.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(DependSuffix) -MM ../../se7en/src/communication.cpp

$(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(PreprocessSuffix): ../../se7en/src/communication.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_communication.cpp$(PreprocessSuffix) ../../se7en/src/communication.cpp

$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(ObjectSuffix): ../../se7en/src/account_manager.cpp $(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/account_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(DependSuffix): ../../se7en/src/account_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(DependSuffix) -MM ../../se7en/src/account_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(PreprocessSuffix): ../../se7en/src/account_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_account_manager.cpp$(PreprocessSuffix) ../../se7en/src/account_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(ObjectSuffix): ../../se7en/src/main.cpp $(IntermediateDirectory)/up_up_se7en_src_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(DependSuffix): ../../se7en/src/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(DependSuffix) -MM ../../se7en/src/main.cpp

$(IntermediateDirectory)/up_up_se7en_src_main.cpp$(PreprocessSuffix): ../../se7en/src/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_main.cpp$(PreprocessSuffix) ../../se7en/src/main.cpp

$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(ObjectSuffix): ../../se7en/src/account.cpp $(IntermediateDirectory)/up_up_se7en_src_account.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/account.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(DependSuffix): ../../se7en/src/account.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(DependSuffix) -MM ../../se7en/src/account.cpp

$(IntermediateDirectory)/up_up_se7en_src_account.cpp$(PreprocessSuffix): ../../se7en/src/account.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_account.cpp$(PreprocessSuffix) ../../se7en/src/account.cpp

$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(ObjectSuffix): ../../se7en/src/se7en.cpp $(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/se7en.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(DependSuffix): ../../se7en/src/se7en.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(DependSuffix) -MM ../../se7en/src/se7en.cpp

$(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(PreprocessSuffix): ../../se7en/src/se7en.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_se7en.cpp$(PreprocessSuffix) ../../se7en/src/se7en.cpp

$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(ObjectSuffix): ../../se7en/src/entity_manager.cpp $(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/entity_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(DependSuffix): ../../se7en/src/entity_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(DependSuffix) -MM ../../se7en/src/entity_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(PreprocessSuffix): ../../se7en/src/entity_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_entity_manager.cpp$(PreprocessSuffix) ../../se7en/src/entity_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(ObjectSuffix): ../../se7en/src/vfs/filesystem_manager.cpp $(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/vfs/filesystem_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(DependSuffix): ../../se7en/src/vfs/filesystem_manager.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(DependSuffix) -MM ../../se7en/src/vfs/filesystem_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(PreprocessSuffix): ../../se7en/src/vfs/filesystem_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_vfs_filesystem_manager.cpp$(PreprocessSuffix) ../../se7en/src/vfs/filesystem_manager.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(ObjectSuffix): ../../se7en/src/server/context_impl.cpp $(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/server/context_impl.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(DependSuffix): ../../se7en/src/server/context_impl.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(DependSuffix) -MM ../../se7en/src/server/context_impl.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(PreprocessSuffix): ../../se7en/src/server/context_impl.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_server_context_impl.cpp$(PreprocessSuffix) ../../se7en/src/server/context_impl.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(ObjectSuffix): ../../se7en/src/server/connection.cpp $(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/server/connection.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(DependSuffix): ../../se7en/src/server/connection.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(DependSuffix) -MM ../../se7en/src/server/connection.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(PreprocessSuffix): ../../se7en/src/server/connection.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_server_connection.cpp$(PreprocessSuffix) ../../se7en/src/server/connection.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(ObjectSuffix): ../../se7en/src/server/client.cpp $(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/server/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(DependSuffix): ../../se7en/src/server/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(DependSuffix) -MM ../../se7en/src/server/client.cpp

$(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(PreprocessSuffix): ../../se7en/src/server/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_server_client.cpp$(PreprocessSuffix) ../../se7en/src/server/client.cpp

$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(ObjectSuffix): ../../se7en/src/env/room.cpp $(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/Se7enMud/se7en/src/env/room.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(DependSuffix): ../../se7en/src/env/room.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(DependSuffix) -MM ../../se7en/src/env/room.cpp

$(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(PreprocessSuffix): ../../se7en/src/env/room.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_se7en_src_env_room.cpp$(PreprocessSuffix) ../../se7en/src/env/room.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


