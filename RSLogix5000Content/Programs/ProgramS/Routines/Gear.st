// Per Movimentare il Sistema doppio il SX deve essere agganciato in Gear Al DX.
// Prima di agganciare il gear vengono riposizionati i Movers SX alle posizioni dei Movers DX


Gear_Req := \iTRAK_DH_Master.Sts.Available and \iTRAK_DH_Slave.Sts.Available and \iTRAK_DH_Master.Sts.Energized and \iTRAK_DH_Slave.Sts.Energized;
Gear_Done := (MAG00.IP and MAG01.IP and MAG02.IP and MAG03.IP and MAG04.IP and MAG05.IP and MAG06.IP and MAG07.IP and MAG08.IP and MAG09.IP and MAG10.IP and MAG11.IP and MAG12.IP and MAG13.IP);

If not Gear_Req then
	Gear_DoMAM :=0;
end_if;

If Cmd_EnableGear and Gear_Req and not Gear_Done then

	Gear_DoMAM := 0;
	MAG(CIPMoverS_00,CIPMoverM_00,MAG00,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_01,CIPMoverM_01,MAG01,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_02,CIPMoverM_02,MAG02,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_03,CIPMoverM_03,MAG03,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_04,CIPMoverM_04,MAG04,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_05,CIPMoverM_05,MAG05,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_06,CIPMoverM_06,MAG06,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_07,CIPMoverM_07,MAG07,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_08,CIPMoverM_08,MAG08,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_09,CIPMoverM_09,MAG09,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_10,CIPMoverM_10,MAG10,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_11,CIPMoverM_11,MAG11,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_12,CIPMoverM_12,MAG12,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_13,CIPMoverM_13,MAG13,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_14,CIPMoverM_14,MAG14,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_15,CIPMoverM_15,MAG15,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_16,CIPMoverM_16,MAG16,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_17,CIPMoverM_17,MAG17,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_18,CIPMoverM_18,MAG18,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_19,CIPMoverM_19,MAG19,0,1,1,1,1,Real,Disabled,1,0);
	MAG(CIPMoverS_20,CIPMoverM_20,MAG20,0,1,1,1,1,Real,Disabled,1,0);


end_if;

if (not Cmd_EnableGear and Gear_Done) OR DoStop then;
	
	DoStop := 0;
	StopAllTag.Cfg_StopType := 3;
	raM_iTRAK_Opr_StopAll(StopAllTag,\iTRAK_DH_Slave.Hndl,\iTRAK_DH_Slave.Mover);

end_if;
