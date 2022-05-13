within ;
package modelECMO

  model ECMOSimReg
    //Typy přenosového media
        replaceable package Blood =
          Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
      replaceable package Air =
          Physiolibrary.Media.Air annotation(choicesAllMatching=True);

    // Parametry pacienta
      parameter Real DVfraction=0.3;
      parameter Real Shunts=0.02;
      parameter Physiolibrary.Types.HydraulicConductance StarlingLeft=
        1.250102626409427e-07*(5/4)                                        "Slope of starling curve [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance StarlingRight=
        1.250102626409427e-07*(5/4)                                         "Slope of starling curve [m3/(Pa.s)]";
      //parameter Physiolibrary.Types.VolumeFlowRate SF=8.3333333333333e-05
       //                                                         "Systemic blood flow [m3/s]";

      //parameter Physiolibrary.Types.Frequency RR=15/60 "Respiration rate [s-1]";
      //parameter Physiolibrary.Types.Volume TV=0.0005
      //                                            "Tidal volume [m3]";
      //parameter Physiolibrary.Types.Volume DV=0.002
      //                                             "Dead space volume [m3]";
      parameter Physiolibrary.Types.MolarFlowRate O2BMR=0.00024166666666667
                                                                        " [mol/s]";
      parameter Physiolibrary.Types.MolarFlowRate CO2BMR=0.00019333333333333
                                                                         " [mol/s]";

    // Parametry ECMO

        parameter Real VAV=1   "Distribution of blood to veins and arteries, Values from 0 (100 % Veins) to 1(100 % Arteries";
  //       parameter Physiolibrary.Types.VolumeFlowRate ECMOF=0   "ECMO blood flow [m3/s]";
  //       parameter Physiolibrary.Types.VolumeFlowRate O2Flow=1.6666666666667e-05
  //                                                               "O2 flow in ECMO [m3/s]";
  //       parameter Physiolibrary.Types.VolumeFlowRate AirFlow=1.6666666666667e-05
  //                                                                      "Air flow in ECMO[m3/s]";
        parameter Real RPM=0    "Rotation per minute in ECMO pump";
        parameter Physiolibrary.Types.VolumeFlowRate SWEEP=0 "Air + O2 flow in ECMO[m3/s]";
        parameter Real FiO2=0.8       "Fraction of oxygen in gas";
            parameter Physiolibrary.Types.HydraulicConductance C_shunt=1.250102626409427e-07
        *((Shunts*(1/3)))                          "Conductance of shunt [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance C_ventilation=
        1.019716212977928e-05*((1/1.5)) "Conductance of ventilation [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance C_cirkulation=1.250102626409427e-07
        *(1/3*(1 - Shunts))                          "Conductance of circulation [m3/(Pa.s)]";

    Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium
        = Blood, Resistance=7999343.2449*((5.5*20)/8))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-160,-164})));
    Physiolibrary.Fluid.Components.ElasticVessel Arteries(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=7) annotation (Placement(transformation(extent={{-116,-170},{-136,
              -148}})));
    Physiolibrary.Fluid.Components.ElasticVessel Veins(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=7)
      annotation (Placement(transformation(extent={{-266,-172},{-246,-152}})));
    Physiolibrary.Fluid.Components.Resistor resistor2(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8))                     annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-220,-164})));
    Physiolibrary.Fluid.Components.ElasticVessel Tissue(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      useThermalPort=true,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=6) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-190,-248})));
    Physiolibrary.Fluid.Sensors.PressureMeasure PressureCapilarsTissue(
        redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-262,-238},{-282,-218}})));
    Chemical.Sources.SubstanceInflowT CO2_in(
      SubstanceFlow(displayUnit="mmol/min") = CO2BMR,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-120,-300})));
    Chemical.Sources.SubstanceOutflow O2_left(useSubstanceFlowInput=false,
        SubstanceFlow(displayUnit="mmol/min") = O2BMR) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-266,-300})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-276,-260},{-256,-280}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=0,
          origin={-118,-270})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Arteries(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-74,-144})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Arteries(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-76,-190})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureArterial(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-124,-228},{-104,-208}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure PressureVeins(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{-374,-216},{-394,-196}})));
    Physiolibrary.Fluid.Components.Resistor ECMOResistance(redeclare package
        Medium = Blood, Resistance=7999343.2449*(5/5))
      annotation (Placement(transformation(extent={{-326,92},{-306,112}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureOxygenator(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-162,136},{-142,156}})));
    Physiolibrary.Fluid.Components.ElasticVessel ECMOBloodTube(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start=0.00012,
      useThermalPort=true,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-09,
      ZeroPressureVolume(displayUnit="ml") = 0.00012,
      ExternalPressure(displayUnit="mmHg") = 100658.40249833,
      nPorts=4)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-190,102})));
    Physiolibrary.Fluid.Sources.PressureSource AirPressureSource(redeclare
        package Medium = Air)
      annotation (Placement(transformation(extent={{-294,174},{-274,194}})));
    Physiolibrary.Fluid.Components.ElasticVessel ECMOAirTube(
      redeclare package Medium = Air,
      use_concentration_start=true,
      concentration_start={0.21,40/760,0,1 - 0.21 - 40/760},
      useSubstances=true,
      volume_start(displayUnit="l") = 0.001,
      useThermalPort=false,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-09,
      ZeroPressureVolume(displayUnit="l") = 0.001,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=4)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=270,
          origin={-190,184})));

    Physiolibrary.Fluid.Sensors.PressureMeasure pressureECMOAirTube(redeclare
        package Medium = Air)
      annotation (Placement(transformation(extent={{-146,202},{-126,222}})));
    inner Modelica.Fluid.System system(T_ambient=310.15)
      annotation (Placement(transformation(extent={{-524,396},{-504,416}})));
    Physiolibrary.Thermal.Sources.UnlimitedHeat BodyHeat(T=310.15)
      annotation (Placement(transformation(extent={{-230,-350},{-210,-330}})));
    Physiolibrary.Thermal.Components.Conductor conductor(Conductance=69780)
      annotation (Placement(transformation(extent={{-192,-350},{-172,-330}})));
    Physiolibrary.Thermal.Sources.UnlimitedHeat ECMOHeater(T=310.15)
      annotation (Placement(transformation(extent={{-54,98},{-74,118}})));
    Physiolibrary.Thermal.Components.Conductor conductor1(Conductance=69780)
      annotation (Placement(transformation(extent={{-112,98},{-132,118}})));
    Physiolibrary.Fluid.Components.VolumePump heartRight(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))                       annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-372,-10})));
    Physiolibrary.Fluid.Components.VolumePump heartLeft(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))                       annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-6})));
    Physiolibrary.Fluid.Components.ElasticVessel LungsArteries(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=5)
      annotation (Placement(transformation(extent={{-382,432},{-362,452}})));
    Physiolibrary.Fluid.Components.ElasticVessel LungsVeins(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=5)
      annotation (Placement(transformation(extent={{22,430},{2,450}})));
    Physiolibrary.Fluid.Components.Conductor shunt(redeclare package Medium =
          Blood, Conductance(displayUnit="l/(cmH2O.s)") = C_shunt)
               annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-186,392})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureCardiacOutput(redeclare
        package Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-38})));
    Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-376,672},{-356,692}})));
    Physiolibrary.Fluid.Components.VolumePump DeadSpace(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-204,672},{-184,692}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource MinuteVolume(
        useSolutionFlowInput=true, redeclare package Medium =
          Physiolibrary.Media.Air) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-4,682})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Veins(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-338,-174},{-318,-194}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Veins(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=0,
          origin={-320,-138})));
    Physiolibrary.Fluid.Sources.PressureSource O2PressureSource(redeclare
        package Medium =
                 Air,
      use_concentration_start=false,
      massFractions_start={1,0,0})
      annotation (Placement(transformation(extent={{-294,212},{-274,232}})));
    Physiolibrary.Fluid.Components.VolumePump O2PumpECMO(redeclare package
        Medium =
          Physiolibrary.Media.Air,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-256,212},{-236,232}})));
    Physiolibrary.Fluid.Components.VolumePump AirPumpECMO(redeclare package
        Medium = Physiolibrary.Media.Air,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-252,174},{-232,194}})));
    Chemical.Components.Diffusion O2Diffusion(KC=1e-4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-202,136})));
    Chemical.Components.Diffusion CO2Diffusion(KC=1e-4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-176,136})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst StarlingSlopeRight(k=
          StarlingRight)
      annotation (Placement(transformation(extent={{-442,-8},{-434,0}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-406,-10})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureLungsVein(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{26,104},{46,124}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst StarlingSlopeLeft(k=
          StarlingLeft)
      annotation (Placement(transformation(extent={{52,118},{60,126}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={102,116})));
    Physiolibrary.Fluid.Components.VolumePump volumePump(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSolutionFlowInput=true,
      SolutionFlow=0)
      annotation (Placement(transformation(extent={{-202,-66},{-222,-46}})));
    Physiolibrary.Fluid.Components.VolumePump volumePump1(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-54,-66},{-34,-46}})));
    Modelica.Blocks.Sources.Constant const(k=VAV)
      annotation (Placement(transformation(extent={{-86,28},{-66,48}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-44,-28})));
    Modelica.Blocks.Sources.Constant const1(k=1 - (VAV))
      annotation (Placement(transformation(extent={{-114,-40},{-134,-20}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{-182,-34},{-202,-14}})));
    Physiolibrary.Fluid.Components.Conductor conductor2(redeclare package
        Medium = Physiolibrary.Media.Air, Conductance=SWEEP/100)
      annotation (Placement(transformation(extent={{-140,174},{-120,194}})));
    Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit="kPa")=
           4800)
      annotation (Placement(transformation(extent={{316,-142},{324,-134}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{350,-154},{370,-134}})));
    Modelica.Blocks.Math.Product product5 annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={486,-116})));
    Modelica.Blocks.Math.Max max1 annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={480,-34})));
    Modelica.Blocks.Sources.Constant const2(k=0)
      annotation (Placement(transformation(extent={{436,-96},{456,-76}})));
    Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit="l")=
        0.00035) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={400,124})));
    Physiolibrary.Types.Constants.FrequencyConst frequency(k=
          0.01666666666666667*(50/(2 - 0.35))) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={470,106})));
    Modelica.Blocks.Math.Division division annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={432,112})));
    Modelica.Blocks.Math.Add TidalVolume annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={364,118})));
    Physiolibrary.Types.Constants.PressureConst CC(k(displayUnit="kPa") = 4300)
      annotation (Placement(transformation(extent={{276,-208},{284,-200}})));
    Modelica.Blocks.Math.Add scitani(k1=-1) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={332,-196})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k(
          displayUnit="l/min") = 0.0019247533333333)
      annotation (Placement(transformation(extent={{428,-218},{436,-210}})));
    Modelica.Blocks.Math.Division Slope annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={474,-208})));
    Physiolibrary.Types.Constants.PressureConst pressure1(k(displayUnit="kPa")=
           700)
      annotation (Placement(transformation(extent={{356,-212},{364,-204}})));
    Modelica.Blocks.Math.Max max2 annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=180,
          origin={398,-202})));
    Modelica.Blocks.Math.Product product6 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={204,182})));
    Physiolibrary.Fluid.Sensors.pH pH_Arteries(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-190,-142},{-170,-122}})));
    Modelica.Blocks.Math.Min min1
      annotation (Placement(transformation(extent={{340,128},{320,148}})));
    Physiolibrary.Types.Constants.VolumeConst volume1(k(displayUnit="l")=
        0.00231) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={376,146})));
    Modelica.Blocks.Math.Division RespRate annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={274,152})));
    Modelica.Blocks.Sources.Constant Rotation(k=RPM)
      annotation (Placement(transformation(extent={{-340,56},{-320,76}})));
    Modelica.Blocks.Math.Product product7 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-284,60})));
    Modelica.Blocks.Sources.Constant ECMOFlowSlope(k=0.0013)
      annotation (Placement(transformation(extent={{-338,16},{-318,36}})));
    Modelica.Blocks.Math.Add add1(k1=-1)
      annotation (Placement(transformation(extent={{-258,64},{-238,44}})));
    Modelica.Blocks.Sources.Constant ECMOFlowIntercept(k=0.4318)
      annotation (Placement(transformation(extent={{-338,-20},{-318,0}})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate2(k(
          displayUnit="l/min") = 1.6666666666667e-05)
      annotation (Placement(transformation(extent={{-280,24},{-272,32}})));
    Modelica.Blocks.Math.Product product8 annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-208,48})));
    Modelica.Blocks.Sources.Constant FiO2ECMO(k=FiO2)
      annotation (Placement(transformation(extent={{-342,286},{-322,306}})));
    Modelica.Blocks.Sources.Constant FiO2AIR(k=0.21)
      annotation (Placement(transformation(extent={{-342,252},{-322,272}})));
    Modelica.Blocks.Sources.Constant FiO2Pure(k=1)
      annotation (Placement(transformation(extent={{-342,322},{-322,342}})));
    Modelica.Blocks.Math.Add add2(k2=-1)
      annotation (Placement(transformation(extent={{-310,316},{-290,336}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{-306,278},{-286,258}})));
    Modelica.Blocks.Math.Add add4
      annotation (Placement(transformation(extent={{-230,310},{-210,330}})));
    Modelica.Blocks.Math.Abs abs1
      annotation (Placement(transformation(extent={{-276,258},{-256,278}})));
    Modelica.Blocks.Math.Division division1
      annotation (Placement(transformation(extent={{10,10},{-10,-10}},
          rotation=90,
          origin={-188,300})));
    Modelica.Blocks.Math.Product product9
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-162,256})));
    Modelica.Blocks.Math.Product product10
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-216,256})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate3(k(
          displayUnit="l/min") = SWEEP)
      annotation (Placement(transformation(extent={{-140,316},{-148,324}})));
    Physiolibrary.Fluid.Sources.PressureSource Sweep(redeclare package Medium
        = Air, use_concentration_start=false)
      annotation (Placement(transformation(extent={{-26,176},{-46,196}})));
    Physiolibrary.Fluid.Components.ElasticVessel Alveoly(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-212,616})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureAlveols(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-168,628},{-148,648}})));
    Physiolibrary.Fluid.Components.Conductor conductor3(redeclare package
        Medium =
          Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
        C_ventilation)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-286,638})));
    Chemical.Components.GasSolubility O2(KC=1e-4)
      annotation (Placement(transformation(extent={{-240,564},{-220,584}})));
    Chemical.Components.GasSolubility CO2(KC=1e-4)
      annotation (Placement(transformation(extent={{-202,568},{-182,588}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Lungs(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-294,562},{-274,582}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Lungs(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-136,574})));
    Physiolibrary.Fluid.Components.Conductor conductor4(redeclare package
        Medium =
          Blood, Conductance=C_cirkulation*(8/7))
      annotation (Placement(transformation(extent={{-276,460},{-256,480}})));
    Physiolibrary.Fluid.Components.Conductor conductor5(redeclare package
        Medium =
          Blood, Conductance=C_cirkulation*8)
      annotation (Placement(transformation(extent={{-106,464},{-86,484}})));
    Physiolibrary.Fluid.Components.ElasticVessel LungCapilars(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=4) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-198,530})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureCapilarsLungs(
        redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-112,536},{-92,556}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureAlveols(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-42,608},{-22,628}})));
    Physiolibrary.Fluid.Sensors.pH pH_Veins(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-218,-138},{-238,-118}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureSweep(redeclare package
        Medium = Physiolibrary.Media.Air) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-88,184})));
    Physiolibrary.Fluid.Components.Conductor conductor6(redeclare package
        Medium =
          Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
        C_ventilation)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-98,638})));
    Modelica.Blocks.Math.Max max3 annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={-148,26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate4(k(
          displayUnit="l/min") = 0)
      annotation (Placement(transformation(extent={{-112,50},{-120,58}})));
    Physiolibrary.Fluid.Sensors.pH pH_LungA(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-420,432},{-400,452}})));
    Physiolibrary.Fluid.Sensors.pH pH_LungV(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{86,430},{66,450}})));
    Modelica.Blocks.Math.Product product11
                                          annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={296,198})));
    Modelica.Blocks.Sources.Constant DeadVolumeFraction(k=DVfraction)
      annotation (Placement(transformation(extent={{364,194},{344,214}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureECMO(redeclare package
        Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-274,102})));
    Modelica.Blocks.Math.Min min2
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=270,
          origin={474,42})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
          displayUnit="l/min") = 0.002)
      annotation (Placement(transformation(extent={{432,-12},{440,-4}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure PressureVeins1(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-366,504},{-386,524}})));
    Modelica.Blocks.Math.Min min3
      annotation (Placement(transformation(extent={{248,136},{228,156}})));
    Physiolibrary.Types.Constants.FrequencyConst frequency1(k=0.66666666666667)
                                               annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={272,124})));
  equation
    connect(resistor1.q_in, Arteries.q_in[1]) annotation (Line(
        points={{-150,-164},{-125.9,-164},{-125.9,-156.549}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor2.q_in, Tissue.q_in[1]) annotation (Line(
        points={{-210,-164},{-210,-248.1},{-192.167,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor1.q_out, Tissue.q_in[2]) annotation (Line(
        points={{-170,-164},{-170,-248.1},{-191.3,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(PressureCapilarsTissue.q_in, Tissue.q_in[3]) annotation (Line(
        points={{-268,-234},{-190.433,-234},{-190.433,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(O2_left.port_a, Tissue.substances[2]) annotation (Line(points={{-256,
            -300},{-190,-300},{-190,-258}}, color={158,66,200}));
    connect(O2_left.port_a, pO2_tissue.port_a) annotation (Line(points={{-256,-300},
            {-234,-300},{-234,-270},{-256,-270}}, color={158,66,200}));
    connect(pO2_tissue.referenceFluidPort, Tissue.q_in[4]) annotation (Line(
        points={{-266,-260.2},{-266,-248},{-212,-248},{-212,-248.1},{-189.567,
            -248.1}},
        color={127,0,0},
        thickness=0.5));

    connect(pCO2_tissue.referenceFluidPort, Tissue.q_in[5]) annotation (Line(
        points={{-118,-260.2},{-118,-248.1},{-188.7,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(CO2_in.port_b, Tissue.substances[3]) annotation (Line(points={{-130,
            -300},{-190,-300},{-190,-258}}, color={158,66,200}));
    connect(CO2_in.port_b, pCO2_tissue.port_a) annotation (Line(points={{-130,-300},
            {-154,-300},{-154,-270},{-128,-270}}, color={158,66,200}));
    connect(resistor2.q_out, Veins.q_in[1]) annotation (Line(
        points={{-230,-164},{-256.1,-164},{-256.1,-159.771}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2Arteries.port_a, Arteries.substances[2]) annotation (Line(points={{-86,
            -190},{-116,-190},{-116,-159}},
                                         color={158,66,200}));
    connect(pO2Arteries.referenceFluidPort, Arteries.q_in[2]) annotation (Line(
        points={{-76,-199.8},{-125.9,-199.8},{-125.9,-157.366}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Arteries.referenceFluidPort, Arteries.q_in[3]) annotation (Line(
        points={{-74,-153.8},{-74,-158.183},{-125.9,-158.183}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Arteries.port_a, Arteries.substances[3])
      annotation (Line(points={{-84,-144},{-116,-144},{-116,-159}},
                                                           color={158,66,200}));
    connect(BodyHeat.port, conductor.q_in) annotation (Line(
        points={{-210,-340},{-192,-340}},
        color={191,0,0},
        thickness=0.5));
    connect(conductor.q_out, Tissue.heatPort) annotation (Line(
        points={{-172,-340},{-170,-340},{-170,-258},{-179.8,-258},{-179.8,-254}},
        color={191,0,0},
        thickness=0.5));

    connect(PressureVeins.q_in, Veins.q_in[2]) annotation (Line(
        points={{-380,-212},{-250,-212},{-250,-160.514},{-256.1,-160.514}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureECMOAirTube.q_in, ECMOAirTube.q_in[1]) annotation (Line(
        points={{-140,206},{-188.05,206},{-188.05,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(ECMOHeater.port, conductor1.q_in) annotation (Line(
        points={{-74,108},{-112,108}},
        color={191,0,0},
        thickness=0.5));
    connect(conductor1.q_out, ECMOBloodTube.heatPort) annotation (Line(
        points={{-132,108},{-179.8,108}},
        color={191,0,0},
        thickness=0.5));
    connect(flowMeasureCardiacOutput.q_out, Arteries.q_in[4]) annotation (Line(
        points={{8,-48},{8,-159},{-125.9,-159}},
        color={127,0,0},
        thickness=0.5));
    connect(heartRight.q_in, Veins.q_in[3]) annotation (Line(
        points={{-372,-20},{-372,-161.257},{-256.1,-161.257}},
        color={127,0,0},
        thickness=0.5));
    connect(heartRight.q_out, LungsArteries.q_in[1]) annotation (Line(
        points={{-372,0},{-372,424},{-372.1,424},{-372.1,444.08}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_out, LungsVeins.q_in[1]) annotation (Line(
        points={{-176,392},{12.1,392},{12.1,442.08}},
        color={127,0,0},
        thickness=0.5));
    connect(heartLeft.q_in, LungsVeins.q_in[2]) annotation (Line(
        points={{8,4},{12.1,441.04}},
        color={127,0,0},
        thickness=0.5));
    connect(heartLeft.q_out, flowMeasureCardiacOutput.q_in) annotation (Line(
        points={{8,-16},{8,-28}},
        color={127,0,0},
        thickness=0.5));
    connect(LungsArteries.q_in[2], shunt.q_in) annotation (Line(
        points={{-372.1,443.04},{-372,443.04},{-372,392},{-196,392}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureSource.y, DeadSpace.q_in) annotation (Line(
        points={{-356,682},{-204,682}},
        color={127,0,0},
        thickness=0.5));
    connect(DeadSpace.q_out, MinuteVolume.q_in) annotation (Line(
        points={{-184,682},{-14,682}},
        color={127,0,0},
        thickness=0.5));

    connect(O2PressureSource.y,O2PumpECMO. q_in) annotation (Line(
        points={{-274,222},{-256,222}},
        color={127,0,0},
        thickness=0.5));
    connect(O2PumpECMO.q_out, ECMOAirTube.q_in[2]) annotation (Line(
        points={{-236,222},{-189.35,222},{-189.35,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(AirPumpECMO.q_out, ECMOAirTube.q_in[3]) annotation (Line(
        points={{-232,184},{-194,184},{-194,188},{-190.65,188},{-190.65,183.9}},
        color={127,0,0},
        thickness=0.5));

    connect(AirPressureSource.y, AirPumpECMO.q_in) annotation (Line(
        points={{-274,184},{-252,184}},
        color={127,0,0},
        thickness=0.5));
    connect(O2Diffusion.port_b, ECMOAirTube.substances[1]) annotation (Line(
          points={{-202,146},{-202,152},{-190,152},{-190,174}},
                                                              color={158,66,200}));
    connect(CO2Diffusion.port_b, ECMOAirTube.substances[2]) annotation (Line(
          points={{-176,146},{-176,152},{-190,152},{-190,174}},
                                                        color={158,66,200}));
    connect(CO2Diffusion.port_a, ECMOBloodTube.substances[3]) annotation (Line(
          points={{-176,126},{-176,112},{-190,112}},color={158,66,200}));
    connect(O2Diffusion.port_a, ECMOBloodTube.substances[2])
      annotation (Line(points={{-202,126},{-202,114},{-190,114},{-190,112}},
                                                       color={158,66,200}));
    connect(StarlingSlopeRight.y, product2.u1)
      annotation (Line(points={{-433,-4},{-418,-4}}, color={0,0,127}));
    connect(PressureVeins.pressure, product2.u2) annotation (Line(points={{-390,
            -210},{-418,-210},{-418,-16}},                         color={0,0,127}));
    connect(product2.y, heartRight.solutionFlow) annotation (Line(points={{-395,
            -10},{-390,-10},{-390,-8},{-379,-8},{-379,-10}},
                                                      color={0,0,127}));
    connect(pressureLungsVein.pressure, product1.u2)
      annotation (Line(points={{42,110},{90,110}},   color={0,0,127}));
    connect(product1.y, heartLeft.solutionFlow) annotation (Line(points={{113,116},
            {122,116},{122,-6},{15,-6}},  color={0,0,127}));
    connect(pressureLungsVein.q_in, LungsVeins.q_in[3]) annotation (Line(
        points={{32,108},{32,88},{12.1,88},{12.1,440}},
        color={127,0,0},
        thickness=0.5));

    connect(const1.y, product4.u2)
      annotation (Line(points={{-135,-30},{-180,-30}},
                                               color={0,0,127}));
    connect(product4.y, volumePump.solutionFlow) annotation (Line(points={{-203,
            -24},{-212,-24},{-212,-49}},              color={0,0,127}));
    connect(pressureArterial.q_in, Arteries.q_in[5]) annotation (Line(
        points={{-118,-224},{-126,-224},{-126,-159.817},{-125.9,-159.817}},
        color={127,0,0},
        thickness=0.5));
    connect(const.y, product3.u1)
      annotation (Line(points={{-65,38},{-38,38},{-38,-16}}, color={0,0,127}));
    connect(product3.y, volumePump1.solutionFlow)
      annotation (Line(points={{-44,-39},{-44,-49}}, color={0,0,127}));
    connect(pressureOxygenator.q_in, ECMOBloodTube.q_in[1]) annotation (Line(
        points={{-156,140},{-156,102.1},{-191.95,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(volume.y,TidalVolume. u2)
      annotation (Line(points={{395,124},{376,124}},
                                                  color={0,0,127}));
    connect(volumeFlowRate1.y, Slope.u1)
      annotation (Line(points={{437,-214},{462,-214}}, color={0,0,127}));
    connect(scitani.y,max2. u1) annotation (Line(points={{343,-196},{386,-196}},
                                    color={0,0,127}));
    connect(pressure1.y,max2. u2) annotation (Line(points={{365,-208},{386,-208}},
                                    color={0,0,127}));
    connect(CC.y,scitani. u1)
      annotation (Line(points={{285,-204},{320,-204},{320,-202}},
                                                       color={0,0,127}));
    connect(max2.y,Slope. u2)
      annotation (Line(points={{409,-202},{462,-202}}, color={0,0,127}));
    connect(pressure.y,add. u1)
      annotation (Line(points={{325,-138},{348,-138}}, color={0,0,127}));
    connect(add.y,product5. u2) annotation (Line(points={{371,-144},{480,-144},
            {480,-128}}, color={0,0,127}));
    connect(Slope.y,product5. u1) annotation (Line(points={{485,-208},{492,-208},
            {492,-128}}, color={0,0,127}));
    connect(product5.y,max1. u1)
      annotation (Line(points={{486,-105},{486,-46}},  color={0,0,127}));
    connect(const2.y, max1.u2) annotation (Line(points={{457,-86},{474,-86},{
            474,-46}}, color={0,0,127}));
    connect(frequency.y,division. u2)
      annotation (Line(points={{465,106},{444,106}},
                                                   color={0,0,127}));
    connect(division.y,TidalVolume. u1)
      annotation (Line(points={{421,112},{376,112}},
                                                   color={0,0,127}));
    connect(pCO2Arteries.partialPressure, add.u2) annotation (Line(points={{-64,
            -144},{348,-144},{348,-150}}, color={0,0,127}));
    connect(pO2Arteries.partialPressure, scitani.u2) annotation (Line(points={{-66,
            -190},{320,-190}},                                      color={0,0,
            127}));
    connect(MinuteVolume.solutionFlow, division.u1) annotation (Line(points={{
            -4,689},{82,689},{82,690},{484,690},{484,118},{444,118}}, color={0,
            0,127}));
    connect(DeadSpace.solutionFlow, product6.y) annotation (Line(points={{-194,
            689},{-194,724},{178,724},{178,182},{193,182}},
                                                  color={0,0,127}));
    connect(pH_Arteries.referenceFluidPort, Arteries.q_in[6]) annotation (Line(
        points={{-180,-141.8},{-180,-176},{-125.9,-176},{-125.9,-160.634}},
        color={127,0,0},
        thickness=0.5));
    connect(min1.u1, volume1.y) annotation (Line(points={{342,144},{371,144},{
            371,146}}, color={0,0,127}));
    connect(min1.u2, TidalVolume.y) annotation (Line(points={{342,132},{348,132},
            {348,122},{353,122},{353,118}}, color={0,0,127}));
    connect(RespRate.u2, min1.y) annotation (Line(points={{286,146},{306,146},{
            306,138},{319,138}}, color={0,0,127}));
    connect(RespRate.u1, division.u1) annotation (Line(points={{286,158},{484,
            158},{484,118},{444,118}}, color={0,0,127}));
    connect(ECMOFlowSlope.y, product7.u2) annotation (Line(points={{-317,26},{
            -302,26},{-302,52},{-296,52},{-296,54}},
                                              color={0,0,127}));
    connect(ECMOFlowIntercept.y, add1.u1) annotation (Line(points={{-317,-10},{
            -288,-10},{-288,48},{-260,48}},
                                        color={0,0,127}));
    connect(pCO2Veins.referenceFluidPort, Veins.q_in[4]) annotation (Line(
        points={{-320,-128.2},{-272,-128.2},{-272,-162},{-256.1,-162}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2Veins.referenceFluidPort, Veins.q_in[5]) annotation (Line(
        points={{-328,-174.2},{-320,-174.2},{-320,-170},{-256.1,-170},{-256.1,
            -162.743}},
        color={127,0,0},
        thickness=0.5));

    connect(pO2Veins.port_a, Veins.substances[2]) annotation (Line(points={{-318,-184},
            {-304,-184},{-304,-182},{-266,-182},{-266,-162}}, color={158,66,200}));
    connect(pCO2Veins.port_a, Veins.substances[3]) annotation (Line(points={{-310,
            -138},{-294,-138},{-294,-144},{-266,-144},{-266,-162}}, color={158,66,
            200}));
    connect(product7.y, add1.u2) annotation (Line(points={{-273,60},{-260,60}},
                              color={0,0,127}));
    connect(volumeFlowRate2.y, product8.u1) annotation (Line(points={{-271,28},
            {-230,28},{-230,42},{-220,42}},
                             color={0,0,127}));
    connect(add1.y, product8.u2) annotation (Line(points={{-237,54},{-237,54},{
            -220,54}},                  color={0,0,127}));
    connect(FiO2ECMO.y, add2.u2) annotation (Line(points={{-321,296},{-312,296},{-312,
            320}}, color={0,0,127}));
    connect(FiO2Pure.y, add2.u1)
      annotation (Line(points={{-321,332},{-312,332}}, color={0,0,127}));
    connect(FiO2AIR.y, add3.u1)
      annotation (Line(points={{-321,262},{-308,262}}, color={0,0,127}));
    connect(add3.u2, FiO2ECMO.y) annotation (Line(points={{-308,274},{-310,274},{-310,
            296},{-321,296}}, color={0,0,127}));
    connect(add3.y, abs1.u)
      annotation (Line(points={{-285,268},{-278,268}}, color={0,0,127}));
    connect(add2.y, add4.u1)
      annotation (Line(points={{-289,326},{-232,326}}, color={0,0,127}));
    connect(abs1.y, add4.u2) annotation (Line(points={{-255,268},{-248,268},{-248,
            314},{-232,314}}, color={0,0,127}));
    connect(add4.y, division1.u2) annotation (Line(points={{-209,320},{-194,320},{
            -194,312}}, color={0,0,127}));
    connect(volumeFlowRate3.y, division1.u1) annotation (Line(points={{-149,320},{
            -182,320},{-182,312}}, color={0,0,127}));
    connect(product10.u1, add4.u2) annotation (Line(points={{-222,268},{-248,268},
            {-248,314},{-232,314}}, color={0,0,127}));
    connect(product10.u2, division1.y) annotation (Line(points={{-210,268},{-188,268},
            {-188,289}}, color={0,0,127}));
    connect(product10.y, O2PumpECMO.solutionFlow) annotation (Line(points={{-216,245},
            {-216,240},{-246,240},{-246,229}}, color={0,0,127}));
    connect(product9.u1, division1.y) annotation (Line(points={{-168,268},{-188,268},
            {-188,289}}, color={0,0,127}));
    connect(add2.y, product9.u2) annotation (Line(points={{-289,326},{-290,326},{-290,
            342},{-134,342},{-134,268},{-156,268}}, color={0,0,127}));
    connect(product9.y, AirPumpECMO.solutionFlow) annotation (Line(points={{-162,245},
            {-162,230},{-228,230},{-228,191},{-242,191}}, color={0,0,127}));
    connect(conductor2.q_in, ECMOAirTube.q_in[4]) annotation (Line(
        points={{-140,184},{-166,184},{-166,183.9},{-191.95,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureAlveols.q_in, Alveoly.q_in[1]) annotation (Line(
        points={{-168,638},{-210,638},{-210,615.9},{-213.733,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(Alveoly.substances[1],O2. gas_port) annotation (Line(points={{-212,
            606},{-212,592},{-220,592},{-220,596},{-234,596},{-234,584},{-230,
            584}},                           color={158,66,200}));
    connect(Alveoly.substances[2],CO2. gas_port) annotation (Line(points={{-212,
            606},{-212,588},{-192,588}},   color={158,66,200}));
    connect(pressureCapilarsLungs.q_in, LungCapilars.q_in[1]) annotation (Line(
        points={{-106,540},{-106,520},{-136,520},{-136,496},{-192,496},{-192,
            512},{-196.05,512},{-196.05,530.1}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port, LungCapilars.substances[2]) annotation (Line(points=
           {{-230,564},{-230,512},{-198,512},{-198,540}}, color={158,66,200}));
    connect(CO2.liquid_port, LungCapilars.substances[3]) annotation (Line(
          points={{-192,568},{-198,568},{-198,540}}, color={158,66,200}));
    connect(pO2Lungs.referenceFluidPort, LungCapilars.q_in[2]) annotation (Line(
        points={{-284,562.2},{-284,496},{-192,496},{-192,512},{-197.35,512},{
            -197.35,530.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Lungs.referenceFluidPort, LungCapilars.q_in[2]) annotation (
        Line(
        points={{-136,564.2},{-136,496},{-192,496},{-192,512},{-197.35,512},{
            -197.35,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(O2.liquid_port, pO2Lungs.port_a) annotation (Line(points={{-230,564},
            {-230,544},{-256,544},{-256,572},{-274,572}}, color={158,66,200}));
    connect(CO2.liquid_port, pCO2Lungs.port_a) annotation (Line(points={{-192,
            568},{-192,552},{-160,552},{-160,574},{-146,574}},            color=
           {158,66,200}));
    connect(conductor4.q_out, LungCapilars.q_in[3]) annotation (Line(
        points={{-256,470},{-192,470},{-192,512},{-198.65,512},{-198.65,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(conductor5.q_in, LungCapilars.q_in[4]) annotation (Line(
        points={{-106,474},{-192,474},{-192,512},{-199.95,512},{-199.95,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(conductor4.q_in, LungsArteries.q_in[3]) annotation (Line(
        points={{-276,470},{-372,470},{-372,440},{-372.1,440},{-372.1,442}},
        color={127,0,0},
        thickness=0.5));

    connect(conductor5.q_out, LungsVeins.q_in[4]) annotation (Line(
        points={{-86,474},{12,474},{12,440},{12.1,440},{12.1,438.96}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor3.q_in, DeadSpace.q_in) annotation (Line(
        points={{-296,638},{-322,638},{-322,682},{-204,682}},
        color={127,0,0},
        thickness=0.5));

    connect(pressureAlveols.q_in, Alveoly.q_in[2]) annotation (Line(
        points={{-36,612},{-212,612},{-212,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_Arteries.port_a, Arteries.substances[13]) annotation (Line(
          points={{-170,-132},{-116,-132},{-116,-159}},
          color={158,66,200}));
    connect(pH_Veins.referenceFluidPort, Veins.q_in[6]) annotation (Line(
        points={{-228,-137.8},{-228,-146},{-256.1,-146},{-256.1,-163.486}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_Veins.port_a, Veins.substances[13]) annotation (Line(points={{-238,
            -128},{-266,-128},{-266,-162}},                              color=
            {158,66,200}));
    connect(flowMeasureSweep.q_in, conductor2.q_out) annotation (Line(
        points={{-98,184},{-120,184}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureSweep.q_out, Sweep.y) annotation (Line(
        points={{-78,184},{-62,184},{-62,186},{-46,186}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor6.q_in, flowMeasureAlveols.q_out) annotation (Line(
        points={{-108,638},{-148,638}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor6.q_out, MinuteVolume.q_in) annotation (Line(
        points={{-88,638},{-70,638},{-70,682},{-14,682}},
        color={127,0,0},
        thickness=0.5));

    connect(pH_LungA.referenceFluidPort, LungsArteries.q_in[4]) annotation (
        Line(
        points={{-410,432.2},{-410,408},{-372,408},{-372,424},{-372.1,424},{
            -372.1,440.96}},
        color={127,0,0},
        thickness=0.5));

    connect(pH_LungV.referenceFluidPort, LungsVeins.q_in[5]) annotation (Line(
        points={{76,430.2},{76,414},{12,414},{12,424},{12.1,424},{12.1,437.92}},
        color={127,0,0},
        thickness=0.5));

    connect(pH_LungA.port_a, LungsArteries.substances[13])
      annotation (Line(points={{-400,442},{-382,442}}, color={158,66,200}));
    connect(pH_LungV.port_a, LungsVeins.substances[13])
      annotation (Line(points={{66,440},{22,440}}, color={158,66,200}));
    connect(volumePump.q_in, ECMOBloodTube.q_in[2]) annotation (Line(
        points={{-202,-56},{-168,-56},{-168,102.1},{-190.65,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(volumePump1.q_in, ECMOBloodTube.q_in[3]) annotation (Line(
        points={{-54,-56},{-168,-56},{-168,102.1},{-189.35,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(min1.y, product11.u1) annotation (Line(points={{319,138},{314,138},
            {314,186},{308,186},{308,192}},
                                       color={0,0,127}));
    connect(DeadVolumeFraction.y, product11.u2)
      annotation (Line(points={{343,204},{308,204}}, color={0,0,127}));
    connect(product11.y, product6.u2) annotation (Line(points={{285,198},{274,
            198},{274,188},{216,188},{216,188}},
                                            color={0,0,127}));
    connect(ECMOResistance.q_out, flowMeasureECMO.q_in) annotation (Line(
        points={{-306,102},{-300,102},{-300,102},{-284,102}},
        color={127,0,0},
        thickness=0.5));
    connect(Rotation.y, product7.u1)
      annotation (Line(points={{-319,66},{-296,66}}, color={0,0,127}));
    connect(product8.y, max3.u2) annotation (Line(points={{-197,48},{-154,48},{
            -154,38}}, color={0,0,127}));
    connect(volumeFlowRate4.y, max3.u1) annotation (Line(points={{-121,54},{
            -142,54},{-142,38}}, color={0,0,127}));
    connect(max3.y, product4.u1) annotation (Line(points={{-148,15},{-148,-18},
            {-180,-18}}, color={0,0,127}));
    connect(max3.y, product3.u2) annotation (Line(points={{-148,15},{-148,0},{
            -50,0},{-50,-16}}, color={0,0,127}));
    connect(flowMeasureECMO.q_out, ECMOBloodTube.q_in[4]) annotation (Line(
        points={{-264,102},{-226,102},{-226,102.1},{-188.05,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(StarlingSlopeLeft.y, product1.u1)
      annotation (Line(points={{61,122},{90,122}}, color={0,0,127}));
    connect(conductor3.q_out, Alveoly.q_in[3]) annotation (Line(
        points={{-276,638},{-210.267,638},{-210.267,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(volumeFlowRate.y, min2.u2)
      annotation (Line(points={{441,-8},{468,-8},{468,30}}, color={0,0,127}));
    connect(max1.y, min2.u1)
      annotation (Line(points={{480,-23},{480,30}}, color={0,0,127}));
    connect(min2.y, division.u1) annotation (Line(points={{474,53},{474,80},{
            484,80},{484,118},{444,118}}, color={0,0,127}));
    connect(volumePump.q_out, Veins.q_in[7]) annotation (Line(
        points={{-222,-56},{-256.1,-56},{-256.1,-164.229}},
        color={127,0,0},
        thickness=0.5));
    connect(volumePump1.q_out, Arteries.q_in[7]) annotation (Line(
        points={{-34,-56},{-18,-56},{-18,-161.451},{-125.9,-161.451}},
        color={127,0,0},
        thickness=0.5));
    connect(PressureVeins1.q_in, LungsArteries.q_in[5]) annotation (Line(
        points={{-372,508},{-372,458},{-372.1,458},{-372.1,439.92}},
        color={127,0,0},
        thickness=0.5));
    connect(RespRate.y, min3.u1)
      annotation (Line(points={{263,152},{250,152}}, color={0,0,127}));
    connect(min3.y, product6.u1) annotation (Line(points={{227,146},{224,146},{
            224,158},{216,158},{216,176}}, color={0,0,127}));
    connect(frequency1.y, min3.u2) annotation (Line(points={{267,124},{250,124},
            {250,140}}, color={0,0,127}));
    connect(ECMOResistance.q_in, Tissue.q_in[6]) annotation (Line(
        points={{-326,102},{-346,102},{-346,100},{-352,100},{-352,-250},{
            -187.833,-250},{-187.833,-248.1}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-660,
              -460},{660,740}})),
                            Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-660,-460},{660,740}}), graphics={
          Rectangle(
            extent={{-356,378},{-10,-92}},
            lineColor={0,140,72},
            lineThickness=0.5),
          Text(
            extent={{-184,392},{6,326}},
            textColor={0,140,72},
            fontSize=10,
            textString="ECMO circuit"),
          Rectangle(
            extent={{-424,400},{152,-370}},
            lineColor={238,46,47},
            lineThickness=0.5),
          Text(
            extent={{28,390},{110,344}},
            textColor={238,46,47},
            fontSize=10,
            textString="Body"),
          Rectangle(
            extent={{-424,734},{150,410}},
            lineColor={28,108,200},
            lineThickness=0.5),
          Text(
            extent={{6,728},{96,688}},
            textColor={28,108,200},
            fontSize=10,
            textString="Lungs"),
          Rectangle(
            extent={{156,698},{522,-372}},
            lineColor={217,67,180},
            lineThickness=0.5),
          Text(
            extent={{204,724},{508,600}},
            textColor={217,67,180},
            textString="Respiratory regulation",
            fontSize=10)}));
  end ECMOSimReg;

  model ECMOSimNoReg
    //Typy přenosového media
        replaceable package Blood =
          Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
      replaceable package Air =
          Physiolibrary.Media.Air annotation(choicesAllMatching=True);

    // Parametry pacienta
      parameter Real Shunts=0.02;
      parameter Physiolibrary.Types.HydraulicConductance StarlingLeft=
        1.250102626409427e-07*(5/4)                                        "Slope of starling curve [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance StarlingRight=
        1.250102626409427e-07*(5/4)                                         "Slope of starling curve [m3/(Pa.s)]";
      //parameter Physiolibrary.Types.VolumeFlowRate SF=8.3333333333333e-05
       //                                                         "Systemic blood flow [m3/s]";

      parameter Physiolibrary.Types.Frequency RR=0.28333333333333
                                                       "Respiration rate [s-1]";
      parameter Physiolibrary.Types.Volume TV=0.0005
                                                  "Tidal volume [m3]";
      parameter Physiolibrary.Types.Volume DV=0.00015
                                                   "Dead space volume [m3]";
      parameter Physiolibrary.Types.MolarFlowRate O2BMR=0.00024166666666667
                                                                        " [mol/s]";
      parameter Physiolibrary.Types.MolarFlowRate CO2BMR=0.00019333333333333
                                                                         " [mol/s]";
      parameter Physiolibrary.Types.HydraulicConductance C_shunt=1.250102626409427e-07
        *((Shunts*(1/3)))                          "Conductance of shunt [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance C_ventilation=
        1.019716212977928e-05*((1/1.5)) "Conductance of ventilation [m3/(Pa.s)]";
      parameter Physiolibrary.Types.HydraulicConductance C_cirkulation=1.250102626409427e-07
        *(1/3*(1 - Shunts))                          "Conductance of circulation [m3/(Pa.s)]";

    // Parametry ECMO

        parameter Real VAV=0   "Distribution of blood to veins and arteries, Values from 0 (100 % Veins) to 1(100 % Arteries";
  //       parameter Physiolibrary.Types.VolumeFlowRate ECMOF=0   "ECMO blood flow [m3/s]";
  //       parameter Physiolibrary.Types.VolumeFlowRate O2Flow=1.6666666666667e-05
  //                                                               "O2 flow in ECMO [m3/s]";
  //       parameter Physiolibrary.Types.VolumeFlowRate AirFlow=1.6666666666667e-05
  //                                                                      "Air flow in ECMO[m3/s]";
        parameter Real RPM=0    "Rotation per minute in ECMO pump";
        parameter Physiolibrary.Types.VolumeFlowRate SWEEP=0 "Air + O2 flow in ECMO[m3/s]";
        parameter Real FiO2=0.5       "Fraction of oxygen in gas";

    Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium
        = Blood, Resistance=7999343.2449*((5.5*20)/8))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-160,-164})));
    Physiolibrary.Fluid.Components.ElasticVessel Arteries(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=7) annotation (Placement(transformation(extent={{-116,-170},{-136,
              -148}})));
    Physiolibrary.Fluid.Components.ElasticVessel Veins(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=7)
      annotation (Placement(transformation(extent={{-266,-172},{-246,-152}})));
    Physiolibrary.Fluid.Components.Resistor resistor2(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8))                     annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-220,-164})));
    Physiolibrary.Fluid.Components.ElasticVessel Tissue(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      useThermalPort=true,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=6) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-190,-248})));
    Physiolibrary.Fluid.Sensors.PressureMeasure PressureCapilarsTissue(
        redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-262,-238},{-282,-218}})));
    Chemical.Sources.SubstanceInflowT CO2_in(
      SubstanceFlow(displayUnit="mmol/min") = CO2BMR,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-120,-300})));
    Chemical.Sources.SubstanceOutflow O2_left(useSubstanceFlowInput=false,
        SubstanceFlow(displayUnit="mmol/min") = O2BMR) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-266,-300})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-276,-260},{-256,-280}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=0,
          origin={-118,-270})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Arteries(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-74,-144})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Arteries(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={-76,-190})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureArterial(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-124,-228},{-104,-208}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure PressureVeins(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{-374,-216},{-394,-196}})));
    Physiolibrary.Fluid.Components.Resistor ECMOResistance(redeclare package
        Medium = Blood, Resistance=7999343.2449*(5/5))
      annotation (Placement(transformation(extent={{-326,92},{-306,112}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureOxygenator(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-162,136},{-142,156}})));
    Physiolibrary.Fluid.Components.ElasticVessel ECMOBloodTube(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start=0.00012,
      useThermalPort=true,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-09,
      ZeroPressureVolume(displayUnit="ml") = 0.00012,
      ExternalPressure(displayUnit="mmHg") = 100658.40249833,
      nPorts=4)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-190,102})));
    Physiolibrary.Fluid.Sources.PressureSource AirPressureSource(redeclare
        package Medium = Air)
      annotation (Placement(transformation(extent={{-294,174},{-274,194}})));
    Physiolibrary.Fluid.Components.ElasticVessel ECMOAirTube(
      redeclare package Medium = Air,
      use_concentration_start=true,
      concentration_start={0.21,40/760,0,1 - 0.21 - 40/760},
      useSubstances=true,
      volume_start(displayUnit="l") = 0.001,
      useThermalPort=false,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-09,
      ZeroPressureVolume(displayUnit="l") = 0.001,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=4)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=270,
          origin={-190,184})));

    Physiolibrary.Fluid.Sensors.PressureMeasure pressureECMOAirTube(redeclare
        package Medium = Air)
      annotation (Placement(transformation(extent={{-146,202},{-126,222}})));
    inner Modelica.Fluid.System system(T_ambient=310.15)
      annotation (Placement(transformation(extent={{-524,396},{-504,416}})));
    Physiolibrary.Thermal.Sources.UnlimitedHeat BodyHeat(T=310.15)
      annotation (Placement(transformation(extent={{-230,-350},{-210,-330}})));
    Physiolibrary.Thermal.Components.Conductor conductor(Conductance=69780)
      annotation (Placement(transformation(extent={{-192,-350},{-172,-330}})));
    Physiolibrary.Thermal.Sources.UnlimitedHeat ECMOHeater(T=310.15)
      annotation (Placement(transformation(extent={{-54,98},{-74,118}})));
    Physiolibrary.Thermal.Components.Conductor conductor1(Conductance=69780)
      annotation (Placement(transformation(extent={{-112,98},{-132,118}})));
    Physiolibrary.Fluid.Components.VolumePump heartRight(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))                       annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-372,-10})));
    Physiolibrary.Fluid.Components.VolumePump heartLeft(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))                       annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-6})));
    Physiolibrary.Fluid.Components.ElasticVessel LungsArteries(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=5)
      annotation (Placement(transformation(extent={{-382,432},{-362,452}})));
    Physiolibrary.Fluid.Components.ElasticVessel LungsVeins(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=5) annotation (Placement(transformation(extent={{22,430},{2,450}})));
    Physiolibrary.Fluid.Components.Conductor shunt(redeclare package Medium =
          Blood, Conductance(displayUnit="l/(cmH2O.s)") = C_shunt)
               annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-186,392})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureCardiacOutput(redeclare
        package Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-38})));
    Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-376,672},{-356,692}})));
    Physiolibrary.Fluid.Components.VolumePump DeadSpace(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSolutionFlowInput=false,
      SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-204,672},{-184,692}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource MinuteVolume(
      useSolutionFlowInput=false,
      SolutionFlow=RR*TV,
      redeclare package Medium = Physiolibrary.Media.Air) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-4,682})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Veins(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-338,-174},{-318,-194}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Veins(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=0,
          origin={-320,-138})));
    Physiolibrary.Fluid.Sources.PressureSource O2PressureSource(redeclare
        package Medium =
                 Air,
      use_concentration_start=false,
      massFractions_start={1,0,0})
      annotation (Placement(transformation(extent={{-294,212},{-274,232}})));
    Physiolibrary.Fluid.Components.VolumePump O2PumpECMO(redeclare package
        Medium =
          Physiolibrary.Media.Air,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-256,212},{-236,232}})));
    Physiolibrary.Fluid.Components.VolumePump AirPumpECMO(redeclare package
        Medium = Physiolibrary.Media.Air,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-252,174},{-232,194}})));
    Chemical.Components.Diffusion O2Diffusion(KC=1e-4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-202,136})));
    Chemical.Components.Diffusion CO2Diffusion(KC=1e-4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-176,136})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst StarlingSlopeRight(k=
          StarlingRight)
      annotation (Placement(transformation(extent={{-442,-8},{-434,0}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-406,-10})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureLungsVein(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{26,104},{46,124}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst StarlingSlopeLeft(k=
          StarlingLeft)
      annotation (Placement(transformation(extent={{52,118},{60,126}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={102,116})));
    Physiolibrary.Fluid.Components.VolumePump VVECMOpump(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSolutionFlowInput=true,
      SolutionFlow=0)
      annotation (Placement(transformation(extent={{-202,-66},{-222,-46}})));
    Physiolibrary.Fluid.Components.VolumePump VAECMOpump(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min"))
      annotation (Placement(transformation(extent={{-54,-66},{-34,-46}})));
    Modelica.Blocks.Sources.Constant const(k=VAV)
      annotation (Placement(transformation(extent={{-86,28},{-66,48}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-44,-28})));
    Modelica.Blocks.Sources.Constant const1(k=1 - (VAV))
      annotation (Placement(transformation(extent={{-114,-40},{-134,-20}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{-182,-34},{-202,-14}})));
    Physiolibrary.Fluid.Components.Conductor conductor2(redeclare package
        Medium = Physiolibrary.Media.Air, Conductance=SWEEP/100)
      annotation (Placement(transformation(extent={{-140,174},{-120,194}})));
    Physiolibrary.Fluid.Sensors.pH pH_Arteries(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-190,-142},{-170,-122}})));
    Modelica.Blocks.Sources.Constant Rotation(k=RPM)
      annotation (Placement(transformation(extent={{-340,56},{-320,76}})));
    Modelica.Blocks.Math.Product product7 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-284,60})));
    Modelica.Blocks.Sources.Constant ECMOFlowSlope(k=0.0013)
      annotation (Placement(transformation(extent={{-338,16},{-318,36}})));
    Modelica.Blocks.Math.Add add1(k1=-1)
      annotation (Placement(transformation(extent={{-258,64},{-238,44}})));
    Modelica.Blocks.Sources.Constant ECMOFlowIntercept(k=0.4318)
      annotation (Placement(transformation(extent={{-338,-20},{-318,0}})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate2(k(
          displayUnit="l/min") = 1.6666666666667e-05)
      annotation (Placement(transformation(extent={{-280,24},{-272,32}})));
    Modelica.Blocks.Math.Product product8 annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-208,48})));
    Modelica.Blocks.Sources.Constant FiO2ECMO(k=FiO2)
      annotation (Placement(transformation(extent={{-342,286},{-322,306}})));
    Modelica.Blocks.Sources.Constant FiO2AIR(k=0.21)
      annotation (Placement(transformation(extent={{-342,252},{-322,272}})));
    Modelica.Blocks.Sources.Constant FiO2Pure(k=1)
      annotation (Placement(transformation(extent={{-342,322},{-322,342}})));
    Modelica.Blocks.Math.Add add2(k2=-1)
      annotation (Placement(transformation(extent={{-310,316},{-290,336}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{-306,278},{-286,258}})));
    Modelica.Blocks.Math.Add add4
      annotation (Placement(transformation(extent={{-230,310},{-210,330}})));
    Modelica.Blocks.Math.Abs abs1
      annotation (Placement(transformation(extent={{-276,258},{-256,278}})));
    Modelica.Blocks.Math.Division division1
      annotation (Placement(transformation(extent={{10,10},{-10,-10}},
          rotation=90,
          origin={-188,300})));
    Modelica.Blocks.Math.Product product9
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-162,256})));
    Modelica.Blocks.Math.Product product10
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={-216,256})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate3(k(
          displayUnit="l/min") = SWEEP)
      annotation (Placement(transformation(extent={{-140,316},{-148,324}})));
    Physiolibrary.Fluid.Sources.PressureSource Sweep(redeclare package Medium
        = Air, use_concentration_start=false)
      annotation (Placement(transformation(extent={{-26,176},{-46,196}})));
    Physiolibrary.Fluid.Components.ElasticVessel Alveoly(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-212,616})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureAlveols(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-168,628},{-148,648}})));
    Physiolibrary.Fluid.Components.Conductor conductor3(redeclare package
        Medium =
          Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
        C_ventilation)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-286,638})));
    Chemical.Components.GasSolubility O2(KC=1e-4)
      annotation (Placement(transformation(extent={{-240,564},{-220,584}})));
    Chemical.Components.GasSolubility CO2(KC=1e-4)
      annotation (Placement(transformation(extent={{-196,568},{-176,588}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Lungs(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-294,562},{-274,582}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Lungs(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-136,574})));
    Physiolibrary.Fluid.Components.Conductor conductor4(redeclare package
        Medium =
          Blood, Conductance=C_cirkulation*(8/7))
      annotation (Placement(transformation(extent={{-276,460},{-256,480}})));
    Physiolibrary.Fluid.Components.Conductor conductor5(redeclare package
        Medium =
          Blood, Conductance=C_cirkulation*8)
      annotation (Placement(transformation(extent={{-106,464},{-86,484}})));
    Physiolibrary.Fluid.Components.ElasticVessel LungCapilars(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=4) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-198,530})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureCapilarsLungs(
        redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-112,536},{-92,556}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureAlveols(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-42,608},{-22,628}})));
    Physiolibrary.Fluid.Sensors.pH pH_Veins(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-218,-138},{-238,-118}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureSweep(redeclare package
        Medium = Physiolibrary.Media.Air) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-88,184})));
    Physiolibrary.Fluid.Components.Conductor conductor6(redeclare package
        Medium =
          Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
        C_ventilation)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-98,638})));
    Modelica.Blocks.Math.Max max3 annotation (Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={-148,26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate4(k(
          displayUnit="l/min") = 0)
      annotation (Placement(transformation(extent={{-112,50},{-120,58}})));
    Physiolibrary.Fluid.Sensors.pH pH_LungA(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-420,432},{-400,452}})));
    Physiolibrary.Fluid.Sensors.pH pH_LungV(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{86,430},{66,450}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureECMO(redeclare package
        Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-274,102})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureLungsArteries(
        redeclare package Medium = Blood)
      annotation (Placement(transformation(extent={{-388,494},{-368,514}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureAlveols1(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-60,672},{-40,692}})));
  equation
    connect(resistor1.q_in, Arteries.q_in[1]) annotation (Line(
        points={{-150,-164},{-125.9,-164},{-125.9,-156.549}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor2.q_in, Tissue.q_in[1]) annotation (Line(
        points={{-210,-164},{-210,-248.1},{-192.167,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor1.q_out, Tissue.q_in[2]) annotation (Line(
        points={{-170,-164},{-170,-248.1},{-191.3,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(PressureCapilarsTissue.q_in, Tissue.q_in[3]) annotation (Line(
        points={{-268,-234},{-190.433,-234},{-190.433,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(O2_left.port_a, Tissue.substances[2]) annotation (Line(points={{-256,-300},
            {-190,-300},{-190,-258}}, color={158,66,200}));
    connect(O2_left.port_a, pO2_tissue.port_a) annotation (Line(points={{-256,-300},
            {-234,-300},{-234,-270},{-256,-270}}, color={158,66,200}));
    connect(pO2_tissue.referenceFluidPort, Tissue.q_in[4]) annotation (Line(
        points={{-266,-260.2},{-266,-248},{-212,-248},{-212,-248.1},{-189.567,
            -248.1}},
        color={127,0,0},
        thickness=0.5));

    connect(pCO2_tissue.referenceFluidPort, Tissue.q_in[5]) annotation (Line(
        points={{-118,-260.2},{-118,-248.1},{-188.7,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(CO2_in.port_b, Tissue.substances[3]) annotation (Line(points={{-130,-300},
            {-190,-300},{-190,-258}}, color={158,66,200}));
    connect(CO2_in.port_b, pCO2_tissue.port_a) annotation (Line(points={{-130,-300},
            {-154,-300},{-154,-270},{-128,-270}}, color={158,66,200}));
    connect(resistor2.q_out, Veins.q_in[1]) annotation (Line(
        points={{-230,-164},{-256.1,-164},{-256.1,-159.771}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2Arteries.port_a, Arteries.substances[2]) annotation (Line(points={{-86,
            -190},{-116,-190},{-116,-159}},
                                         color={158,66,200}));
    connect(pO2Arteries.referenceFluidPort, Arteries.q_in[2]) annotation (Line(
        points={{-76,-199.8},{-125.9,-199.8},{-125.9,-157.366}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Arteries.referenceFluidPort, Arteries.q_in[3]) annotation (Line(
        points={{-74,-153.8},{-74,-158.183},{-125.9,-158.183}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Arteries.port_a, Arteries.substances[3])
      annotation (Line(points={{-84,-144},{-116,-144},{-116,-159}},
                                                           color={158,66,200}));
    connect(BodyHeat.port, conductor.q_in) annotation (Line(
        points={{-210,-340},{-192,-340}},
        color={191,0,0},
        thickness=0.5));
    connect(conductor.q_out, Tissue.heatPort) annotation (Line(
        points={{-172,-340},{-170,-340},{-170,-258},{-179.8,-258},{-179.8,-254}},
        color={191,0,0},
        thickness=0.5));

    connect(PressureVeins.q_in, Veins.q_in[2]) annotation (Line(
        points={{-380,-212},{-250,-212},{-250,-160.514},{-256.1,-160.514}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureECMOAirTube.q_in, ECMOAirTube.q_in[1]) annotation (Line(
        points={{-140,206},{-188.05,206},{-188.05,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(ECMOHeater.port, conductor1.q_in) annotation (Line(
        points={{-74,108},{-112,108}},
        color={191,0,0},
        thickness=0.5));
    connect(conductor1.q_out, ECMOBloodTube.heatPort) annotation (Line(
        points={{-132,108},{-179.8,108}},
        color={191,0,0},
        thickness=0.5));
    connect(flowMeasureCardiacOutput.q_out, Arteries.q_in[4]) annotation (Line(
        points={{8,-48},{8,-159},{-125.9,-159}},
        color={127,0,0},
        thickness=0.5));
    connect(heartRight.q_in, Veins.q_in[3]) annotation (Line(
        points={{-372,-20},{-372,-161.257},{-256.1,-161.257}},
        color={127,0,0},
        thickness=0.5));
    connect(heartRight.q_out, LungsArteries.q_in[1]) annotation (Line(
        points={{-372,0},{-372,424},{-372.1,424},{-372.1,444.08}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_out, LungsVeins.q_in[1]) annotation (Line(
        points={{-176,392},{12.1,392},{12.1,442.08}},
        color={127,0,0},
        thickness=0.5));
    connect(heartLeft.q_in, LungsVeins.q_in[2]) annotation (Line(
        points={{8,4},{12.1,441.04}},
        color={127,0,0},
        thickness=0.5));
    connect(heartLeft.q_out, flowMeasureCardiacOutput.q_in) annotation (Line(
        points={{8,-16},{8,-28}},
        color={127,0,0},
        thickness=0.5));
    connect(LungsArteries.q_in[2], shunt.q_in) annotation (Line(
        points={{-372.1,443.04},{-372,443.04},{-372,392},{-196,392}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureSource.y, DeadSpace.q_in) annotation (Line(
        points={{-356,682},{-204,682}},
        color={127,0,0},
        thickness=0.5));

    connect(O2PressureSource.y,O2PumpECMO. q_in) annotation (Line(
        points={{-274,222},{-256,222}},
        color={127,0,0},
        thickness=0.5));
    connect(O2PumpECMO.q_out, ECMOAirTube.q_in[2]) annotation (Line(
        points={{-236,222},{-189.35,222},{-189.35,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(AirPumpECMO.q_out, ECMOAirTube.q_in[3]) annotation (Line(
        points={{-232,184},{-194,184},{-194,188},{-190.65,188},{-190.65,183.9}},
        color={127,0,0},
        thickness=0.5));

    connect(AirPressureSource.y, AirPumpECMO.q_in) annotation (Line(
        points={{-274,184},{-252,184}},
        color={127,0,0},
        thickness=0.5));
    connect(O2Diffusion.port_b, ECMOAirTube.substances[1]) annotation (Line(
          points={{-202,146},{-202,152},{-190,152},{-190,174}},
                                                              color={158,66,200}));
    connect(CO2Diffusion.port_b, ECMOAirTube.substances[2]) annotation (Line(
          points={{-176,146},{-176,152},{-190,152},{-190,174}},
                                                        color={158,66,200}));
    connect(CO2Diffusion.port_a, ECMOBloodTube.substances[3]) annotation (Line(
          points={{-176,126},{-176,112},{-190,112}},color={158,66,200}));
    connect(O2Diffusion.port_a, ECMOBloodTube.substances[2])
      annotation (Line(points={{-202,126},{-202,114},{-190,114},{-190,112}},
                                                       color={158,66,200}));
    connect(StarlingSlopeRight.y, product2.u1)
      annotation (Line(points={{-433,-4},{-418,-4}}, color={0,0,127}));
    connect(PressureVeins.pressure, product2.u2) annotation (Line(points={{-390,
            -210},{-418,-210},{-418,-16}},                         color={0,0,127}));
    connect(product2.y, heartRight.solutionFlow) annotation (Line(points={{-395,
            -10},{-390,-10},{-390,-8},{-379,-8},{-379,-10}},
                                                      color={0,0,127}));
    connect(pressureLungsVein.pressure, product1.u2)
      annotation (Line(points={{42,110},{90,110}},   color={0,0,127}));
    connect(product1.y, heartLeft.solutionFlow) annotation (Line(points={{113,116},
            {122,116},{122,-6},{15,-6}},  color={0,0,127}));
    connect(pressureLungsVein.q_in, LungsVeins.q_in[3]) annotation (Line(
        points={{32,108},{32,88},{12.1,88},{12.1,440}},
        color={127,0,0},
        thickness=0.5));

    connect(const1.y, product4.u2)
      annotation (Line(points={{-135,-30},{-180,-30}},
                                               color={0,0,127}));
    connect(product4.y,VVECMOpump. solutionFlow) annotation (Line(points={{-203,
            -24},{-212,-24},{-212,-49}},              color={0,0,127}));
    connect(pressureArterial.q_in, Arteries.q_in[5]) annotation (Line(
        points={{-118,-224},{-126,-224},{-126,-159.817},{-125.9,-159.817}},
        color={127,0,0},
        thickness=0.5));
    connect(const.y, product3.u1)
      annotation (Line(points={{-65,38},{-38,38},{-38,-16}}, color={0,0,127}));
    connect(product3.y, VAECMOpump.solutionFlow)
      annotation (Line(points={{-44,-39},{-44,-49}}, color={0,0,127}));
    connect(pressureOxygenator.q_in, ECMOBloodTube.q_in[1]) annotation (Line(
        points={{-156,140},{-156,102.1},{-191.95,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_Arteries.referenceFluidPort, Arteries.q_in[6]) annotation (Line(
        points={{-180,-141.8},{-180,-176},{-125.9,-176},{-125.9,-160.634}},
        color={127,0,0},
        thickness=0.5));
    connect(ECMOFlowSlope.y, product7.u2) annotation (Line(points={{-317,26},{-302,
            26},{-302,52},{-296,52},{-296,54}},
                                              color={0,0,127}));
    connect(ECMOFlowIntercept.y, add1.u1) annotation (Line(points={{-317,-10},{-288,
            -10},{-288,48},{-260,48}},  color={0,0,127}));
    connect(pCO2Veins.referenceFluidPort, Veins.q_in[4]) annotation (Line(
        points={{-320,-128.2},{-272,-128.2},{-272,-162},{-256.1,-162}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2Veins.referenceFluidPort, Veins.q_in[5]) annotation (Line(
        points={{-328,-174.2},{-320,-174.2},{-320,-170},{-256.1,-170},{-256.1,
            -162.743}},
        color={127,0,0},
        thickness=0.5));

    connect(pO2Veins.port_a, Veins.substances[2]) annotation (Line(points={{-318,-184},
            {-304,-184},{-304,-182},{-266,-182},{-266,-162}}, color={158,66,200}));
    connect(pCO2Veins.port_a, Veins.substances[3]) annotation (Line(points={{-310,
            -138},{-294,-138},{-294,-144},{-266,-144},{-266,-162}}, color={158,66,
            200}));
    connect(product7.y, add1.u2) annotation (Line(points={{-273,60},{-260,60}},
                              color={0,0,127}));
    connect(volumeFlowRate2.y, product8.u1) annotation (Line(points={{-271,28},{-230,
            28},{-230,42},{-220,42}},
                             color={0,0,127}));
    connect(add1.y, product8.u2) annotation (Line(points={{-237,54},{-237,54},{-220,
            54}},                       color={0,0,127}));
    connect(FiO2ECMO.y, add2.u2) annotation (Line(points={{-321,296},{-312,296},{-312,
            320}}, color={0,0,127}));
    connect(FiO2Pure.y, add2.u1)
      annotation (Line(points={{-321,332},{-312,332}}, color={0,0,127}));
    connect(FiO2AIR.y, add3.u1)
      annotation (Line(points={{-321,262},{-308,262}}, color={0,0,127}));
    connect(add3.u2, FiO2ECMO.y) annotation (Line(points={{-308,274},{-310,274},{-310,
            296},{-321,296}}, color={0,0,127}));
    connect(add3.y, abs1.u)
      annotation (Line(points={{-285,268},{-278,268}}, color={0,0,127}));
    connect(add2.y, add4.u1)
      annotation (Line(points={{-289,326},{-232,326}}, color={0,0,127}));
    connect(abs1.y, add4.u2) annotation (Line(points={{-255,268},{-248,268},{-248,
            314},{-232,314}}, color={0,0,127}));
    connect(add4.y, division1.u2) annotation (Line(points={{-209,320},{-194,320},{
            -194,312}}, color={0,0,127}));
    connect(volumeFlowRate3.y, division1.u1) annotation (Line(points={{-149,320},{
            -182,320},{-182,312}}, color={0,0,127}));
    connect(product10.u1, add4.u2) annotation (Line(points={{-222,268},{-248,268},
            {-248,314},{-232,314}}, color={0,0,127}));
    connect(product10.u2, division1.y) annotation (Line(points={{-210,268},{-188,268},
            {-188,289}}, color={0,0,127}));
    connect(product10.y, O2PumpECMO.solutionFlow) annotation (Line(points={{-216,245},
            {-216,240},{-246,240},{-246,229}}, color={0,0,127}));
    connect(product9.u1, division1.y) annotation (Line(points={{-168,268},{-188,268},
            {-188,289}}, color={0,0,127}));
    connect(add2.y, product9.u2) annotation (Line(points={{-289,326},{-290,326},{-290,
            342},{-134,342},{-134,268},{-156,268}}, color={0,0,127}));
    connect(product9.y, AirPumpECMO.solutionFlow) annotation (Line(points={{-162,245},
            {-162,230},{-228,230},{-228,191},{-242,191}}, color={0,0,127}));
    connect(conductor2.q_in, ECMOAirTube.q_in[4]) annotation (Line(
        points={{-140,184},{-166,184},{-166,183.9},{-191.95,183.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureAlveols.q_in, Alveoly.q_in[1]) annotation (Line(
        points={{-168,638},{-210,638},{-210,615.9},{-213.733,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(Alveoly.substances[1],O2. gas_port) annotation (Line(points={{-212,
            606},{-212,592},{-220,592},{-220,590},{-234,590},{-234,584},{-230,
            584}},                           color={158,66,200}));
    connect(Alveoly.substances[2],CO2. gas_port) annotation (Line(points={{-212,
            606},{-212,588},{-186,588}},   color={158,66,200}));
    connect(pressureCapilarsLungs.q_in, LungCapilars.q_in[1]) annotation (Line(
        points={{-106,540},{-106,520},{-136,520},{-136,496},{-200,496},{-200,
            510},{-196.05,510},{-196.05,530.1}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port, LungCapilars.substances[2]) annotation (Line(points=
           {{-230,564},{-230,550},{-198,550},{-198,540}}, color={158,66,200}));
    connect(CO2.liquid_port, LungCapilars.substances[3]) annotation (Line(
          points={{-186,568},{-186,550},{-198,550},{-198,540}}, color={158,66,
            200}));
    connect(pO2Lungs.referenceFluidPort, LungCapilars.q_in[2]) annotation (Line(
        points={{-284,562.2},{-284,496},{-200,496},{-200,510},{-197.35,510},{
            -197.35,530.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Lungs.referenceFluidPort, LungCapilars.q_in[2]) annotation (
        Line(
        points={{-136,564.2},{-136,494},{-200,494},{-200,510},{-197.35,510},{
            -197.35,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(O2.liquid_port, pO2Lungs.port_a) annotation (Line(points={{-230,564},
            {-230,550},{-254,550},{-254,572},{-274,572}}, color={158,66,200}));
    connect(CO2.liquid_port, pCO2Lungs.port_a) annotation (Line(points={{-186,
            568},{-186,550},{-160,550},{-160,574},{-146,574}},            color=
           {158,66,200}));
    connect(conductor4.q_out, LungCapilars.q_in[3]) annotation (Line(
        points={{-256,470},{-198,470},{-198,510},{-198.65,510},{-198.65,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(conductor5.q_in, LungCapilars.q_in[4]) annotation (Line(
        points={{-106,474},{-200,474},{-200,512},{-199.95,512},{-199.95,530.1}},
        color={127,0,0},
        thickness=0.5));

    connect(conductor4.q_in, LungsArteries.q_in[3]) annotation (Line(
        points={{-276,470},{-372,470},{-372,440},{-372.1,440},{-372.1,442}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor5.q_out, LungsVeins.q_in[4]) annotation (Line(
        points={{-86,474},{12,474},{12,440},{12.1,440},{12.1,438.96}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor3.q_in, DeadSpace.q_in) annotation (Line(
        points={{-296,638},{-322,638},{-322,682},{-204,682}},
        color={127,0,0},
        thickness=0.5));

    connect(pressureAlveols.q_in, Alveoly.q_in[2]) annotation (Line(
        points={{-36,612},{-212,612},{-212,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_Arteries.port_a, Arteries.substances[13]) annotation (Line(
          points={{-170,-132},{-116,-132},{-116,-159}},
          color={158,66,200}));
    connect(pH_Veins.referenceFluidPort, Veins.q_in[6]) annotation (Line(
        points={{-228,-137.8},{-228,-146},{-256.1,-146},{-256.1,-163.486}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_Veins.port_a, Veins.substances[13]) annotation (Line(points={{-238,
            -128},{-266,-128},{-266,-162}},                              color=
            {158,66,200}));
    connect(flowMeasureSweep.q_in, conductor2.q_out) annotation (Line(
        points={{-98,184},{-120,184}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureSweep.q_out, Sweep.y) annotation (Line(
        points={{-78,184},{-62,184},{-62,186},{-46,186}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor6.q_in, flowMeasureAlveols.q_out) annotation (Line(
        points={{-108,638},{-148,638}},
        color={127,0,0},
        thickness=0.5));
    connect(VAECMOpump.q_out, Arteries.q_in[7]) annotation (Line(
        points={{-34,-56},{-18,-56},{-18,-126},{-125.9,-126},{-125.9,-161.451}},
        color={127,0,0},
        thickness=0.5));

    connect(pH_LungA.referenceFluidPort, LungsArteries.q_in[4]) annotation (Line(
        points={{-410,432.2},{-410,408},{-372,408},{-372,424},{-372.1,424},{
            -372.1,440.96}},
        color={127,0,0},
        thickness=0.5));

    connect(pH_LungV.referenceFluidPort, LungsVeins.q_in[5]) annotation (Line(
        points={{76,430.2},{76,414},{12,414},{12,424},{12.1,424},{12.1,437.92}},
        color={127,0,0},
        thickness=0.5));
    connect(pH_LungA.port_a, LungsArteries.substances[13])
      annotation (Line(points={{-400,442},{-382,442}}, color={158,66,200}));
    connect(pH_LungV.port_a, LungsVeins.substances[13])
      annotation (Line(points={{66,440},{22,440}}, color={158,66,200}));
    connect(VVECMOpump.q_in, ECMOBloodTube.q_in[2]) annotation (Line(
        points={{-202,-56},{-168,-56},{-168,102.1},{-190.65,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(VAECMOpump.q_in, ECMOBloodTube.q_in[3]) annotation (Line(
        points={{-54,-56},{-168,-56},{-168,102.1},{-189.35,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(ECMOResistance.q_out, flowMeasureECMO.q_in) annotation (Line(
        points={{-306,102},{-300,102},{-300,102},{-284,102}},
        color={127,0,0},
        thickness=0.5));
    connect(Rotation.y, product7.u1)
      annotation (Line(points={{-319,66},{-296,66}}, color={0,0,127}));
    connect(product8.y, max3.u2)
      annotation (Line(points={{-197,48},{-154,48},{-154,38}}, color={0,0,127}));
    connect(volumeFlowRate4.y, max3.u1)
      annotation (Line(points={{-121,54},{-142,54},{-142,38}}, color={0,0,127}));
    connect(max3.y, product4.u1) annotation (Line(points={{-148,15},{-148,-18},{-180,
            -18}}, color={0,0,127}));
    connect(max3.y, product3.u2) annotation (Line(points={{-148,15},{-148,0},{-50,
            0},{-50,-16}}, color={0,0,127}));
    connect(flowMeasureECMO.q_out, ECMOBloodTube.q_in[4]) annotation (Line(
        points={{-264,102},{-226,102},{-226,102.1},{-188.05,102.1}},
        color={127,0,0},
        thickness=0.5));
    connect(StarlingSlopeLeft.y, product1.u1)
      annotation (Line(points={{61,122},{90,122}}, color={0,0,127}));
    connect(conductor3.q_out, Alveoly.q_in[3]) annotation (Line(
        points={{-276,638},{-210.267,638},{-210.267,615.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureLungsArteries.q_in, LungsArteries.q_in[5]) annotation (Line(
        points={{-382,498},{-382,439.92},{-372.1,439.92}},
        color={127,0,0},
        thickness=0.5));
    connect(VVECMOpump.q_out, Veins.q_in[7]) annotation (Line(
        points={{-222,-56},{-240,-56},{-240,-54},{-256.1,-54},{-256.1,-164.229}},
        color={127,0,0},
        thickness=0.5));

    connect(ECMOResistance.q_in, Tissue.q_in[6]) annotation (Line(
        points={{-326,102},{-352,102},{-352,-248.1},{-187.833,-248.1}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureAlveols1.q_out, MinuteVolume.q_in) annotation (Line(
        points={{-40,682},{-14,682}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor6.q_out, flowMeasureAlveols1.q_in) annotation (Line(
        points={{-88,638},{-70,638},{-70,682},{-60,682}},
        color={127,0,0},
        thickness=0.5));
    connect(DeadSpace.q_out, flowMeasureAlveols1.q_in) annotation (Line(
        points={{-184,682},{-60,682}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-660,-460},
              {660,740}})), Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-660,-460},{660,740}}), graphics={
          Rectangle(
            extent={{-356,378},{-10,-92}},
            lineColor={0,140,72},
            lineThickness=0.5),
          Text(
            extent={{-184,392},{6,326}},
            textColor={0,140,72},
            fontSize=10,
            textString="ECMO circuit"),
          Rectangle(
            extent={{-424,400},{152,-370}},
            lineColor={238,46,47},
            lineThickness=0.5),
          Text(
            extent={{78,388},{136,340}},
            textColor={238,46,47},
            fontSize=10,
            textString="Body"),
          Rectangle(
            extent={{-424,734},{150,410}},
            lineColor={28,108,200},
            lineThickness=0.5),
          Text(
            extent={{6,728},{96,688}},
            textColor={28,108,200},
            fontSize=10,
            textString="Lungs")}));
  end ECMOSimNoReg;

  package Experiments
    model ECMOSimNoRegHealthy
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00015,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegHealthy;

    model ECMOSimRegHealthy
      extends modelECMO.ECMOSimReg(
        DVfraction=0.3,
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegHealthy;

    model ECMOSimRegDeadVol
      extends modelECMO.ECMOSimReg(
        DVfraction=0.97,
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegDeadVol;

    model ECMOSimRegDeadVolVVECMO
      extends modelECMO.ECMOSimReg(
        DVfraction=0.97,
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=3000,
        SWEEP=5000/60000000,
        FiO2=1);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegDeadVolVVECMO;

    model ECMOSimNoRegDeadVol
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00035,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegDeadVol;

    model ECMOSimNoRegDeadVolVVECMO
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00035,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=2500,
        SWEEP=2500/60000000,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegDeadVolVVECMO;

    model ECMOSimNoRegShunts
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.65,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00015,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=1);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegShunts;

    model ECMOSimNoRegShuntsVVECMO
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.65,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00015,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=3500,
        SWEEP=2000/60000000,
        FiO2=0.8);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegShuntsVVECMO;

    model ECMOSimRegShunts
      extends modelECMO.ECMOSimReg(
        DVfraction=0.3,
        Shunts=0.65,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegShunts;

    model ECMOSimRegShuntsVVECMO
      extends modelECMO.ECMOSimReg(
        DVfraction=0.3,
        Shunts=0.65,
        StarlingLeft=1.250102626409427e-07*(5/4),
        StarlingRight=1.250102626409427e-07*(5/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=3500,
        SWEEP=2000/60000000,
        FiO2=0.8);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegShuntsVVECMO;

    model ECMOSimRegHeartFailure
      extends modelECMO.ECMOSimReg(
        DVfraction=0.3,
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(1/8),
        StarlingRight=1.250102626409427e-07*(2/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegHeartFailure;

    model ECMOSimRegHeartFailureVAECMO
      extends modelECMO.ECMOSimReg(
        DVfraction=0.3,
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(1/8),
        StarlingRight=1.250102626409427e-07*(2/4),
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=1,
        RPM=3000,
        SWEEP=5000/60000000,
        FiO2=0.8);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimRegHeartFailureVAECMO;

    model ECMOSimNoRegHeartFailure
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(1/8),
        StarlingRight=1.250102626409427e-07*(2/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00015,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=0,
        RPM=0,
        SWEEP=0,
        FiO2=0.21);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegHeartFailure;

    model ECMOSimNoRegHeartFailureVAECMO
      extends modelECMO.ECMOSimNoReg(
        Shunts=0.02,
        StarlingLeft=1.250102626409427e-07*(1/8),
        StarlingRight=1.250102626409427e-07*(2/4),
        RR=17/60,
        TV=0.0005,
        DV=0.00015,
        O2BMR=14.5/60000,
        CO2BMR=11.6/60000,
        VAV=1,
        RPM=3000,
        SWEEP=5000/60000000,
        FiO2=0.8);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ECMOSimNoRegHeartFailureVAECMO;
  end Experiments;

  annotation (uses(
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0"),
      Physiolibrary(version="3.0.0-alpha11")), version="1");
end modelECMO;
