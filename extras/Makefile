.PHONY: default
default: all ;



XLR8_QUARTUS_SH := $(shell command -v quartus_sh 2> /dev/null )
XLR8_QUARTUS_CPF := $(shell command -v quartus_cpf 2> /dev/null )
ifndef XLR8_BOARD
	XLR8_BOARD := "sno"
endif
ifndef XLR8_FREQ
	XLR8_FREQ := "16"
endif

quartus/output_files/%MHz.sof:
	cd quartus; $(XLR8_QUARTUS_SH) --flow compile $(shell echo $(@:MHz.sof=MHz.qsf) |cut -d"/" -f3 ) > quartus-compile.log

quartus/output_files/%MHz.pof: quartus/output_files/%MHz.sof
	cd quartus;$(XLR8_QUARTUS_CPF) -c $(shell echo $(@:.pof=.cof)|cut -d"/" -f3)  > quartus_cpf.log


quartus/output_files/%MHz_cfm1_auto.rpd :
	cp $(@:MHz_cfm1_auto.rpd=mhz_cfm1_auto.rpd) $(@) 
#Need to copy MHz.pof to mhz.pof because linux is case sensitive
quartus/output_files/%mhz.pof: quartus/output_files/%MHz.pof quartus/output_files/%MHz_cfm1_auto.rpd
	cp $(@:mhz.pof=MHz.pof) $(@) 

clean:
	rm -f quartus/output_files/*


ifndef XLR8_QUARTUS_SH
$(error Can't Find quartus_sh Please make sure XLR8_QUARTUS_SH is set to the correct path OR quartus_sh is in your path )
endif
ifndef XLR8_QUARTUS_CPF
$(error Can't Find quartus_cpf Please make sure XLR8_QUARTUS_CPF is set to the correct path OR quartus_cpf is in your path )
endif

board_sno_64 : clean quartus/output_files/sno_64mhz.pof
board_sno_32 : clean quartus/output_files/sno_32mhz.pof
board_sno_16 : clean quartus/output_files/sno_16mhz.pof

board_xlr8_64 : clean quartus/output_files/xlr8_64mhz.pof
board_xlr8_32 : clean quartus/output_files/xlr8_32mhz.pof
board_xlr8_16 : clean quartus/output_files/xlr8_16mhz.pof

board_hinj_64 : clean quartus/output_files/hinj_64mhz.pof
board_hinj_32 : clean quartus/output_files/hinj_32mhz.pof
board_hinj_16 : clean quartus/output_files/hinj_16mhz.pof


.PRECIOUS: quartus/output_files/%MHz_cfm1_auto.rpd

all : $(shell echo board_$(XLR8_BOARD)_$(XLR8_FREQ))

#todo : make install that pushes to the board 
	

	