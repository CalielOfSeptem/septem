##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=telnetpp
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/septem/septemmudcl
ProjectPath            :=/home/ken/git-repos/septem/septemmudcl/telnetpp
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
ObjectsFileList        :="telnetpp.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../telnetpp/include/ $(IncludeSwitch)../../telnetpp/src/ 
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
CXXFLAGS :=  -std=c++14 $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(ObjectSuffix) \
	



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
	@echo rebuilt > "/home/ken/git-repos/septem/septemmudcl/.build-debug/telnetpp"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


./Debug:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(ObjectSuffix): ../../telnetpp/src/server_option.cpp $(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/server_option.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(DependSuffix): ../../telnetpp/src/server_option.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(DependSuffix) -MM ../../telnetpp/src/server_option.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(PreprocessSuffix): ../../telnetpp/src/server_option.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_server_option.cpp$(PreprocessSuffix) ../../telnetpp/src/server_option.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(ObjectSuffix): ../../telnetpp/src/negotiation.cpp $(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/negotiation.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(DependSuffix): ../../telnetpp/src/negotiation.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(DependSuffix) -MM ../../telnetpp/src/negotiation.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(PreprocessSuffix): ../../telnetpp/src/negotiation.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_negotiation.cpp$(PreprocessSuffix) ../../telnetpp/src/negotiation.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(ObjectSuffix): ../../telnetpp/src/client_option.cpp $(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/client_option.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(DependSuffix): ../../telnetpp/src/client_option.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(DependSuffix) -MM ../../telnetpp/src/client_option.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(PreprocessSuffix): ../../telnetpp/src/client_option.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_client_option.cpp$(PreprocessSuffix) ../../telnetpp/src/client_option.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(ObjectSuffix): ../../telnetpp/src/subnegotiation.cpp $(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/subnegotiation.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(DependSuffix): ../../telnetpp/src/subnegotiation.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(DependSuffix) -MM ../../telnetpp/src/subnegotiation.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(PreprocessSuffix): ../../telnetpp/src/subnegotiation.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_subnegotiation.cpp$(PreprocessSuffix) ../../telnetpp/src/subnegotiation.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(ObjectSuffix): ../../telnetpp/src/command.cpp $(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/command.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(DependSuffix): ../../telnetpp/src/command.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(DependSuffix) -MM ../../telnetpp/src/command.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(PreprocessSuffix): ../../telnetpp/src/command.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_command.cpp$(PreprocessSuffix) ../../telnetpp/src/command.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(ObjectSuffix): ../../telnetpp/src/session.cpp $(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/session.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(DependSuffix): ../../telnetpp/src/session.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(DependSuffix) -MM ../../telnetpp/src/session.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(PreprocessSuffix): ../../telnetpp/src/session.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_session.cpp$(PreprocessSuffix) ../../telnetpp/src/session.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(ObjectSuffix): ../../telnetpp/src/byte_converter.cpp $(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/byte_converter.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(DependSuffix): ../../telnetpp/src/byte_converter.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(DependSuffix) -MM ../../telnetpp/src/byte_converter.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(PreprocessSuffix): ../../telnetpp/src/byte_converter.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_byte_converter.cpp$(PreprocessSuffix) ../../telnetpp/src/byte_converter.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(ObjectSuffix): ../../telnetpp/src/detail/registration.cpp $(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/detail/registration.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(DependSuffix): ../../telnetpp/src/detail/registration.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(DependSuffix) -MM ../../telnetpp/src/detail/registration.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(PreprocessSuffix): ../../telnetpp/src/detail/registration.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_detail_registration.cpp$(PreprocessSuffix) ../../telnetpp/src/detail/registration.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(ObjectSuffix): ../../telnetpp/src/detail/routing_visitor.cpp $(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/detail/routing_visitor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(DependSuffix): ../../telnetpp/src/detail/routing_visitor.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(DependSuffix) -MM ../../telnetpp/src/detail/routing_visitor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(PreprocessSuffix): ../../telnetpp/src/detail/routing_visitor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_detail_routing_visitor.cpp$(PreprocessSuffix) ../../telnetpp/src/detail/routing_visitor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(ObjectSuffix): ../../telnetpp/src/detail/generate_helper.cpp $(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/detail/generate_helper.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(DependSuffix): ../../telnetpp/src/detail/generate_helper.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(DependSuffix) -MM ../../telnetpp/src/detail/generate_helper.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(PreprocessSuffix): ../../telnetpp/src/detail/generate_helper.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_detail_generate_helper.cpp$(PreprocessSuffix) ../../telnetpp/src/detail/generate_helper.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(ObjectSuffix): ../../telnetpp/src/detail/parse_helper.cpp $(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/detail/parse_helper.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(DependSuffix): ../../telnetpp/src/detail/parse_helper.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(DependSuffix) -MM ../../telnetpp/src/detail/parse_helper.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(PreprocessSuffix): ../../telnetpp/src/detail/parse_helper.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_detail_parse_helper.cpp$(PreprocessSuffix) ../../telnetpp/src/detail/parse_helper.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/codec.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/codec.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/codec.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/codec.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/codec.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_codec.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/codec.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/decompressor.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/decompressor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/decompressor.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/decompressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/decompressor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_decompressor.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/decompressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/client.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_client.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/server.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/server.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/server.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/server.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_server.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(ObjectSuffix): ../../telnetpp/src/options/msdp/variable.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/msdp/variable.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(DependSuffix): ../../telnetpp/src/options/msdp/variable.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(DependSuffix) -MM ../../telnetpp/src/options/msdp/variable.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(PreprocessSuffix): ../../telnetpp/src/options/msdp/variable.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_variable.cpp$(PreprocessSuffix) ../../telnetpp/src/options/msdp/variable.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(ObjectSuffix): ../../telnetpp/src/options/msdp/client.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/msdp/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(DependSuffix): ../../telnetpp/src/options/msdp/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(DependSuffix) -MM ../../telnetpp/src/options/msdp/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(PreprocessSuffix): ../../telnetpp/src/options/msdp/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_client.cpp$(PreprocessSuffix) ../../telnetpp/src/options/msdp/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(ObjectSuffix): ../../telnetpp/src/options/msdp/server.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/msdp/server.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(DependSuffix): ../../telnetpp/src/options/msdp/server.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(DependSuffix) -MM ../../telnetpp/src/options/msdp/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(PreprocessSuffix): ../../telnetpp/src/options/msdp/server.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_server.cpp$(PreprocessSuffix) ../../telnetpp/src/options/msdp/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(ObjectSuffix): ../../telnetpp/src/options/new_environ/client.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/new_environ/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(DependSuffix): ../../telnetpp/src/options/new_environ/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(DependSuffix) -MM ../../telnetpp/src/options/new_environ/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(PreprocessSuffix): ../../telnetpp/src/options/new_environ/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_client.cpp$(PreprocessSuffix) ../../telnetpp/src/options/new_environ/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(ObjectSuffix): ../../telnetpp/src/options/new_environ/server.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/new_environ/server.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(DependSuffix): ../../telnetpp/src/options/new_environ/server.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(DependSuffix) -MM ../../telnetpp/src/options/new_environ/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(PreprocessSuffix): ../../telnetpp/src/options/new_environ/server.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_server.cpp$(PreprocessSuffix) ../../telnetpp/src/options/new_environ/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(ObjectSuffix): ../../telnetpp/src/options/naws/client.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/naws/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(DependSuffix): ../../telnetpp/src/options/naws/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(DependSuffix) -MM ../../telnetpp/src/options/naws/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(PreprocessSuffix): ../../telnetpp/src/options/naws/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_naws_client.cpp$(PreprocessSuffix) ../../telnetpp/src/options/naws/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(ObjectSuffix): ../../telnetpp/src/options/naws/server.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/naws/server.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(DependSuffix): ../../telnetpp/src/options/naws/server.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(DependSuffix) -MM ../../telnetpp/src/options/naws/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(PreprocessSuffix): ../../telnetpp/src/options/naws/server.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_naws_server.cpp$(PreprocessSuffix) ../../telnetpp/src/options/naws/server.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(ObjectSuffix): ../../telnetpp/src/options/terminal_type/client.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/terminal_type/client.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(DependSuffix): ../../telnetpp/src/options/terminal_type/client.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(DependSuffix) -MM ../../telnetpp/src/options/terminal_type/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(PreprocessSuffix): ../../telnetpp/src/options/terminal_type/client.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_terminal_type_client.cpp$(PreprocessSuffix) ../../telnetpp/src/options/terminal_type/client.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/zlib/decompressor.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/zlib/decompressor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/zlib/decompressor.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/zlib/decompressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/zlib/decompressor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_decompressor.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/zlib/decompressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(ObjectSuffix): ../../telnetpp/src/options/mccp/zlib/compressor.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/mccp/zlib/compressor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(DependSuffix): ../../telnetpp/src/options/mccp/zlib/compressor.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(DependSuffix) -MM ../../telnetpp/src/options/mccp/zlib/compressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(PreprocessSuffix): ../../telnetpp/src/options/mccp/zlib/compressor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_mccp_zlib_compressor.cpp$(PreprocessSuffix) ../../telnetpp/src/options/mccp/zlib/compressor.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(ObjectSuffix): ../../telnetpp/src/options/msdp/detail/decoder.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/msdp/detail/decoder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(DependSuffix): ../../telnetpp/src/options/msdp/detail/decoder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(DependSuffix) -MM ../../telnetpp/src/options/msdp/detail/decoder.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(PreprocessSuffix): ../../telnetpp/src/options/msdp/detail/decoder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_decoder.cpp$(PreprocessSuffix) ../../telnetpp/src/options/msdp/detail/decoder.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(ObjectSuffix): ../../telnetpp/src/options/msdp/detail/encoder.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/msdp/detail/encoder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(DependSuffix): ../../telnetpp/src/options/msdp/detail/encoder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(DependSuffix) -MM ../../telnetpp/src/options/msdp/detail/encoder.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(PreprocessSuffix): ../../telnetpp/src/options/msdp/detail/encoder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_msdp_detail_encoder.cpp$(PreprocessSuffix) ../../telnetpp/src/options/msdp/detail/encoder.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(ObjectSuffix): ../../telnetpp/src/options/new_environ/detail/response_parser.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/new_environ/detail/response_parser.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(DependSuffix): ../../telnetpp/src/options/new_environ/detail/response_parser.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(DependSuffix) -MM ../../telnetpp/src/options/new_environ/detail/response_parser.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(PreprocessSuffix): ../../telnetpp/src/options/new_environ/detail/response_parser.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_response_parser.cpp$(PreprocessSuffix) ../../telnetpp/src/options/new_environ/detail/response_parser.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(ObjectSuffix): ../../telnetpp/src/options/new_environ/detail/stream.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/new_environ/detail/stream.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(DependSuffix): ../../telnetpp/src/options/new_environ/detail/stream.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(DependSuffix) -MM ../../telnetpp/src/options/new_environ/detail/stream.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(PreprocessSuffix): ../../telnetpp/src/options/new_environ/detail/stream.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_stream.cpp$(PreprocessSuffix) ../../telnetpp/src/options/new_environ/detail/stream.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(ObjectSuffix): ../../telnetpp/src/options/new_environ/detail/request_parser.cpp $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/telnetpp/src/options/new_environ/detail/request_parser.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(DependSuffix): ../../telnetpp/src/options/new_environ/detail/request_parser.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(DependSuffix) -MM ../../telnetpp/src/options/new_environ/detail/request_parser.cpp

$(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(PreprocessSuffix): ../../telnetpp/src/options/new_environ/detail/request_parser.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_telnetpp_src_options_new_environ_detail_request_parser.cpp$(PreprocessSuffix) ../../telnetpp/src/options/new_environ/detail/request_parser.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


