##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=terminalpp
ConfigurationName      :=Debug
WorkspacePath          :=/home/ken/git-repos/septem/septemmudcl
ProjectPath            :=/home/ken/git-repos/septem/septemmudcl/terminalpp
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
ObjectsFileList        :="terminalpp.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../../terminalpp/include/ $(IncludeSwitch)../../terminalpp/src/ 
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
CFLAGS   :=  -g $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(ObjectSuffix) 



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
	@echo rebuilt > "/home/ken/git-repos/septem/septemmudcl/.build-debug/terminalpp"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


./Debug:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(ObjectSuffix): ../../terminalpp/src/canvas.cpp $(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/canvas.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(DependSuffix): ../../terminalpp/src/canvas.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(DependSuffix) -MM ../../terminalpp/src/canvas.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(PreprocessSuffix): ../../terminalpp/src/canvas.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_canvas.cpp$(PreprocessSuffix) ../../terminalpp/src/canvas.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(ObjectSuffix): ../../terminalpp/src/terminal.cpp $(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/terminal.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(DependSuffix): ../../terminalpp/src/terminal.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(DependSuffix) -MM ../../terminalpp/src/terminal.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(PreprocessSuffix): ../../terminalpp/src/terminal.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_terminal.cpp$(PreprocessSuffix) ../../terminalpp/src/terminal.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(ObjectSuffix): ../../terminalpp/src/canvas_view.cpp $(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/canvas_view.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(DependSuffix): ../../terminalpp/src/canvas_view.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(DependSuffix) -MM ../../terminalpp/src/canvas_view.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(PreprocessSuffix): ../../terminalpp/src/canvas_view.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_canvas_view.cpp$(PreprocessSuffix) ../../terminalpp/src/canvas_view.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(ObjectSuffix): ../../terminalpp/src/string.cpp $(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/string.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(DependSuffix): ../../terminalpp/src/string.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(DependSuffix) -MM ../../terminalpp/src/string.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(PreprocessSuffix): ../../terminalpp/src/string.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_string.cpp$(PreprocessSuffix) ../../terminalpp/src/string.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(ObjectSuffix): ../../terminalpp/src/screen.cpp $(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/screen.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(DependSuffix): ../../terminalpp/src/screen.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(DependSuffix) -MM ../../terminalpp/src/screen.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(PreprocessSuffix): ../../terminalpp/src/screen.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_screen.cpp$(PreprocessSuffix) ../../terminalpp/src/screen.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(ObjectSuffix): ../../terminalpp/src/encoder.cpp $(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/encoder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(DependSuffix): ../../terminalpp/src/encoder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(DependSuffix) -MM ../../terminalpp/src/encoder.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(PreprocessSuffix): ../../terminalpp/src/encoder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_encoder.cpp$(PreprocessSuffix) ../../terminalpp/src/encoder.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(ObjectSuffix): ../../terminalpp/src/glyph.cpp $(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/glyph.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(DependSuffix): ../../terminalpp/src/glyph.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(DependSuffix) -MM ../../terminalpp/src/glyph.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(PreprocessSuffix): ../../terminalpp/src/glyph.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_glyph.cpp$(PreprocessSuffix) ../../terminalpp/src/glyph.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(ObjectSuffix): ../../terminalpp/src/virtual_key.cpp $(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/virtual_key.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(DependSuffix): ../../terminalpp/src/virtual_key.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(DependSuffix) -MM ../../terminalpp/src/virtual_key.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(PreprocessSuffix): ../../terminalpp/src/virtual_key.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_virtual_key.cpp$(PreprocessSuffix) ../../terminalpp/src/virtual_key.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(ObjectSuffix): ../../terminalpp/src/ansi/control_sequence.cpp $(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/ansi/control_sequence.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(DependSuffix): ../../terminalpp/src/ansi/control_sequence.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(DependSuffix) -MM ../../terminalpp/src/ansi/control_sequence.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(PreprocessSuffix): ../../terminalpp/src/ansi/control_sequence.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_ansi_control_sequence.cpp$(PreprocessSuffix) ../../terminalpp/src/ansi/control_sequence.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(ObjectSuffix): ../../terminalpp/src/ansi/charset.cpp $(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/ansi/charset.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(DependSuffix): ../../terminalpp/src/ansi/charset.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(DependSuffix) -MM ../../terminalpp/src/ansi/charset.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(PreprocessSuffix): ../../terminalpp/src/ansi/charset.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_ansi_charset.cpp$(PreprocessSuffix) ../../terminalpp/src/ansi/charset.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(ObjectSuffix): ../../terminalpp/src/detail/terminal_charset_control.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/terminal_charset_control.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(DependSuffix): ../../terminalpp/src/detail/terminal_charset_control.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/terminal_charset_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/terminal_charset_control.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_charset_control.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/terminal_charset_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(ObjectSuffix): ../../terminalpp/src/detail/well_known_virtual_key.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/well_known_virtual_key.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(DependSuffix): ../../terminalpp/src/detail/well_known_virtual_key.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/well_known_virtual_key.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/well_known_virtual_key.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_well_known_virtual_key.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/well_known_virtual_key.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(ObjectSuffix): ../../terminalpp/src/detail/terminal_cursor_control.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/terminal_cursor_control.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(DependSuffix): ../../terminalpp/src/detail/terminal_cursor_control.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/terminal_cursor_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/terminal_cursor_control.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_cursor_control.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/terminal_cursor_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(ObjectSuffix): ../../terminalpp/src/detail/parser.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/parser.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(DependSuffix): ../../terminalpp/src/detail/parser.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/parser.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/parser.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_parser.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/parser.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(ObjectSuffix): ../../terminalpp/src/detail/terminal_control.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/terminal_control.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(DependSuffix): ../../terminalpp/src/detail/terminal_control.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/terminal_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/terminal_control.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_terminal_control.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/terminal_control.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(ObjectSuffix): ../../terminalpp/src/detail/element_difference.cpp $(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/ken/git-repos/septem/terminalpp/src/detail/element_difference.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(DependSuffix): ../../terminalpp/src/detail/element_difference.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(DependSuffix) -MM ../../terminalpp/src/detail/element_difference.cpp

$(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(PreprocessSuffix): ../../terminalpp/src/detail/element_difference.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_terminalpp_src_detail_element_difference.cpp$(PreprocessSuffix) ../../terminalpp/src/detail/element_difference.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


