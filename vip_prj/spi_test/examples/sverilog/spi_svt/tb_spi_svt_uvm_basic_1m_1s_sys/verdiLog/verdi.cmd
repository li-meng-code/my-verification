simSetSimulator "-vcssv" -exec \
           "/home/user04/workspace/vip_prj/spi_test/examples/sverilog/spi_svt/tb_spi_svt_uvm_basic_1m_1s_sys/./output/simvcssvlog" \
           -args \
           "+UVM_TESTNAME=base_test +UVM_MAX_QUIT_COUNT=10,1 -l ./logs/simulate__base_test.log +fsdb+sva_success +UVM_VERDI_TRACE=UVM_AWARE+RAL+HIER+COMPWAVE +UVM_TR_RECORD +UVM_LOG_RECORD" \
           -uvmDebug on -simDelim
debImport "-i" "-simflow" "-dbdir" \
          "/home/user04/workspace/vip_prj/spi_test/examples/sverilog/spi_svt/tb_spi_svt_uvm_basic_1m_1s_sys/./output/simvcssvlog.daidir"
srcTBInvokeSim
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiSetActWin -win $_InteractiveConsole_2
run
verdiSetActWin -dock widgetDock_<OVM/UVM_Hier.>
uvmCreateSeqWin
uvmSeqWinQuickFilterOn
verdiSetActWin -win $_uvmDebugSequence_3
uvmSeqTreeViewColumnSort -column 3 -ascending
uvmSeqTreeViewColumnSort -column 2 -ascending
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "test_top.spi_master_if" -win $_nTrace1
verdiDockWidgetSetCurTab -dock widgetDock_<Stack>
verdiDockWidgetSetCurTab -dock widgetDock_<Class._Tree>
verdiSetActWin -dock widgetDock_<Class._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Object._Tree>
verdiSetActWin -dock widgetDock_<Object._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<OVM/UVM_Hier.>
verdiSetActWin -dock widgetDock_<OVM/UVM_Hier.>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "test_top" -win $_nTrace1
srcSetScope "test_top" -delim "." -win $_nTrace1
srcHBSelect "test_top" -win $_nTrace1
uvmCloseSeqWin
debExit
