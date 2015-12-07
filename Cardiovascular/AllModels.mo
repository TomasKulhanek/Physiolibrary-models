package Cardiovascular  
  model System  
    replaceable Interfaces.Heart heart;
    replaceable Interfaces.Systemic systemicCirculation;
    replaceable Interfaces.Pulmonary pulmonaryCirculation;
  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow);
    connect(systemicCirculation.q_in, heart.leftHeartOutflow);
    connect(heart.leftHeartInflow, pulmonaryCirculation.q_out);
    connect(heart.rightHeartOutflow, pulmonaryCirculation.q_in);
  end System;

  package Interfaces  
    extends Modelica.Icons.InterfacesPackage;

    partial model Heart  "Abstract heart circulation submodel" 
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow;
    end Heart;

    partial model Systemic  "Abstract systemic circulation submodel" 
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out;
    end Systemic;

    partial model Pulmonary  "Abstract pulmonary circulation submodel" 
      extends Physiolibrary.Icons.PulmonaryCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out;
    end Pulmonary;
  end Interfaces;

  package Controlled  
    extends Modelica.Icons.InterfacesPackage;

    partial model System  "Interface for cardiovascular system controlled by short-term(baroreflex), long-term(blood volume) and pathologies(stenosis)" 
      extends Cardiovascular.System(redeclare replaceable Pulmonary pulmonaryCirculation constrainedby Controlled.Pulmonary, redeclare replaceable Heart heart constrainedby Controlled.Heart, redeclare replaceable Systemic systemicCirculation constrainedby Controlled.Systemic);
      replaceable ShortTermControl shortTermControl;
      replaceable LongTermControl longTermControl;
      replaceable ScenarioControl scenarioControl;
    equation
      connect(pulmonaryCirculation.busConnector, heart.busConnector);
      connect(systemicCirculation.busConnector, heart.busConnector);
      connect(shortTermControl.busConnector, heart.busConnector);
      connect(longTermControl.busConnector, heart.busConnector);
      connect(longTermControl.port_a, heart.rightHeartInflow);
      connect(scenarioControl.busConnector, heart.busConnector);
    end System;

    model Pulmonary  "Abstract controlled pulmonary circulation submodel" 
      extends Cardiovascular.Interfaces.Pulmonary;
      Physiolibrary.Types.BusConnector busConnector;
    end Pulmonary;

    partial model Heart  "Abstract controlled heart circulation submodel" 
      extends Cardiovascular.Interfaces.Heart;
      Physiolibrary.Types.BusConnector busConnector;
    end Heart;

    model Systemic  "Abstract controlled systemic circulation submodel" 
      extends Cardiovascular.Interfaces.Systemic;
      Physiolibrary.Types.BusConnector busConnector;
    end Systemic;

    partial model LongTermControl  "Abstract submodel of long-term volume control" 
      Physiolibrary.Types.BusConnector busConnector;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a;
      Model.Control.BloodVolume.VolumeRefill2 volumeRefill;
    equation
      connect(volumeRefill.busConnector, busConnector) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
      connect(volumeRefill.port_b, port_a);
    end LongTermControl;

    partial model ShortTermControl  "Abstract submodel of short-term CVS parameters values" 
      Physiolibrary.Types.BusConnector busConnector;
    end ShortTermControl;

    model ScenarioControl  "Abstract submodel of possible scenarios" 
      Physiolibrary.Types.BusConnector busConnector;
    end ScenarioControl;
  end Controlled;

  package Model  
    extends Modelica.Icons.ExamplesPackage;

    package Meurs  
      extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsMeurs_shallow  
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(useV0Input = false, useComplianceInput = false, volume_start = 0.000106, ZeroPressureVolume = 5e-05, Compliance = 3.2185142219537e-08, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.Conductor PulmonaryArteriesResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 6.818059724437e-08);
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(useV0Input = false, useComplianceInput = false, volume_start = 0.000518, ZeroPressureVolume = 0.00035, Compliance = 1.6486353437088e-07, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06);
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftAtrium(useComplianceInput = true, useV0Input = false, volume_start = 9.31e-05, ZeroPressureVolume = 3e-05, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftVentricle(useComplianceInput = true, useV0Input = false, volume_start = 0.000144, ZeroPressureVolume = 6e-05, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve(_Gon(displayUnit = "ml/(mmHg.s)") = 9.3757696980707e-07, _Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false);
        Parts.AtrialElastance atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762);
        Parts.VentricularElastance ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66);
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve(_Gon(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06, useLimitationInputs = false, _Goff(displayUnit = "ml/(mmHg.s)") = 0);
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(useV0Input = false, useComplianceInput = false, useExternalPressureInput = true, volume_start = 0.000204, ZeroPressureVolume = 0.00014, Compliance = 5.2429304151611e-09, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(volume_start(displayUnit = "ml") = 0.000526, useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, ZeroPressureVolume = 0.00037, Compliance = 1.3493607749463e-08);
        Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905, volumeFlow_start(displayUnit = "ml/min") = 2.1666666666667e-05);
        Physiolibrary.Hydraulic.Components.Conductor ArteryResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 1.2526028316622e-07);
        Physiolibrary.Hydraulic.Components.Conductor SystemicArterioralConductance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 9.3757696980707e-09);
        Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-08);
        Physiolibrary.Hydraulic.Components.ElasticVessel PeripheralVessels(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.000283, ZeroPressureVolume = 0.000185, Compliance = 2.8652352197304e-08);
        Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 8.3256834918868e-08);
        Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06);
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(useV0Input = false, useComplianceInput = false, useExternalPressureInput = true, volume_start = 0.00148, ZeroPressureVolume = 0.00119, Compliance = 4.1178380513927e-07, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.00153, ZeroPressureVolume = 0.001, Compliance = 4.4403645290063e-07);
        Physiolibrary.Hydraulic.Components.ElasticVessel RightAtrium(useComplianceInput = true, useV0Input = false, volume_start = 0.000135, ZeroPressureVolume = 3e-05, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(useComplianceInput = true, useV0Input = false, volume_start = 0.000131, ZeroPressureVolume = 4e-05, useExternalPressureInput = true, ExternalPressure = -533.28954966);
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve1(_Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false, _Gon(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06);
        Parts.AtrialElastance atrialElastance1(EMIN = 6666119.37075, EMAX = 19998358.11225);
        Parts.VentricularElastance ventricularElastance1(EMIN = 7599376.082655, EMAX = 65327969.83335);
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve1(_Gon(displayUnit = "ml/(mmHg.s)") = 2.497705047566e-06, _Goff = 0, useLimitationInputs = false);
        replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2);
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k = -533.28954966);
      equation
        connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in);
        connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in);
        connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in);
        connect(LeftAtrium.q_in, atrioVentricleValve.q_in);
        connect(LeftVentricle.q_in, atrioVentricleValve.q_out);
        connect(LeftVentricle.q_in, ventricleArteryValve.q_in);
        connect(LeftVentricle.compliance, ventricularElastance.Ct);
        connect(PulmonaryVeinResistance.q_out, LeftAtrium.q_in);
        connect(ArteryResistance.q_in, ExtrathoracicArteries.q_in);
        connect(ArteryResistance.q_out, inertia.q_out);
        connect(inertia.q_in, IntraThoracicArteries.q_in);
        connect(IntraThoracicArteries.q_in, ventricleArteryValve.q_out);
        connect(SystemicArterioralConductance.q_out, PeripheralVessels.q_in);
        connect(PeripheralVessels.q_in, SmallVenuleConductance.q_in);
        connect(SystemicArterioralConductance.q_in, ExtrathoracicArteries.q_in);
        connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in);
        connect(IntraThoracicVeins.q_in, VeinsResistance.q_out);
        connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in);
        connect(ExtrathoracicVeins.q_in, SmallVenuleConductance.q_out);
        connect(RightAtrium.q_in, atrioVentricleValve1.q_in);
        connect(rightVentricle.q_in, atrioVentricleValve1.q_out);
        connect(rightVentricle.q_in, ventricleArteryValve1.q_in);
        connect(CentralVenousResistance.q_out, RightAtrium.q_in);
        connect(RightAtrium.compliance, atrialElastance1.Ct);
        connect(ventricleArteryValve1.q_out, PulmonaryArteries.q_in);
        connect(rightVentricle.compliance, ventricularElastance1.Ct);
        connect(LeftAtrium.compliance, atrialElastance.Ct);
        connect(HeartRate.y, atrialElastance1.HR);
        connect(ventricularElastance1.HR, HeartRate.y);
        connect(atrialElastance.HR, HeartRate.y);
        connect(ventricularElastance.HR, HeartRate.y);
        connect(IntraThoracicPressure.y, PulmonaryArteries.externalPressure);
        connect(IntraThoracicPressure.y, PulmonaryVeins.externalPressure);
        connect(LeftAtrium.externalPressure, LeftVentricle.externalPressure);
        connect(LeftAtrium.externalPressure, PulmonaryVeins.externalPressure);
        connect(IntraThoracicPressure.y, rightVentricle.externalPressure);
        connect(RightAtrium.externalPressure, rightVentricle.externalPressure);
        connect(IntraThoracicVeins.externalPressure, rightVentricle.externalPressure);
        connect(IntraThoracicArteries.externalPressure, LeftVentricle.externalPressure);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000)); 
      end HemodynamicsMeurs_shallow;

      model HemodynamicsMeurs  
        extends Cardiovascular.System(redeclare Parts.Pulmonary pulmonaryCirculation, redeclare Parts.Heart heart, redeclare Parts.Systemic systemicCirculation);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000)); 
      end HemodynamicsMeurs;

      package Parts  
        extends Modelica.Icons.UtilitiesPackage;

        model Pulmonary  
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PulmonaryArteries(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.000106, ZeroPressureVolume = 5e-05, ExternalPressure = -533.28954966, Elastance = 31064116.267695);
          Physiolibrary.Hydraulic.Components.Resistor PulmonaryArteriesResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 14665462.61565);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PulmonaryVeins(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.000518, ZeroPressureVolume = 0.00035, ExternalPressure = -533.28954966, Elastance = 6066168.6273825);
          Physiolibrary.Hydraulic.Components.Resistor PulmonaryVeinResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 399967.162245);
        equation
          connect(q_in, PulmonaryArteries.q_in);
          connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in);
          connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in);
          connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in);
          connect(PulmonaryVeinResistance.q_out, q_out);
        end Pulmonary;

        model Systemic  
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance IntraThoracicArteries(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.000204, ZeroPressureVolume = 0.00014, ExternalPressure = -533.28954966, Elastance = 190651014.00345);
          Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905, volumeFlow_start(displayUnit = "ml/min") = 2.1666666666667e-05);
          Physiolibrary.Hydraulic.Components.Resistor ArteryResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 7999343.2449);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance ExtrathoracicArteries(volume_start(displayUnit = "ml") = 0.000526, useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, ZeroPressureVolume = 0.00037, Elastance = 74127247.40274);
          Physiolibrary.Hydraulic.Components.Resistor SystemicArterioralResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 106657909.932);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PeripheralVessels(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.000283, ZeroPressureVolume = 0.000185, Elastance = 34930465.50273);
          Physiolibrary.Hydraulic.Components.Resistor SmallVenuleResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 26664477.483);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance ExtrathoracicVeins(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.00153, ZeroPressureVolume = 0.001, Elastance = 2253148.3473135);
          Physiolibrary.Hydraulic.Components.Resistor VeinsResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 11999014.86735);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance IntraThoracicVeins(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false, volume_start = 0.00148, ZeroPressureVolume = 0.00119, ExternalPressure = -533.28954966, Elastance = 2426467.450953);
          Physiolibrary.Hydraulic.Components.Resistor CentralVenousResistance(useConductanceInput = false, Resistance(displayUnit = "(mmHg.s)/ml") = 399967.162245);
        equation
          connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in);
          connect(inertia.q_in, IntraThoracicArteries.q_in);
          connect(ArteryResistance.q_in, inertia.q_out);
          connect(ExtrathoracicArteries.q_in, SystemicArterioralResistance.q_in);
          connect(q_out, CentralVenousResistance.q_out);
          connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in);
          connect(IntraThoracicVeins.q_in, VeinsResistance.q_out);
          connect(q_in, q_in);
          connect(q_in, IntraThoracicArteries.q_in);
          connect(SmallVenuleResistance.q_out, ExtrathoracicVeins.q_in);
          connect(ExtrathoracicArteries.q_in, ArteryResistance.q_out);
          connect(SmallVenuleResistance.q_in, PeripheralVessels.q_in);
          connect(PeripheralVessels.q_in, SystemicArterioralResistance.q_out);
        end Systemic;

        model Heart  
          extends Cardiovascular.Interfaces.Heart;
          Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false, volume_start = 0.000135, ZeroPressureVolume = 3e-05, ExternalPressure = -533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance atrioVentricleValve1(_Goff = 0, useLimitationInputs = false, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false, volume_start = 0.000131, ZeroPressureVolume = 4e-05, ExternalPressure = -533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance ventricleArteryValve1(_Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245);
          VentricularElastance ventricularElastance1(EMIN = 7599376.082655, EMAX = 65327969.83335);
          AtrialElastance atrialElastance1(EMIN = 6666119.37075, EMAX = 19998358.11225);
          replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2);
          Physiolibrary.Hydraulic.Components.ElasticVessel leftAtrium(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false, volume_start = 9.31e-05, ZeroPressureVolume = 3e-05, ExternalPressure = -533.28954966);
          AtrialElastance atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762);
          Physiolibrary.Hydraulic.Components.IdealValveResistance atrioVentricleValve(useLimitationInputs = false, _Goff(displayUnit = "ml/(mmHg.s)") = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false, volume_start = 0.000144, ZeroPressureVolume = 6e-05, ExternalPressure = -533.28954966);
          VentricularElastance ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66);
          Physiolibrary.Hydraulic.Components.IdealValveResistance ventricleArteryValve(_Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false, _Ron(displayUnit = "(mmHg.s)/ml") = 1066579.09932);
        equation
          connect(rightHeartInflow, rightAtrium.q_in);
          connect(rightAtrium.q_in, atrioVentricleValve1.q_in);
          connect(atrioVentricleValve1.q_out, rightVentricle.q_in);
          connect(rightVentricle.q_in, ventricleArteryValve1.q_in);
          connect(ventricleArteryValve1.q_out, rightHeartOutflow);
          connect(leftHeartInflow, leftAtrium.q_in);
          connect(leftAtrium.q_in, atrioVentricleValve.q_in);
          connect(atrioVentricleValve.q_out, leftVentricle.q_in);
          connect(leftVentricle.q_in, ventricleArteryValve.q_in);
          connect(ventricleArteryValve.q_out, leftHeartOutflow);
          connect(atrialElastance1.Ct, rightAtrium.compliance);
          connect(ventricularElastance1.Ct, rightVentricle.compliance);
          connect(atrialElastance1.HR, HeartRate.y);
          connect(ventricularElastance1.HR, HeartRate.y);
          connect(ventricularElastance.HR, HeartRate.y);
          connect(atrialElastance.HR, HeartRate.y);
          connect(atrialElastance.Ct, leftAtrium.compliance);
          connect(ventricularElastance.Ct, leftVentricle.compliance);
        end Heart;

        model AtrialElastance  
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct "compliance";
          Physiolibrary.Types.HydraulicElastance Et "elasticity";
          parameter Physiolibrary.Types.HydraulicElastance EMIN "Diastolic elastance";
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation(Evaluate = true, HideResult = true);
          parameter Physiolibrary.Types.HydraulicElastance EMAX "Maximum systolic elastance";
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start = 1 / Ees) = 1 / es_int if useEs_extInput;
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          if time - T0 < Tas then
            Et = EMIN + (es_int - EMIN) * sin(Modelica.Constants.pi * (time - T0) / Tas);
          else
            Et = EMIN;
          end if;
          Ct = 1 / Et "reciprocal value of elastance";
        end AtrialElastance;

        model VentricularElastance  
          extends HeartIntervals;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct "ventricular elasticity";
          Modelica.Blocks.Interfaces.RealOutput Et0 "normalized ventricular elasticity (0..1)";
          Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time";
          Physiolibrary.Types.HydraulicElastance Et;
          parameter Physiolibrary.Types.HydraulicElastance EMIN "Diastolic elastance ";
          constant Real Kn = 0.57923032735652;
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation(Evaluate = true, HideResult = true);
          parameter Physiolibrary.Types.HydraulicElastance EMAX "Maximum systolic elastance";
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start = 1 / EMAX) = 1 / es_int if useEs_extInput;
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = EMAX;
          end if;
          HeartInterval = time - T0;
          Et = EMIN + (es_int - EMIN) * Et0;
          if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
            Et0 = (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn;
          else
            Et0 = 0;
          end if;
          Ct = 1 / Et "reciprocal value of elastance";
        end VentricularElastance;

        model HeartIntervals  
          discrete Physiolibrary.Types.Time Tas;
          discrete Physiolibrary.Types.Time T0;
          discrete Physiolibrary.Types.Time Tvs;
          parameter Physiolibrary.Types.Time Tav(displayUnit = "s") = 0.01 "atrioventricular delay";
          discrete Modelica.SIunits.Time HP(start = 0) "heart period";
          Boolean b(start = false);
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate";
        equation
          b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
          when {initial(), b} then
            T0 = time "start time of cardiac cycle";
            HP = 1 / HR "update heart period per heart rate";
            Tas = 0.03 + 0.09 * HP "duration of atrial systole";
            Tvs = 0.16 + 0.2 * HP "duration of ventricular systole";
          end when;
        end HeartIntervals;
      end Parts;

      model HemodynamicsMeursBVControl  
        extends Cardiovascular.Controlled.System(redeclare replaceable ControlledParts.PulmonaryControl pulmonaryCirculation, redeclare replaceable ControlledParts.HeartControl heart, redeclare replaceable ControlledParts.SystemicControl systemicCirculation, redeclare replaceable ControlledParts.Baroreflex shortTermControl, redeclare replaceable Cardiovascular.Model.Control.BloodVolumeControl longTermControl);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000)); 
      end HemodynamicsMeursBVControl;

      package ControlledParts  
        extends Modelica.Icons.UtilitiesPackage;

        model PulmonaryControl  
          extends Parts.Pulmonary;
          extends Controlled.Pulmonary;
          Modelica.Blocks.Math.Add add;
        equation
          connect(PulmonaryArteries.volume, add.u1);
          connect(PulmonaryVeins.volume, add.u2);
          connect(add.y, busConnector.pulmonaryBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end PulmonaryControl;

        model SystemicControl  
          extends Parts.Systemic(SmallVenuleResistance(useConductanceInput = true), IntraThoracicArteries(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false), IntraThoracicVeins(useComplianceInput = true));
          extends Controlled.Systemic;
          Modelica.Blocks.Math.Sum sum1(nin = 5);
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement;
        equation
          connect(IntraThoracicVeins.volume, sum1.u[1]);
          connect(sum1.y, busConnector.systemicBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(aortaPressureMeasurement.q_in, inertia.q_in);
          connect(ExtrathoracicVeins.volume, sum1.u[2]);
          connect(PeripheralVessels.volume, sum1.u[3]);
          connect(ExtrathoracicArteries.volume, sum1.u[4]);
          connect(IntraThoracicArteries.volume, sum1.u[5]);
          connect(SmallVenuleResistance.cond, busConnector.peripheralconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(IntraThoracicVeins.compliance, busConnector.venacavacompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end SystemicControl;

        model HeartControl  
          extends Parts.Heart(ventricularElastance1(useEs_extInput = true), ventricularElastance(useEs_extInput = true), redeclare Types.Constants.FrequencyControl HeartRate, ventricleArteryValve(useLimitationInputs = false));
          extends Controlled.Heart;
          Modelica.Blocks.Math.Sum sum1(nin = 4);
        equation
          connect(rightAtrium.volume, sum1.u[1]);
          connect(rightVentricle.volume, sum1.u[2]);
          connect(leftVentricle.volume, sum1.u[3]);
          connect(leftAtrium.volume, sum1.u[4]);
          connect(sum1.y, busConnector.heartBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularElastance1.Es_ext, busConnector.rvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularElastance.Es_ext, busConnector.lvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(HeartRate.c, busConnector.heartrate) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end HeartControl;

        model Baroreflex  
          extends Model.Control.Baroreflex(baroreceptor(activationDelay = 1, PAOmedia = 12974.201470097, HR0Param = 1.2, EV0right = 65327969.83335, EV0left = 533289549.66, EV0venacava = 4.1215883592719e-07, RS0 = 26664477.483));
        end Baroreflex;

        model AorticValveStenosisScenario  
          extends Model.Scenario.StenosisControl(venacavastenosis(InitialElastance = 2426467.450953, FinalElastance = 2426467.450953), aorticstenosis(InitialResistance(displayUnit = "(mmHg.s)/ml") = 1066579.09932, FinalResistance(displayUnit = "(mmHg.s)/ml") = 1066579.09932), mitralvalvestenosis(InitialResistance = 399967.162245, FinalResistance = 399967.162245));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl  
          extends HeartControl(ventricleArteryValve(useLimitationInputs = true));
        equation
          connect(ventricleArteryValve.Gon, busConnector.avoutflowresistance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricleArteryValve.Goff, busConnector.avbackflowconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve  
        extends HemodynamicsMeursBVControl(redeclare ControlledParts.AorticValveStenosisScenario scenarioControl(aorticstenosis(FinalResistance(displayUnit = "(mmHg.s)/ml") = 10665790.9932)), redeclare ControlledParts.AorticValveHeartControl heart);
        annotation(experiment(StopTime = 120, __Dymola_NumberOfIntervals = 5000)); 
      end StenosisAorticValve;

      model Bleeding  
        extends HemodynamicsMeursBVControl(redeclare Scenario.BleedingTransfusionScenario scenarioControl(BloodTrans = 0, Tbd = 300, BloodLoss = 0.0005, Tts = 1200, Ttd = 600), longTermControl(redeclare Control.BloodVolume.PlasmaBleeding plasma(hemorrhage(useSolutionFlowInput = true)), redeclare Control.BloodVolume.RBCBleeding redBloodCells));
        annotation(experiment(StopTime = 3600, __Dymola_NumberOfIntervals = 5000)); 
      end Bleeding;
    end Meurs;

    package Burkhoff  
      extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsBurkhoff_shallow  
        .Physiolibrary.Hydraulic.Components.ElasticVessel Cvs(volume_start = 0.002701, ZeroPressureVolume = 0.00223, Compliance = 5.2504310309196e-07);
        .Physiolibrary.Hydraulic.Components.Resistor Ras(Resistance = 99991790.56125);
        .Physiolibrary.Hydraulic.Components.ElasticVessel Cas(volume_start = 0.000834, ZeroPressureVolume = 0.0007, Compliance = 1.2751046789376e-08);
        .Physiolibrary.Hydraulic.Components.Resistor Rcs(Resistance = 3199737.29796);
        .Physiolibrary.Hydraulic.Components.ElasticVessel Caprox(volume_start = 3.8e-05, ZeroPressureVolume = 3e-05, Compliance = 7.5006157584566e-10, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.Resistor Rcprox(Resistance = 2666447.7483);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance AOV(_Ron = 266644.77483);
        Parts.ElasticVesselWithSVandP LV(useComplianceInput = true, volume_start = 0.000125, ZeroPressureVolume = 5e-06, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance MV(_Ron = 333305.9685375);
        Parts.ElasticVesselWithSVandP LA(useComplianceInput = true, useExternalPressureInput = true, volume_start = 8.1e-05, ZeroPressureVolume = 5e-06);
        .Physiolibrary.Hydraulic.Components.Resistor Rvp(Resistance = 1999835.811225);
        .Physiolibrary.Hydraulic.Components.Resistor Rvs(Resistance = 2666447.7483);
        Parts.ElasticVesselWithSVandP RA(useComplianceInput = true, useExternalPressureInput = true, volume_start = 7.3e-05, ZeroPressureVolume = 5e-06);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance TV(_Ron(displayUnit = "(mmHg.s)/ml") = 333305.9685375);
        Parts.ElasticVesselWithSVandP RV(useComplianceInput = true, ExternalPressure = 0, volume_start = 0.000112, ZeroPressureVolume = 5e-06, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance PV(_Ron = 266644.77483);
        .Physiolibrary.Hydraulic.Components.Resistor Rcsp(Resistance = 2666447.7483);
        .Physiolibrary.Hydraulic.Components.ElasticVessel Cap(volume_start = 0.000802, ZeroPressureVolume = 0.0006, Compliance = 1.5001231516913e-07, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.Resistor Rcp(Resistance = 2666447.7483);
        .Physiolibrary.Hydraulic.Components.ElasticVessel Cvp(volume_start = 0.000154, ZeroPressureVolume = 0.0001, Compliance = 5.2504310309196e-08, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.ElasticVessel Capprox(volume_start = 3e-05, ZeroPressureVolume = 2e-05, Compliance = 7.5006157584566e-09, useExternalPressureInput = true);
        .Physiolibrary.Hydraulic.Components.Resistor Rap(Resistance = 2666447.7483);
        Parts.AtrialElastance RAElastance(Tmax(displayUnit = "ms") = 0.125, Tau(displayUnit = "ms") = 0.02, Beta(displayUnit = "mmHg") = 39.9967162245, Alpha = 40000, Ees = 26664477.483);
        Parts.VentricularElastance RVElastance(Tmax(displayUnit = "ms") = 0.2, Tau(displayUnit = "ms") = 0.03, Beta(displayUnit = "mmHg") = 45.3296117211, Alpha = 24000, Ees = 50662507.2177);
        Parts.AtrialElastance LAElastance(Tmax(displayUnit = "ms") = 0.125, Tau(displayUnit = "ms") = 0.02, Beta(displayUnit = "mmHg") = 39.9967162245, Alpha = 40000, Ees = 33330596.85375);
        Parts.VentricularElastance LVElastance(Tmax(displayUnit = "ms") = 0.2, Tau(displayUnit = "ms") = 0.03, AVDelay(displayUnit = "s"), Beta(displayUnit = "mmHg") = 45.3296117211, Alpha = 24000, Ees = 205316476.6191);
        Physiolibrary.Types.Constants.FrequencyConst heartRate(k = 1.3333333333333);
        Modelica.Blocks.Math.Gain RAVGain(k = 0.02);
        Modelica.Blocks.Math.Add3 add;
        Modelica.Blocks.Math.Gain LAVGain(k = 0.02);
        Modelica.Blocks.Math.Add3 add1;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1;
        Modelica.Blocks.Math.Add add2;
        Modelica.Blocks.Math.Add add3;
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k = 0);
      equation
        connect(AOV.q_in, LV.q_in);
        connect(LV.q_in, MV.q_out);
        connect(TV.q_out, RV.q_in);
        connect(RV.q_in, PV.q_in);
        connect(PV.q_out, Rcsp.q_in);
        connect(Rcsp.q_out, Capprox.q_in);
        connect(Capprox.q_in, Rcp.q_in);
        connect(Rcp.q_out, Cap.q_in);
        connect(Cap.q_in, Rap.q_in);
        connect(Rap.q_out, Cvp.q_in);
        connect(heartRate.y, RAElastance.HR);
        connect(RVElastance.HR, RAElastance.HR);
        connect(LAElastance.HR, heartRate.y);
        connect(LVElastance.HR, heartRate.y);
        connect(RA.StressedVolume, RAElastance.Vs);
        connect(LV.StressedVolume, LVElastance.Vs);
        connect(LA.StressedVolume, LAElastance.Vs);
        connect(RA.q_in, TV.q_in);
        connect(LA.q_in, MV.q_in);
        connect(Cvp.q_in, Rvp.q_in);
        connect(Rvp.q_out, LA.q_in);
        connect(AOV.q_out, Rcprox.q_in);
        connect(Rcprox.q_out, Caprox.q_in);
        connect(Rcs.q_in, Caprox.q_in);
        connect(Rcs.q_out, Cas.q_in);
        connect(Cas.q_in, Ras.q_in);
        connect(Ras.q_out, Cvs.q_in);
        connect(Cvs.q_in, Rvs.q_in);
        connect(Rvs.q_out, RA.q_in);
        connect(RAVGain.y, add.u1);
        connect(LVElastance.Ct, LV.compliance);
        connect(LAElastance.Ct, LA.compliance);
        connect(RVElastance.Ct, RV.compliance);
        connect(RAElastance.Ct, RA.compliance);
        connect(RV.StressedVolume, RVElastance.Vs);
        connect(LV.q_in, pressureMeasure.q_in);
        connect(pressureMeasure1.q_in, RV.q_in);
        connect(pressureMeasure1.pressure, RAVGain.u);
        connect(add1.u3, add1.u3);
        connect(RVElastance.Pt, add2.u2);
        connect(RV.externalPressure, add2.y);
        connect(add.y, RA.externalPressure);
        connect(RAElastance.Pt, add.u3);
        connect(LV.externalPressure, add3.y);
        connect(LA.externalPressure, add1.y);
        connect(pressureMeasure.pressure, LAVGain.u);
        connect(LAVGain.y, add1.u1);
        connect(IntraThoracicPressure.y, Caprox.externalPressure);
        connect(IntraThoracicPressure.y, add3.u2);
        connect(LVElastance.Pt, add3.u1);
        connect(add1.u2, LAElastance.Pt);
        connect(IntraThoracicPressure.y, add1.u3);
        connect(IntraThoracicPressure.y, Capprox.externalPressure);
        connect(Cap.externalPressure, Capprox.externalPressure);
        connect(Cvp.externalPressure, Capprox.externalPressure);
        connect(IntraThoracicPressure.y, add2.u1);
        connect(add.u2, Capprox.externalPressure);
      end HemodynamicsBurkhoff_shallow;

      model HemodynamicsBurkhoff  
        extends Cardiovascular.System(redeclare Parts.Pulmonary pulmonaryCirculation, redeclare replaceable Parts.Heart heart, redeclare Parts.Systemic systemicCirculation);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000, Tolerance = 0.001)); 
      end HemodynamicsBurkhoff;

      package Parts  
        extends Modelica.Icons.UtilitiesPackage;

        model Pulmonary  
          extends Cardiovascular.Interfaces.Pulmonary;
          .Physiolibrary.Hydraulic.Components.Resistor Rcsp(Resistance(displayUnit = "(mmHg.s)/ml") = 2666447.7483);
          .Physiolibrary.Hydraulic.Components.ElasticVessel Capprox(volume_start = 3e-05, ZeroPressureVolume = 2e-05, Compliance = 7.5006157584566e-09);
          .Physiolibrary.Hydraulic.Components.Resistor Rcp(Resistance(displayUnit = "(mmHg.s)/ml") = 2666447.7483);
          .Physiolibrary.Hydraulic.Components.ElasticVessel Cap(volume_start = 0.000802, ZeroPressureVolume = 0.0006, Compliance = 1.5001231516913e-07);
          .Physiolibrary.Hydraulic.Components.Resistor Rap(Resistance(displayUnit = "(mmHg.s)/ml") = 2666447.7483);
          .Physiolibrary.Hydraulic.Components.ElasticVessel Cvp(volume_start = 0.000154, ZeroPressureVolume = 0.0001, Compliance = 5.2504310309196e-08);
          .Physiolibrary.Hydraulic.Components.Resistor Rvp(Resistance(displayUnit = "(mmHg.s)/ml") = 1999835.811225);
        equation
          connect(q_in, Rcsp.q_in);
          connect(Rcsp.q_out, Capprox.q_in);
          connect(Capprox.q_in, Rcp.q_in);
          connect(Rcp.q_out, Cap.q_in);
          connect(Cap.q_in, Rap.q_in);
          connect(Rap.q_out, Cvp.q_in);
          connect(Cvp.q_in, Rvp.q_in);
          connect(Rvp.q_out, q_out);
        end Pulmonary;

        model Systemic  
          extends Cardiovascular.Interfaces.Systemic;
          .Physiolibrary.Hydraulic.Components.Resistor Rcprox(Resistance(displayUnit = "(mmHg.s)/ml") = 2666447.7483);
          .Physiolibrary.Hydraulic.Components.ElasticVessel Caprox(volume_start = 3.8e-05, ZeroPressureVolume = 3e-05, Compliance = 7.5006157584566e-10);
          .Physiolibrary.Hydraulic.Components.Resistor Rcs(Resistance(displayUnit = "(mmHg.s)/ml") = 3199737.29796);
          Physiolibrary.Hydraulic.Components.ElasticVessel Cas(volume_start = 0.000834, ZeroPressureVolume = 0.0007, Compliance = 1.2751046789376e-08);
          .Physiolibrary.Hydraulic.Components.Resistor Ras(Resistance(displayUnit = "(mmHg.s)/ml") = 99991790.56125);
          .Physiolibrary.Hydraulic.Components.ElasticVessel Cvs(volume_start = 0.002701, ZeroPressureVolume = 0.00223, useComplianceInput = false, Compliance = 5.2504310309196e-07);
          .Physiolibrary.Hydraulic.Components.Resistor Rvs(Resistance(displayUnit = "(mmHg.s)/ml") = 2666447.7483);
        equation
          connect(Rcprox.q_in, q_in);
          connect(Rcprox.q_out, Caprox.q_in);
          connect(Caprox.q_in, Rcs.q_in);
          connect(Rcs.q_out, Cas.q_in);
          connect(Cas.q_in, Ras.q_in);
          connect(Ras.q_out, Cvs.q_in);
          connect(Cvs.q_in, Rvs.q_in);
          connect(Rvs.q_out, q_out);
        end Systemic;

        model Heart  "heart with modified elastance" 
          extends Cardiovascular.Interfaces.Heart;
          Parts.ElasticVesselWithSVandP LA(useComplianceInput = true, useExternalPressureInput = true, volume_start = 8.1e-05, ZeroPressureVolume = 5e-06);
          Parts.AtrialElastance atrialElastance1(Tmax(displayUnit = "ms") = 0.125, Tau(displayUnit = "ms") = 0.02, Alpha = 40000, Beta(displayUnit = "mmHg") = 39.9967162245, Ees = 33330596.85375);
          Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06);
          Parts.VentricularElastance ventricularElastance1(Tmax(displayUnit = "ms") = 0.2, Tau(displayUnit = "ms") = 0.03, Alpha = 24000, Beta(displayUnit = "mmHg") = 45.3296117211, Ees = 205316476.6191);
          Parts.ElasticVesselWithSVandP LV(useComplianceInput = true, volume_start = 0.000125, ZeroPressureVolume = 5e-06, useExternalPressureInput = true);
          Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06);
          Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06);
          Parts.ElasticVesselWithSVandP RV(useComplianceInput = true, ExternalPressure = 0, useExternalPressureInput = true, volume_start = 0.000112, ZeroPressureVolume = 5e-06);
          Parts.VentricularElastance ventricularElastance(Tmax(displayUnit = "ms") = 0.2, Tau(displayUnit = "ms") = 0.03, Alpha = 24000, Beta(displayUnit = "mmHg") = 45.3296117211, Ees = 50662507.2177);
          Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06);
          Parts.AtrialElastance atrialElastance(Tmax(displayUnit = "ms") = 0.125, Tau(displayUnit = "ms") = 0.02, Alpha = 40000, Beta(displayUnit = "mmHg") = 39.9967162245, Ees = 26664477.483);
          Parts.ElasticVesselWithSVandP RA(useComplianceInput = true, useExternalPressureInput = true, volume_start = 7.3e-05, ZeroPressureVolume = 5e-06);
          replaceable Physiolibrary.Types.Constants.FrequencyConst heartRate(k = 1.3333333333333);
          Control.BloodFlowMeasurement bloodFlowMeasurement;
          Modelica.Blocks.Math.Add add;
          Modelica.Blocks.Math.Add add1;
          Modelica.Blocks.Math.Gain RAVGain(k = 0.02);
          Modelica.Blocks.Math.Gain LAVGain(k = 0.02);
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1;
        equation
          connect(rightHeartInflow, RA.q_in);
          connect(RA.q_in, TV.q_in);
          connect(TV.q_out, RV.q_in);
          connect(RV.q_in, PV.q_in);
          connect(PV.q_out, rightHeartOutflow);
          connect(leftHeartInflow, LA.q_in);
          connect(LA.q_in, MV.q_in);
          connect(MV.q_out, LV.q_in);
          connect(LV.q_in, AOV.q_in);
          connect(ventricularElastance1.Ct, LV.compliance);
          connect(ventricularElastance.Ct, RV.compliance);
          connect(heartRate.y, atrialElastance.HR);
          connect(RA.StressedVolume, atrialElastance.Vs);
          connect(RV.StressedVolume, ventricularElastance.Vs);
          connect(LV.StressedVolume, ventricularElastance1.Vs);
          connect(LA.StressedVolume, atrialElastance1.Vs);
          connect(heartRate.y, ventricularElastance1.HR);
          connect(ventricularElastance.HR, atrialElastance.HR);
          connect(bloodFlowMeasurement.q_in, AOV.q_out);
          connect(bloodFlowMeasurement.q_out, leftHeartOutflow);
          connect(bloodFlowMeasurement.HR, heartRate.y);
          connect(ventricularElastance1.Pt, LV.externalPressure);
          connect(LA.externalPressure, add.y);
          connect(atrialElastance1.HR, heartRate.y);
          connect(atrialElastance.Pt, add1.u2);
          connect(add1.y, RA.externalPressure);
          connect(add1.u1, RAVGain.y);
          connect(add.u1, LAVGain.y);
          connect(pressureMeasure1.q_in, LV.q_in);
          connect(pressureMeasure1.pressure, LAVGain.u);
          connect(pressureMeasure.q_in, RV.q_in);
          connect(pressureMeasure.pressure, RAVGain.u);
          connect(RA.compliance, atrialElastance.Ct);
          connect(atrialElastance1.Pt, add.u2);
          connect(LA.compliance, atrialElastance1.Ct);
          connect(RV.externalPressure, ventricularElastance.Pt);
        end Heart;

        model ElasticVesselWithSVandP  "elastic vessel computes aditionally stressed volume and pressure" 
          extends Physiolibrary.Hydraulic.Components.ElasticVessel;
          Physiolibrary.Types.RealIO.VolumeOutput StressedVolume;
        equation
          StressedVolume = volume - zpv;
        end ElasticVesselWithSVandP;

        partial model HeartElastance  "Elastance of heart atria and ventricules by Burkhoff" 
          .Physiolibrary.Types.RealIO.VolumeInput Vs "Stressed volume";
          parameter Real Alpha(final unit = "1/m3") "coefficient of end diastolic pressure-volume curve";
          parameter .Physiolibrary.Types.Pressure Beta "coefficient of end diastolic pressure-volume curve";
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation(Evaluate = true, HideResult = true);
          parameter .Physiolibrary.Types.HydraulicElastance Ees "coefficient of end-systolic elastance";
          .Physiolibrary.Types.HydraulicElastance Et "Elastance";
          .Physiolibrary.Types.Time Tsyst;
          parameter .Physiolibrary.Types.Time Tmax "duration of systole ";
          parameter .Physiolibrary.Types.Time Tau "time constant of myocardial relaxation ";
          Real Et0 "Relative elastance value (Elastance/End-Systolic Elastance)";
          .Physiolibrary.Types.RealIO.PressureOutput Pt "peak isovolumic pressure";
          .Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start = 1 / Ees) = 1 / mes if useEs_extInput;
        protected
          .Physiolibrary.Types.HydraulicElastance mes;
        equation
          if not useEs_extInput then
            mes = Ees;
          end if;
          if Tsyst <= 3 / 2 * Tmax then
            Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * Tsyst - Modelica.Constants.pi / 2) + 1);
          else
            Et0 = 0.5 * exp(-(Tsyst - 3 * Tmax / 2) / Tau);
          end if;
          Et = Modelica.Constants.eps + Et0 * mes;
          Pt = (1 - Et0) * Beta * (exp(Alpha * Vs) - 1);
          Ct = 1 / Et;
        end HeartElastance;

        model VentricularElastance  
          extends HeartIntervals;
          extends HeartElastance;
        equation
          Tsyst = Tvsyst;
        end VentricularElastance;

        model HeartIntervals  
          discrete Physiolibrary.Types.Time HP(start = 0) "heart period - duration of cardiac cycle";
          Boolean b(start = false);
          Physiolibrary.Types.RealIO.FrequencyInput HR;
          Physiolibrary.Types.Time Tasyst "time elapsed from the beginning of atrial systole";
          Physiolibrary.Types.Time Tvsyst "time elapsed from the beginning of ventricular systole";
          parameter Physiolibrary.Types.Time AVDelay(displayUnit = "s") = 0.160 "AV interval";
          Physiolibrary.Types.Time T0 "start time of cardiac cycle";
          Physiolibrary.Types.Time EDTV "Ventricular end Diastolic Time";
        equation
          b = time - pre(T0) >= pre(HP);
          when {initial(), b} then
            T0 = time;
            HP = 1 / HR;
            EDTV = T0 + AVDelay;
          end when;
          Tasyst = time - T0;
          if time - T0 < AVDelay then
            Tvsyst = 0;
          else
            Tvsyst = time - (T0 + AVDelay);
          end if;
        end HeartIntervals;

        model AtrialElastance  
          extends HeartIntervals;
          extends HeartElastance;
        equation
          Tsyst = Tasyst;
        end AtrialElastance;
      end Parts;

      model HemodynamicsBurkhoffBVControl  
        extends Controlled.System(redeclare replaceable ControlledParts.PulmonaryControl pulmonaryCirculation, redeclare replaceable ControlledParts.HeartControl heart(MV(useLimitationInputs = false), AOV(useLimitationInputs = false)), redeclare replaceable ControlledParts.SystemicControl systemicCirculation(Ras(useConductanceInput = false)), redeclare Model.Control.Baroreflex shortTermControl(baroreceptor(PAOmedia = 11585.715466364, EV0right = 50662507.2177, EV0left = 205316476.6191, EV0venacava = 5.2504310309196e-07, activationDelay = 10)), redeclare replaceable Model.Control.BloodVolumeControl longTermControl);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000, Tolerance = 0.001)); 
      end HemodynamicsBurkhoffBVControl;

      package ControlledParts  
        extends Modelica.Icons.UtilitiesPackage;

        model PulmonaryControl  
          extends Controlled.Pulmonary;
          extends Parts.Pulmonary;
          Modelica.Blocks.Math.Add3 add3_1;
        equation
          connect(Capprox.volume, add3_1.u3);
          connect(Cap.volume, add3_1.u2);
          connect(Cvp.volume, add3_1.u1);
          connect(add3_1.y, busConnector.pulmonaryBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end PulmonaryControl;

        model SystemicControl  
          extends Controlled.Systemic;
          extends Parts.Systemic(Cvs(useComplianceInput = true), Caprox(useComplianceInput = false));
          Modelica.Blocks.Math.Add3 add3_1;
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement;
        equation
          connect(add3_1.u3, Cvs.volume);
          connect(add3_1.u2, Cas.volume);
          connect(add3_1.u1, Caprox.volume);
          connect(add3_1.y, busConnector.systemicBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(Rcs.q_in, aortaPressureMeasurement.q_in);
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(Cvs.compliance, busConnector.venacavacompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end SystemicControl;

        model HeartControl  
          extends Controlled.Heart;
          extends Parts.Heart(redeclare Types.Constants.FrequencyControl heartRate, ventricularElastance(useEs_extInput = true), atrialElastance1(useEs_extInput = false), ventricularElastance1(useEs_extInput = true), AOV(_Goff(displayUnit = "ml/(mmHg.s)"), useLimitationInputs = false), MV(useLimitationInputs = false));
          Modelica.Blocks.Math.Sum sum1(nin = 4);
        equation
          connect(heartRate.c, busConnector.heartrate) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularElastance.Es_ext, busConnector.rvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularElastance1.Es_ext, busConnector.lvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(RV.volume, sum1.u[1]);
          connect(RA.volume, sum1.u[2]);
          connect(LV.volume, sum1.u[3]);
          connect(LA.volume, sum1.u[4]);
          connect(sum1.y, busConnector.heartBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end HeartControl;

        model AorticValveStenosisScenario  
          extends Model.Scenario.StenosisControl(venacavastenosis(InitialElastance = 1906510.1400345, FinalElastance = 1906510.1400345), aorticstenosis(InitialResistance(displayUnit = "(mmHg.s)/ml") = 266644.77483, FinalResistance(displayUnit = "(mmHg.s)/ml") = 10665790.9932, duration = 60), mitralvalvestenosis(InitialResistance = 333305.9685375, FinalResistance = 333305.9685375));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl  
          extends HeartControl(AOV(useLimitationInputs = true));
        equation
          connect(AOV.Goff, busConnector.avbackflowconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(AOV.Gon, busConnector.avoutflowresistance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve  
        extends HemodynamicsBurkhoffBVControl(redeclare ControlledParts.AorticValveStenosisScenario scenarioControl(aorticstenosis(duration = 60)), redeclare ControlledParts.AorticValveHeartControl heart);
        annotation(experiment(StopTime = 120, __Dymola_NumberOfIntervals = 5000)); 
      end StenosisAorticValve;

      model Bleeding  
        extends HemodynamicsBurkhoffBVControl(redeclare Scenario.BleedingTransfusionScenario scenarioControl(BloodTrans = 0, Tbs = 600, Tbd = 300, BloodLoss = 0.0005, Tts = 1200, Ttd = 600), longTermControl(redeclare Control.BloodVolume.PlasmaBleeding plasma, redeclare Control.BloodVolume.RBCBleeding redBloodCells));
        annotation(experiment(StopTime = 3600, __Dymola_NumberOfIntervals = 5000)); 
      end Bleeding;
    end Burkhoff;

    package Smith2004  
      extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsSmith_shallow  
        .Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(ZeroPressureVolume = 0, volume_start = 0.0001241, Elastance = 92165766.41999);
        .Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(ZeroPressureVolume = 0, volume_start = 0.0002952, Elastance(displayUnit = "Pa/m3") = 786602.0857485);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance aorticValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 2399802.97347);
        .Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(displayUnit = "(mmHg.s)/ml") = 145054757.50752);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance tricuspidValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 3159740.5817355);
        .Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit = "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit = "m3/s") = -1.4e-8);
        .Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit = "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit = "m3/s") = -1.9e-9);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance pulmonaryValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 733273.1307825);
        .Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryArteries(ZeroPressureVolume = 0, useExternalPressureInput = true, volume_start = 3.904e-05, Elastance(displayUnit = "Pa/m3") = 49195960.956135);
        .Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(displayUnit = "(mmHg.s)/ml") = 20691634.526808);
        .Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryVeins(ZeroPressureVolume = 0, useExternalPressureInput = true, volume_start = 0.0008269, Elastance(displayUnit = "Pa/m3") = 973253.4281295);
        .Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 2106493.721157);
        .Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit = "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit = "m3/s") = 0.0001372);
        .Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit = "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit = "m3/s") = 0.0001141);
        Physiolibrary.Types.Constants.FrequencyConst HR(k = 1.2);
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k = -533.28954966);
        Parts.VentricularInteraction_flat ventricularInteraction_flat(lambdalv = 33000, lambdaperi = 30000, lambdas(displayUnit = "1/m3") = 435000, lambdarv(displayUnit = "1/m3") = 23000, Essept(displayUnit = "mmHg/ml") = 6499999676.0309, V0peri = 0.0002, Pi0sept = 148.00118226939, Pi0rv = 28.757638965416, Pi0lv = 16.038683206025, Pi0peri = 66.701190423724, Esrv = 77993596.637775, Eslv = 383941811.27772);
      equation
        connect(aorta.q_in, Rsys.q_in);
        connect(Rsys.q_out, venaCava.q_in);
        connect(pulmonaryValve.q_out, pulmonaryArteries.q_in);
        connect(pulmonaryArteries.q_in, Rpul.q_in);
        connect(Rpul.q_out, pulmonaryVeins.q_in);
        connect(aorticValve.q_out, aorta.q_in);
        connect(venaCava.q_in, Ltc.q_in);
        connect(pulmonaryVeins.q_in, Lmt.q_in);
        connect(Lav.q_out, aorticValve.q_in);
        connect(Ltc.q_out, tricuspidValve.q_in);
        connect(Lpv.q_out, pulmonaryValve.q_in);
        connect(mitralValve.q_in, Lmt.q_out);
        connect(tricuspidValve.q_out, ventricularInteraction_flat.rvflow);
        connect(Lpv.q_in, ventricularInteraction_flat.rvflow);
        connect(ventricularInteraction_flat.lvflow, Lav.q_in);
        connect(mitralValve.q_out, Lav.q_in);
        connect(HR.y, ventricularInteraction_flat.HR);
        connect(IntraThoracicPressure.y, ventricularInteraction_flat.Pth);
        connect(pulmonaryArteries.externalPressure, IntraThoracicPressure.y);
        connect(pulmonaryVeins.externalPressure, IntraThoracicPressure.y);
      end HemodynamicsSmith_shallow;

      model HemodynamicsSmith  
        extends Cardiovascular.System(redeclare Parts.Pulmonary pulmonaryCirculation, redeclare Parts.Heart heart, redeclare Parts.Systemic systemicCirculation);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000)); 
      end HemodynamicsSmith;

      package Parts  
        extends Modelica.Icons.UtilitiesPackage;

        model VentricularInteraction_flat  
          .Physiolibrary.Types.Volume Vsept(start = 0.000002);
          .Physiolibrary.Types.Volume Vrv(start = 0.0001042);
          .Physiolibrary.Types.Volume Vlv(start = 0.0001042);
          .Physiolibrary.Types.Volume Vperi;
          parameter .Physiolibrary.Types.Volume V0sept = 0.000002;
          parameter .Physiolibrary.Types.Volume V0peri;
          .Physiolibrary.Types.Pressure Psept;
          .Physiolibrary.Types.Pressure Pperi;
          parameter .Physiolibrary.Types.Pressure Pi0sept;
          parameter .Physiolibrary.Types.Pressure Pi0rv;
          parameter .Physiolibrary.Types.Pressure Pi0lv;
          parameter .Physiolibrary.Types.Pressure Pi0peri "peak isovolumic pressure";
          parameter .Physiolibrary.Types.HydraulicElastance Essept;
          parameter .Physiolibrary.Types.HydraulicElastance Esrv;
          parameter .Physiolibrary.Types.HydraulicElastance Eslv "elastance of systole";
          parameter Real A = 1;
          parameter Real B = 80;
          parameter Real CC = 0.375;
          .Physiolibrary.Types.Time tm;
          discrete .Physiolibrary.Types.Time HP "heart period";
          discrete .Physiolibrary.Types.Time t0 "time of beginning of the cardiac cycle";
          discrete .Physiolibrary.Types.Time ts "duration of systole";
          parameter HydraulicLambda lambdas;
          parameter HydraulicLambda lambdarv;
          parameter HydraulicLambda lambdalv;
          parameter HydraulicLambda lambdaperi;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow;
          .Physiolibrary.Types.RealIO.FrequencyInput HR;
          .Physiolibrary.Types.RealIO.PressureInput Pth;
        equation
          tm = time - pre(t0);
          when {initial(), tm >= pre(HP)} then
            HP = 1 / HR;
            t0 = time;
            ts = 0.16 + 0.3 * HP;
          end when;
          Psept = lvflow.pressure - rvflow.pressure;
          Psept = (Vsept - V0sept) * A * exp(-B * (tm - CC) ^ 2) * Essept + (1 - A * exp(-B * (tm - CC) ^ 2)) * Pi0sept * (exp(lambdas * Vsept) - 1);
          rvflow.pressure - Pperi = (Vrv + Vsept) * A * exp(-B * (tm - CC) ^ 2) * Esrv + (1 - A * exp(-B * (tm - CC) ^ 2)) * Pi0rv * (exp(lambdarv * (Vrv + Vsept)) - 1);
          der(Vrv) = rvflow.q;
          lvflow.pressure - Pperi = (Vlv - Vsept) * A * exp(-B * (tm - CC) ^ 2) * Eslv + (1 - A * exp(-B * (tm - CC) ^ 2)) * Pi0lv * (exp(lambdalv * (Vlv - Vsept)) - 1);
          der(Vlv) = lvflow.q;
          Vperi = Vrv + Vlv;
          Pperi = Pth + Pi0peri * (exp(lambdaperi * (Vperi - V0peri)) - 1);
        end VentricularInteraction_flat;

        model Septum  
          Physiolibrary.Hydraulic.Sensors.PressureMeasure rvpressure;
          Modelica.Blocks.Math.Add add1;
          TimeVaryingElastance septumdrv(lambda = 435000, Es = 6499999676.0309, Pi0 = 148.00118226939);
          Physiolibrary.Hydraulic.Sensors.PressureMeasure lvpressure;
          ElasticWall elasticWall(volume(start = 2e-06), V0 = 2e-06);
          Physiolibrary.Types.RealIO.VolumeOutput volume(start = 2e-06);
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow;
          Physiolibrary.Types.RealIO.FrequencyInput HR;
        equation
          connect(elasticWall.compliance, septumdrv.C);
          connect(septumdrv.Pi, add1.u2);
          connect(add1.y, elasticWall.prv);
          connect(elasticWall.volume, septumdrv.V);
          connect(volume, elasticWall.volume);
          connect(HR, septumdrv.HR);
          connect(lvpressure.pressure, elasticWall.plv);
          connect(rvpressure.q_in, rvflow);
          connect(rvpressure.pressure, add1.u1);
          connect(lvflow, lvpressure.q_in);
        end Septum;

        model Ventricle  
          TimeVaryingElastance drive(lambda = 23000, Es = 77993596.637775, Pi0 = 28.757638965416);
          ElasticVesselWithSVandP ventricle(useComplianceInput = true, useExternalPressureInput = true, useV0Input = true, volume_start = 0.0001042, Elastance = 133322387.415);
          Modelica.Blocks.Math.Add add;
          Modelica.Blocks.Interfaces.RealInput Pext;
          Modelica.Blocks.Interfaces.RealInput V0;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in;
          Physiolibrary.Types.RealIO.VolumeOutput stressedVolume;
          Physiolibrary.Types.RealIO.FrequencyInput HR;
          Physiolibrary.Types.RealIO.VolumeOutput volume;
        equation
          connect(drive.C, ventricle.compliance);
          connect(ventricle.externalPressure, add.y);
          connect(drive.Pi, add.u2);
          connect(HR, drive.HR);
          connect(add.u1, Pext);
          connect(V0, ventricle.zeroPressureVolume);
          connect(drive.V, stressedVolume);
          connect(ventricle.q_in, q_in);
          connect(ventricle.volume, volume);
          connect(ventricle.StressedVolume, stressedVolume);
        end Ventricle;

        model VentricularInteraction  
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow;
          Physiolibrary.Types.RealIO.FrequencyInput frequency;
          Pericardium pericardium(lambda(displayUnit = "1/m3") = 30000, V0 = 0.0002, P0 = 66.701190423724);
          Physiolibrary.Types.RealIO.PressureInput Pth;
          Ventricle rightVentricle(drive(lambda = 23000, Es = 77993596.637775, Pi0 = 28.757638965416));
          Ventricle leftVentricle(drive(lambda = 33000, Es = 383941811.27772, Pi0 = 16.038683206025));
          Septum septum;
          Modelica.Blocks.Math.Gain gain(k = -1);
        equation
          connect(frequency, leftVentricle.HR);
          connect(rightVentricle.HR, frequency);
          connect(septum.HR, frequency);
          connect(rightVentricle.stressedVolume, pericardium.Vrvfw);
          connect(lvflow, leftVentricle.q_in);
          connect(pericardium.pressure, leftVentricle.Pext);
          connect(Pth, pericardium.Pth);
          connect(pericardium.pressure, rightVentricle.Pext);
          connect(leftVentricle.stressedVolume, pericardium.Vlvfw);
          connect(septum.volume, leftVentricle.V0);
          connect(septum.volume, gain.u);
          connect(pericardium.Vsept, gain.u);
          connect(gain.y, rightVentricle.V0);
          connect(rightVentricle.q_in, rvflow);
          connect(septum.rvflow, rvflow);
          connect(septum.lvflow, leftVentricle.q_in);
        end VentricularInteraction;

        model TimeVaryingElastance  
          parameter Boolean useEs_extInput = false "=true, if external elastance/compliance value is used" annotation(Evaluate = true, HideResult = true);
          parameter Physiolibrary.Types.HydraulicElastance Es "elastance of systole";
          parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
          parameter HydraulicLambda lambda;
          Physiolibrary.Types.Time tm "relative time from the beginning of cardiac cycle";
          discrete Physiolibrary.Types.Time HP "heart period";
          discrete Physiolibrary.Types.Time t0 "time of beginning of the cardiac cycle";
          discrete Physiolibrary.Types.Time ts "duration of systole";
          Real et;
          parameter Real A = 1;
          parameter Real B = 80;
          parameter Real CC = 0.375;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput C;
          Physiolibrary.Types.HydraulicElastance E;
          Physiolibrary.Types.RealIO.PressureOutput Pi;
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate";
          Physiolibrary.Types.RealIO.VolumeInput V;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start = 1 / Es) = 1 / es_int if useEs_extInput;
        protected
          Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int = Es;
          end if;
          tm = time - pre(t0);
          when {initial(), tm >= pre(HP)} then
            HP = 1 / HR;
            t0 = time;
            ts = 0.16 + 0.3 * HP;
          end when;
          et = A * exp(-B * (tm - CC) ^ 2);
          E = et * es_int;
          C = 1 / E;
          Pi = (1 - et) * Pi0 * (exp(lambda * V) - 1);
        end TimeVaryingElastance;

        type HydraulicLambda = Real(final quantity = "HydraulicLambda", final unit = "1/m3", displayUnit = "1/ml", nominal = 1e-5, min = 0);

        model Pericardium  
          parameter Physiolibrary.Types.Volume V0;
          parameter Physiolibrary.Types.Pressure P0;
          parameter HydraulicLambda lambda;
          Physiolibrary.Types.RealIO.VolumeInput Vsept;
          Physiolibrary.Types.RealIO.PressureOutput pressure;
          Physiolibrary.Types.RealIO.VolumeInput Vrvfw;
          Physiolibrary.Types.RealIO.VolumeInput Vlvfw;
          Physiolibrary.Types.Volume Vperi;
          Physiolibrary.Types.Pressure Pperi;
          Physiolibrary.Types.RealIO.VolumeOutput Vrv;
          Physiolibrary.Types.RealIO.VolumeOutput Vlv;
          Physiolibrary.Types.RealIO.PressureInput Pth;
        equation
          Vperi = Vrvfw + Vlvfw;
          Vrv = Vrvfw + Vsept;
          Vlv = Vlvfw - Vsept;
          Pperi = P0 * (exp(lambda * (Vperi - V0)) - 1);
          pressure = Pth + Pperi;
        end Pericardium;

        model Heart  
          extends Cardiovascular.Interfaces.Heart;
          Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit = "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit = "m3/s") = 0.0001372);
          Physiolibrary.Hydraulic.Components.IdealValveResistance tricuspidValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 3159740.5817355);
          Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit = "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit = "m3/s") = -1.9e-9);
          Physiolibrary.Hydraulic.Components.IdealValveResistance pulmonaryValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 733273.1307825);
          Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit = "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit = "m3/s") = 0.0001141);
          Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 2106493.721157);
          Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit = "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit = "m3/s") = -1.4e-8);
          Physiolibrary.Hydraulic.Components.IdealValveResistance aorticValve(Pknee = 0, _Ron(displayUnit = "(mmHg.s)/ml") = 2399802.97347);
          replaceable Physiolibrary.Types.Constants.FrequencyConst HR(k = 1.2);
          replaceable VentricularInteraction ventricularInteraction constrainedby VentricularInteraction;
          Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966);
        equation
          connect(rightHeartInflow, Ltc.q_in);
          connect(Ltc.q_out, tricuspidValve.q_in);
          connect(tricuspidValve.q_out, ventricularInteraction.rvflow);
          connect(ventricularInteraction.rvflow, Lpv.q_in);
          connect(Lpv.q_out, pulmonaryValve.q_in);
          connect(pulmonaryValve.q_out, rightHeartOutflow);
          connect(Pth.y, ventricularInteraction.Pth);
          connect(ventricularInteraction.frequency, HR.y);
          connect(Lmt.q_in, leftHeartInflow);
          connect(Lmt.q_out, mitralValve.q_in);
          connect(mitralValve.q_out, ventricularInteraction.lvflow);
          connect(Lav.q_in, ventricularInteraction.lvflow);
          connect(aorticValve.q_in, Lav.q_out);
          connect(aorticValve.q_out, leftHeartOutflow);
        end Heart;

        model Pulmonary  
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryArteries(ZeroPressureVolume = 0, useExternalPressureInput = true, volume_start = 3.904e-05, Elastance = 49195960.956135);
          Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(displayUnit = "(mmHg.s)/ml") = 20691634.526808);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryVeins(ZeroPressureVolume = 0, useExternalPressureInput = true, volume_start = 0.0008269, Elastance = 973253.4281295);
          Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966);
        equation
          connect(q_in, pulmonaryArteries.q_in);
          connect(pulmonaryArteries.q_in, Rpul.q_in);
          connect(Rpul.q_out, pulmonaryVeins.q_in);
          connect(pulmonaryVeins.q_in, q_out);
          connect(Pth.y, pulmonaryArteries.externalPressure);
          connect(pulmonaryArteries.externalPressure, pulmonaryVeins.externalPressure);
        end Pulmonary;

        model Systemic  
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(ZeroPressureVolume = 0, volume_start = 0.0001241, Elastance = 92165766.41999);
          Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(displayUnit = "(mmHg.s)/ml") = 145054757.50752);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(ZeroPressureVolume = 0, volume_start = 0.0002952, Elastance = 786602.0857485);
        equation
          connect(aorta.q_in, q_in);
          connect(aorta.q_in, Rsys.q_in);
          connect(Rsys.q_out, venaCava.q_in);
          connect(venaCava.q_in, q_out);
        end Systemic;

        model ElasticWall  
          Physiolibrary.Types.RealIO.PressureInput prv;
          Physiolibrary.Types.RealIO.PressureInput plv;
          Physiolibrary.Types.RealIO.PressureOutput pressure;
          Physiolibrary.Types.RealIO.VolumeOutput volume;
          parameter Physiolibrary.Types.Volume V0 = 0;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance;
        equation
          pressure = plv - prv;
          pressure = (volume - V0) / compliance;
        end ElasticWall;

        model ElasticVesselWithSVandP  "elastic vessel computes aditionally stressed volume and pressure" 
          extends Physiolibrary.Hydraulic.Components.ElasticVesselElastance;
          Physiolibrary.Types.RealIO.VolumeOutput StressedVolume;
        equation
          StressedVolume = volume - zpv;
        end ElasticVesselWithSVandP;
      end Parts;

      model HemodynamicsSmithControl  
        extends Controlled.System(redeclare ControlledParts.PulmonaryControl pulmonaryCirculation, redeclare replaceable ControlledParts.HeartControl heart, redeclare ControlledParts.SystemicControl systemicCirculation(venaCava(volume_start = 0.0022952, ZeroPressureVolume = 0.002), aorta(volume_start = 0.0008841, ZeroPressureVolume = 0.00076)), redeclare replaceable Model.Control.BloodVolumeControl longTermControl, redeclare ControlledParts.Baroreflex shortTermControl);
        annotation(experiment(StopTime = 5, __Dymola_NumberOfIntervals = 5000, Tolerance = 0.001)); 
      end HemodynamicsSmithControl;

      package ControlledParts  
        extends Modelica.Icons.UtilitiesPackage;

        model PulmonaryControl  
          extends Parts.Pulmonary(pulmonaryArteries(volume_start = 5.904e-05, ZeroPressureVolume = 2e-05), pulmonaryVeins(volume_start = 0.0015269, ZeroPressureVolume = 0.0007));
          extends Controlled.Pulmonary;
          Modelica.Blocks.Math.Add add;
        equation
          connect(pulmonaryArteries.volume, add.u2);
          connect(pulmonaryVeins.volume, add.u1);
          connect(add.y, busConnector.pulmonaryBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{-25, 58}, {-25, 58}}));
        end PulmonaryControl;

        model SystemicControl  
          extends Parts.Systemic(venaCava(useComplianceInput = true), Rsys(useConductanceInput = true));
          extends Controlled.Systemic;
          Model.Control.AortaPressureMeasurement aortaPressureMeasurement;
          Modelica.Blocks.Math.Add add;
        equation
          connect(venaCava.compliance, busConnector.venacavacompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(Rsys.cond, busConnector.peripheralconductance) annotation(Text(string = "%second", index = 1, extent = {{5, 1}, {5, 1}}));
          connect(Rsys.q_in, aortaPressureMeasurement.q_in);
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(aorta.volume, add.u1);
          connect(add.u2, venaCava.volume);
          connect(add.y, busConnector.systemicBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{-25, 60}, {-25, 60}}));
        end SystemicControl;

        model HeartControl  
          extends Controlled.Heart;
          extends Parts.Heart(redeclare Types.Constants.FrequencyControl HR, redeclare VIVolume ventricularInteraction(rightVentricle(drive(useEs_extInput = true))), aorticValve(useLimitationInputs = false));
        equation
          connect(HR.c, busConnector.heartrate) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularInteraction.busConnector, busConnector) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(ventricularInteraction.volume, busConnector.heartBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end HeartControl;

        model VIVolume  
          extends Parts.VentricularInteraction(rightVentricle(drive(useEs_extInput = true)), leftVentricle(drive(useEs_extInput = true)));
          Physiolibrary.Types.RealIO.VolumeOutput volume;
          Modelica.Blocks.Math.Add add;
          Physiolibrary.Types.BusConnector busConnector;
        equation
          connect(busConnector.rvcompliance, rightVentricle.drive.Es_ext);
          connect(busConnector.lvcompliance, leftVentricle.drive.Es_ext);
          connect(rightVentricle.volume, add.u2);
          connect(leftVentricle.volume, add.u1);
          connect(add.y, volume);
        end VIVolume;

        model Baroreflex  
          extends Model.Control.Baroreflex(baroreceptor(PAOmedia = 12486.574838127, HR0Param = 1.2, EV0right = 77993596.637775, EV0left = 383835153.36779, EV0venacava = 1.2713543710584e-06, RS0 = 145054757.50752));
        end Baroreflex;

        model AorticValveStenosisScenario  
          extends Model.Scenario.StenosisControl(venacavastenosis(InitialElastance = 786602.0857485, FinalElastance = 786602.0857485), aorticstenosis(duration = 60, InitialResistance(displayUnit = "(mmHg.s)/ml") = 2399802.97347, FinalResistance(displayUnit = "(mmHg.s)/ml") = 10665790.9932), mitralvalvestenosis(InitialResistance = 2106493.721157, FinalResistance = 2106493.721157), AVgon(k(displayUnit = "ml/(mmHg.s)") = 1.2000985213531e-12), mvgoff(k(displayUnit = "ml/(mmHg.s)") = 1.2000985213531e-12));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl  
          extends HeartControl(aorticValve(useLimitationInputs = true));
        equation
          connect(aorticValve.Goff, busConnector.avbackflowconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(aorticValve.Gon, busConnector.avoutflowresistance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve  
        extends HemodynamicsSmithControl(redeclare ControlledParts.AorticValveHeartControl heart, redeclare ControlledParts.AorticValveStenosisScenario scenarioControl(AVgon(k(displayUnit = "ml/(mmHg.s)"))));
        annotation(experiment(StopTime = 120, __Dymola_NumberOfIntervals = 5000)); 
      end StenosisAorticValve;

      model Bleeding  
        extends HemodynamicsSmithControl(redeclare Scenario.BleedingTransfusionScenario scenarioControl(Tbd = 300, BloodLoss = 0.0005, Tts = 600, Ttd = 600, BloodTrans = 0), longTermControl(redeclare Control.BloodVolume.RBCBleeding redBloodCells, redeclare Control.BloodVolume.PlasmaBleeding plasma));
        annotation(experiment(StopTime = 3600, __Dymola_NumberOfIntervals = 5000)); 
      end Bleeding;
    end Smith2004;

    package Control  "models of control mechanism and additional components" 
      extends Modelica.Icons.VariantsPackage;
      package EPO_Physiolibrary = Physiolibrary(Types(redeclare type Concentration = Real(quantity = "EPO Concentration", unit = "1/m3", displayUnit = "iu/l"), redeclare type AmountOfSubstance = Real(quantity = "EPO AmountOfSubstance", unit = "1", displayUnit = "iu"), redeclare type MolarFlowRate = Real(quantity = "EPO Flow Rate", unit = "1/s", displayUnit = "iu/min"), redeclare type MolarEnergy = Real(quantity = "EPO Internal Energy", unit = "J", displayUnit = "cal/iu")));

      model Baroreflex  
        extends Cardiovascular.Controlled.ShortTermControl;
        Baroreceptor baroreceptor(activationDelay(displayUnit = "s"));
      equation
        connect(baroreceptor.RS, busConnector.peripheralconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(baroreceptor.evright, busConnector.rvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(baroreceptor.evleft, busConnector.lvcompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(baroreceptor.HR, busConnector.heartrate) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(baroreceptor.PAo, busConnector.aortameanpressure) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(baroreceptor.evenacava, busConnector.venacavacompliance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
      end Baroreflex;

      model Baroreceptor  
        Modelica.Blocks.Continuous.TransferFunction H1(a = {15, 1}, b = {1});
        Modelica.Blocks.Continuous.TransferFunction H2(a = {15, 1}, b = {0.048});
        Modelica.Blocks.Continuous.TransferFunction H3(a = {15, 1}, b = {0.154});
        Modelica.Blocks.Continuous.TransferFunction H4(a = {2, 1}, b = {0.1});
        Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax = 0.1, uMin = -0.1);
        parameter Physiolibrary.Types.Pressure PAOmedia = 13465.561128915;
        parameter Physiolibrary.Types.Frequency HR0Param = 1.3333333333333;
        parameter Boolean useHRInput = false "=true, if external HR value is used" annotation(Evaluate = true, HideResult = true);
        Physiolibrary.Types.RealIO.FrequencyInput cond(start = HR0Param) = HR0 if useHRInput;
        Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta";
        Physiolibrary.Types.RealIO.FrequencyOutput HR "heart rate - compatible with Const block";
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright;
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft;
        Physiolibrary.Types.HydraulicElastance evrightref;
        Physiolibrary.Types.HydraulicElastance evleftref;
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava;
        Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS;
        parameter Physiolibrary.Types.HydraulicElastance EV0right = 103991462.1837;
        parameter Physiolibrary.Types.HydraulicElastance EV0left = 106657909.932;
        parameter Physiolibrary.Types.HydraulicCompliance EV0venacava = 1.8751539396141e-006;
        parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit = "(mmHg.s)/ml") = 81793284.67910001;
        parameter Physiolibrary.Types.Time activationDelay = 15;
      protected
        Physiolibrary.Types.Frequency HR0;
      equation
        if not useHRInput then
          HR0 = HR0Param;
        end if;
        if time > activationDelay then
          deadZone.u = (PAOmedia - PAo) / 133.322387415 / 2;
        else
          deadZone.u = 0;
        end if;
        H1.u = deadZone.y;
        HR = (HR0 * 60 + H1.y) / 60;
        H2.u = deadZone.y;
        evright = 1 / (EV0right + H2.y * 1000000.0 * 133.322387415);
        evrightref = 1 / evright;
        evleft = 1 / (EV0left + H2.y * 1000000.0 * 133.322387415);
        evleftref = 1 / evleft;
        H3.u = deadZone.y;
        evenacava = EV0venacava + H3.y * 1e-006 / 133.322387415;
        H4.u = deadZone.y;
        RS = 1 / (RS0 + H4.y * 1000000.0 * 133.322387415);
      end Baroreceptor;

      package BloodVolume  
        extends Modelica.Icons.UtilitiesPackage;

        model KidneyPO2Estimate  
          Physiolibrary.Types.RealIO.PressureOutput pressure;
          parameter Real MaxPo2 = 60;
          Physiolibrary.Types.RealIO.FractionInput hematocrit;
          Physiolibrary.Blocks.Factors.Spline spline(Yscale = 101325 / 760, data = [0, 0, 0; 0.4, 35, 1; 0.6, 60, 0]);
          Physiolibrary.Types.Constants.OneConst one;
        equation
          connect(hematocrit, spline.u);
          connect(spline.y, pressure);
          connect(one.y, spline.yBase);
        end KidneyPO2Estimate;

        model Erythropoetin  
          EPO_Physiolibrary.Chemical.Components.Substance erythropoetin(useNormalizedVolume = false, solute_start(displayUnit = "mol") = 79.5);
          EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePump secretion(useSoluteFlowInput = true);
          EPO_Physiolibrary.Chemical.Sensors.ConcentrationMeasure concentrationMeasure;
          EPO_Physiolibrary.Types.RealIO.ConcentrationOutput concentration;
          Physiolibrary.Types.RealIO.PressureInput kidney_po2;
          Physiolibrary.Blocks.Factors.Spline PO2Effect(data = {{0.0, 4.0, 0}, {35.0, 0.0, -0.14}, {60.0, -1.0, 0}}, Xscale = 101325 / 760);
          Physiolibrary.Blocks.Math.Power pow;
          Physiolibrary.Blocks.Factors.Normalization CounEffect;
          Physiolibrary.Blocks.Factors.Normalization FunctionEffect;
          Physiolibrary.Blocks.Factors.Normalization PO2Effect1;
          Physiolibrary.Types.Constants.FractionConst Kidney_Nefron_Count_TotalxNormal(k = 1);
          Physiolibrary.Types.Constants.FractionConst KidneyFunctionEffect(k = 1);
          Physiolibrary.Types.RealIO.VolumeInput ecf_volume;
          Modelica.Blocks.Math.Gain VODIST(k = 0.4);
          Physiolibrary.Types.Constants.FractionConst hormoneFlowFraction(k = 1);
          Cardiovascular.Model.Control.EPO_Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate(k(displayUnit = "mol/min") = 0.011166666666667);
          EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePumpOut clearance(useSoluteFlowInput = true);
          Modelica.Blocks.Math.Gain K(k(unit = "1/s") = 0.00555 / 60);
        equation
          connect(secretion.q_out, erythropoetin.q_out);
          connect(pow.y, PO2Effect1.u);
          connect(CounEffect.y, FunctionEffect.yBase);
          connect(FunctionEffect.y, PO2Effect1.yBase);
          connect(Kidney_Nefron_Count_TotalxNormal.y, CounEffect.u);
          connect(KidneyFunctionEffect.y, FunctionEffect.u);
          connect(PO2Effect.y, pow.exponent);
          connect(kidney_po2, PO2Effect.u);
          connect(PO2Effect.yBase, hormoneFlowFraction.y);
          connect(molarFlowRate.y, CounEffect.yBase);
          connect(erythropoetin.solutionVolume, VODIST.y);
          connect(PO2Effect1.y, secretion.soluteFlow);
          connect(ecf_volume, VODIST.u);
          connect(concentrationMeasure.concentration, concentration);
          connect(erythropoetin.q_out, concentrationMeasure.q_in);
          connect(clearance.q_in, erythropoetin.q_out);
          connect(erythropoetin.solute, K.u);
          connect(K.y, clearance.soluteFlow);
        end Erythropoetin;

        model KidneyFluidBalance  
          Physiolibrary.Types.RealIO.VolumeFlowRateOutput urineoutflowrate;
          Physiolibrary.Types.RealIO.VolumeInput plasmaticVolume;
          parameter Physiolibrary.Types.VolumeFlowRate Kud = 4.6666666666667e-08;
          parameter Physiolibrary.Types.VolumeFlowRate Kuo = 3.4666666666667e-07;
          parameter Physiolibrary.Types.VolumeFlowRate Jun = 1.6666666666667e-08;
          discrete Physiolibrary.Types.Volume Vpn;
        equation
          when {initial()} then
            Vpn = plasmaticVolume;
          end when;
          if plasmaticVolume < Vpn then
            urineoutflowrate = Kud * ((plasmaticVolume - Vpn) / Vpn) + Jun;
          else
            urineoutflowrate = Kuo * ((plasmaticVolume - Vpn) / Vpn) + Jun;
          end if;
        end KidneyFluidBalance;

        model RedBloodCells2  
          Erythropoetin erythropoetin;
          Physiolibrary.Population.Components.Population RBC;
          Physiolibrary.Population.Sources.Growth erythropoiesis(useChangeInput = true);
          Physiolibrary.Population.Sources.Growth transfusion;
          Physiolibrary.Population.Components.Mortality degradation(LifeTime(displayUnit = "d") = 10368000);
          Physiolibrary.Population.Sources.Loss hemorrhage;
          Physiolibrary.Types.Constants.PopulationChangeConst RBCBaseSecretionRate(k = 1.16e6) "13.7 ml/day (12e12 cells == 2.4 L)";
          Physiolibrary.Blocks.Factors.SplineLag EPOEffect(HalfTime = 3 * 86400 * Modelica.Math.log(2), data = {{0.0, 0.0, 0}, {1.3, 1.0, 1.0}, {4.0, 4.0, 0}}, stateName = "[EPO]Delay.Effect", UsePositiveLog10 = true, Xscale = 1e3) "20 miu/ml = 20e3 iu/m3";
          Physiolibrary.Types.BusConnector busConnector;
          Modelica.Blocks.Math.Gain RBCVol(k(unit = "m3") = 2.4e-3 / 12e12) "12e12 cells == 2.4 L";
          Modelica.Blocks.Math.Gain InitialPopulation(k = 12e12 / 2.4e-3) "12e12 cells == 2.4 L";
        initial algorithm
        equation
          connect(erythropoiesis.port_b, RBC.port);
          connect(transfusion.port_b, RBC.port);
          connect(degradation.port_a, RBC.port);
          connect(hemorrhage.port_a, RBC.port);
          connect(erythropoiesis.populationChange, EPOEffect.y);
          connect(RBCBaseSecretionRate.y, EPOEffect.yBase);
          connect(EPOEffect.u, erythropoetin.concentration);
          connect(erythropoetin.kidney_po2, busConnector.Kidney_PO2) annotation(Text(string = "%second", index = 1, extent = {{-9, -3}, {-9, -3}}));
          connect(erythropoetin.ecf_volume, busConnector.ecfvolume) annotation(Text(string = "%second", index = 1, extent = {{2, -6}, {2, -6}}));
          connect(RBC.population, RBCVol.u);
          connect(RBCVol.y, busConnector.RBCVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(InitialPopulation.u, busConnector.initialrbcvolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end RedBloodCells2;

        model Plasma2  
          Physiolibrary.Osmotic.Sources.SolventInflux transfusion(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventOutflux hemorrhage(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventInflux IVDrip(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventInflux FoodAndDrink(useSolutionFlowInput = false, SolutionFlow(displayUnit = "l/day") = 2.4305555555556e-08);
          Physiolibrary.Osmotic.Sources.SolventInflux Metabolism(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 3.4722222222222e-09);
          Physiolibrary.Osmotic.Sources.SolventOutflux SkinAndLungsLoss(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.0416666666667e-08);
          Physiolibrary.Osmotic.Sources.SolventOutflux Urine(SolutionFlow(displayUnit = "ml/day") = 1.7361111111111e-08, useSolutionFlowInput = true);
          Physiolibrary.Osmotic.Sources.SolventOutflux Feces(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.1574074074074e-09);
          Physiolibrary.Osmotic.Components.Membrane capillaryMembrane(HydraulicPressureIn(displayUnit = "mmHg") = 2359.8062572455, cond(displayUnit = "m3/(Pa.s)") = 3.7265559293265e-11, HydraulicPressureOut = -549.2882361498, T(displayUnit = "K"));
          Physiolibrary.Osmotic.Components.OsmoticCell interstitialFluid(NumberOfMembraneTypes = 2, volume_start = 0.01175, ImpermeableSolutes = {0.0061, 3.1});
          Modelica.Blocks.Math.Add add1;
          KidneyFluidBalance kidneyFluidBalance(Kud(displayUnit = "ml/min"), Kuo(displayUnit = "m3/s"), Jun(displayUnit = "m3/s"));
          Physiolibrary.Osmotic.Components.SolventFlux lymphatic(SolutionFlow(displayUnit = "l/day") = 3.45e-08);
          Physiolibrary.Types.BusConnector busConnector;
          Physiolibrary.Osmotic.Components.OsmoticCell plasma(Simulation = Physiolibrary.Types.SimulationType.NoInit, NumberOfMembraneTypes = 2, ImpermeableSolutes(displayUnit = "mmol") = {0.00356, 0.82});
        equation
          connect(capillaryMembrane.q_out, interstitialFluid.q_in[1]);
          connect(interstitialFluid.volume, add1.u1);
          connect(interstitialFluid.q_in[1], lymphatic.q_in);
          connect(kidneyFluidBalance.urineoutflowrate, Urine.solutionFlow);
          connect(plasma.q_in[1], capillaryMembrane.q_in);
          connect(plasma.q_in[1], transfusion.q_out);
          connect(lymphatic.q_out, transfusion.q_out);
          connect(IVDrip.q_out, transfusion.q_out);
          connect(hemorrhage.q_in, transfusion.q_out);
          connect(FoodAndDrink.q_out, transfusion.q_out);
          connect(Feces.q_in, transfusion.q_out);
          connect(Urine.q_in, transfusion.q_out);
          connect(kidneyFluidBalance.plasmaticVolume, busConnector.plasmaVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(plasma.volume, busConnector.plasmaVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(add1.u2, plasma.volume);
          connect(add1.y, busConnector.ecfvolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(Metabolism.q_out, lymphatic.q_in);
          connect(SkinAndLungsLoss.q_in, lymphatic.q_in);
        end Plasma2;

        model VolumeRefill2  "injects/removes volume if the pressure on connector is > 0" 
          DesiredFlowrate desiredFlowrate(flowtime(displayUnit = "s") = 1);
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b;
          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeRefill(useSolutionFlowInput = true);
          Modelica.Blocks.Logical.Switch switch1;
          Physiolibrary.Types.Constants.VolumeFlowRateConst zeroRefill(k(displayUnit = "l/min") = 0);
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
          Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 0);
          Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(displayUnit = "ml/(mmHg.s)") = 7.5006157584566e-08);
          Physiolibrary.Types.BusConnector busConnector;
        equation
          connect(switch1.y, volumeRefill.solutionFlow);
          connect(desiredFlowrate.volumeflowrate, switch1.u1);
          connect(zeroRefill.y, switch1.u3);
          connect(pressureMeasure.pressure, greaterThreshold.u);
          connect(greaterThreshold.y, switch1.u2);
          connect(port_b, conductor.q_out);
          connect(volumeRefill.q_out, conductor.q_in);
          connect(desiredFlowrate.volume, busConnector.bloodVolume) annotation(Text(string = "%second", index = 1, extent = {{3, 6}, {3, 6}}));
          connect(desiredFlowrate.desiredVolume, busConnector.desiredBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{1, 3}, {1, 3}}));
          connect(pressureMeasure.q_in, conductor.q_out);
        end VolumeRefill2;

        model BloodProperties  
          Modelica.Blocks.Math.Add DesiredBloodVolume;
          KidneyPO2Estimate kidneyPO2Estimate(spline(data = [0.3, 0, 0; 0.4, 36.3, 1; 0.5, 60, 0]));
          Physiolibrary.Types.BusConnector busConnector;
          Modelica.Blocks.Math.Division hematocrit;
          Modelica.Blocks.Math.Add3 BloodVolume;
          Physiolibrary.Types.Constants.FractionConst initialHematocrit(k = 0.4);
          Modelica.Blocks.Math.Product InitialRBCVolume;
          Modelica.Blocks.Math.Add InitialPlasmaVolume(k2 = -1);
        equation
          connect(DesiredBloodVolume.u2, busConnector.RBCVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(DesiredBloodVolume.u1, busConnector.plasmaVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(DesiredBloodVolume.y, busConnector.desiredBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(hematocrit.u2, DesiredBloodVolume.y);
          connect(hematocrit.u1, DesiredBloodVolume.u2);
          connect(hematocrit.y, busConnector.hematocrit) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(hematocrit.y, kidneyPO2Estimate.hematocrit);
          connect(kidneyPO2Estimate.pressure, busConnector.Kidney_PO2) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(BloodVolume.u3, busConnector.pulmonaryBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(BloodVolume.u2, busConnector.systemicBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(BloodVolume.u1, busConnector.heartBloodVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(BloodVolume.y, busConnector.bloodVolume) annotation(Text(string = "%second", index = 1, extent = {{8, 0}, {8, 0}}));
          connect(initialHematocrit.y, InitialRBCVolume.u1);
          connect(BloodVolume.y, InitialRBCVolume.u2);
          connect(InitialRBCVolume.y, busConnector.initialrbcvolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(InitialRBCVolume.y, InitialPlasmaVolume.u2);
          connect(BloodVolume.y, InitialPlasmaVolume.u1);
          connect(InitialPlasmaVolume.y, busConnector.initialPlasmaVolume) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end BloodProperties;

        model DesiredFlowrate  "control total blood volume" 
          parameter Physiolibrary.Types.Time flowtime = 0.1;
          parameter Boolean enabled = true;
          Physiolibrary.Types.RealIO.VolumeInput volume;
          Physiolibrary.Types.RealIO.VolumeInput desiredVolume;
          Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate;
        equation
          volumeflowrate = if enabled then (desiredVolume - volume) / flowtime else 0;
        end DesiredFlowrate;

        model PlasmaBleeding  
          extends Plasma2(hemorrhage(useSolutionFlowInput = true), transfusion(useSolutionFlowInput = true), plasma(Simulation = Physiolibrary.Types.SimulationType.NoInit));
        equation
          connect(hemorrhage.solutionFlow, busConnector.plasmableed) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(transfusion.solutionFlow, busConnector.plasmatransfusion) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end PlasmaBleeding;

        model RBCBleeding  
          extends RedBloodCells2(transfusion(useChangeInput = true), hemorrhage(useChangeInput = true), RBC(Simulation = Physiolibrary.Types.SimulationType.NoInit));
        equation
          connect(transfusion.populationChange, busConnector.RBCtransfusion) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
          connect(hemorrhage.populationChange, busConnector.RBCbleed) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        end RBCBleeding;
      end BloodVolume;

      model BloodVolumeControl  
        extends Cardiovascular.Controlled.LongTermControl;
        replaceable BloodVolume.Plasma2 plasma(plasma(Simulation = Physiolibrary.Types.SimulationType.NoInit)) constrainedby BloodVolume.Plasma2;
        replaceable BloodVolume.RedBloodCells2 redBloodCells(RBC(population_start = 2, Simulation = Physiolibrary.Types.SimulationType.NoInit)) constrainedby BloodVolume.RedBloodCells2;
        BloodVolume.BloodProperties bloodProperties;
      initial algorithm
        plasma.plasma.state := bloodProperties.InitialPlasmaVolume.y;
        redBloodCells.RBC.state := redBloodCells.InitialPopulation.y;
      equation
        connect(plasma.busConnector, busConnector) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(redBloodCells.busConnector, busConnector) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bloodProperties.busConnector, busConnector) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
      end BloodVolumeControl;

      model MeanAortaPressureMeasurement  
        extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
        discrete .Physiolibrary.Types.RealIO.PressureOutput Pmean(start = 11300) "Mean pressure during heart cycle";
        Real SumPressure(start = 6300) "sum of pressure of cardiac cycle";
        discrete Boolean b(start = false) "beat signal";
        .Physiolibrary.Types.Time T0(start = 0) "start of cardiac cycle ";
        discrete .Physiolibrary.Types.Time HP(start = 0.75) "length of cardiac cycle";
      equation
        b = der(q_in.pressure) > 0;
        der(SumPressure) = q_in.pressure;
        when {edge(b)} then
          T0 = time "initial time of current cardiac cycle";
          HP = if pre(T0) > 0 then time - pre(T0) else 0.75;
          Pmean = SumPressure / HP "mean pressure";
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
        end when;
      end MeanAortaPressureMeasurement;

      model BloodFlowMeasurement  "measures flow, diastolic, systolic and mean pressure" 
        extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
        .Physiolibrary.Types.RealIO.PressureOutput Ps "Systolic pressure during heart cycle";
        .Physiolibrary.Types.RealIO.PressureOutput Pd "Diastolic pressure during heart cycle";
        .Physiolibrary.Types.RealIO.PressureOutput Pmean "Mean pressure during heart cycle";
        Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume";
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output";
        Physiolibrary.Types.Volume Volume(start = 0) "sum of volume through cyrdiac cycle";
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        .Physiolibrary.Types.Pressure Pmin(start = 133000);
        .Physiolibrary.Types.Pressure Pmax(start = 0);
        discrete .Physiolibrary.Types.Time T0(start = 0) "start of cardiac cycle ";
        discrete .Physiolibrary.Types.Time HP "length of cardiac cycle";
        Boolean b;
        Physiolibrary.Types.RealIO.FrequencyInput HR;
      initial algorithm
        Ps := q_in.pressure;
        Pd := q_in.pressure;
        Pmean := q_in.pressure;
        HP := 1 / HR;
      equation
        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        b = time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
        when {b} then
          T0 = time "initial time of current cardiac cycle";
          HP = 1 / HR;
          Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
          Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
          Pmean = if pre(HP) > 0 then SumPressure / pre(HP) else pre(Pd) * 2 / 3 + pre(Ps) * 1 / 3 "mean pressure";
          SV = Volume "systolic volume is equal of total volume passed through this block";
          CO = SV / HP "cardiac output calculation from systolic volume and heart period";
          reinit(Volume, 0) "reinitialisation of volume";
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
          reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
          reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
        end when;
        der(Volume) = q_in.q;
        der(SumPressure) = q_in.pressure;
      end BloodFlowMeasurement;

      model AortaPressureMeasurement  
        extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
        discrete .Physiolibrary.Types.RealIO.PressureOutput Ps "Systolic pressure during heart cycle";
        discrete .Physiolibrary.Types.RealIO.PressureOutput Pd "Diastolic pressure during heart cycle";
        discrete .Physiolibrary.Types.RealIO.PressureOutput Pmean "Mean pressure during heart cycle";
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        .Physiolibrary.Types.Pressure Pmax;
        .Physiolibrary.Types.Pressure Pmin;
        discrete Boolean b(start = false) "beat signal";
        .Physiolibrary.Types.Time T0(start = 0) "start of cardiac cycle ";
        discrete .Physiolibrary.Types.Time HP(start = 1) "length of cardiac cycle";
        .Physiolibrary.Types.Pressure PmeanA "approximation of mean pressure";
        .Physiolibrary.Types.Pressure Pmean2 "approximation of mean pressure";
      equation
        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        PmeanA = 2 / 3 * Pmin + 1 / 3 * Pmax;
        b = der(q_in.pressure) > 0;
        der(SumPressure) = q_in.pressure;
        when {initial(), edge(b)} then
          T0 = time "initial time of current cardiac cycle";
          HP = if pre(T0) > 0 then time - pre(T0) else 1;
          Ps = pre(Pmax) "systolic pressure = maximum pressure during cardiac cycle";
          Pd = pre(Pmin) "diastolic pressure=minimal pressure during cardiac cycle";
          Pmean2 = pre(SumPressure) / pre(HP) "mean pressure";
          Pmean = if Pmean2 < Pd then max(Pd, PmeanA) else Pmean2;
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
          reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
          reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
        end when;
      end AortaPressureMeasurement;
    end Control;

    package Scenario  "models of various scenarios" 
      extends Modelica.Icons.VariantsPackage;

      partial model StenosisControl  
        extends Controlled.ScenarioControl;
        Stenosis.StenosisElastance venacavastenosis;
        Stenosis.StenosisResistance aorticstenosis "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater";
        Physiolibrary.Types.Constants.HydraulicConductanceConst AVgon(k = 0);
        Stenosis.StenosisResistance mitralvalvestenosis(InitialResistance(displayUnit = "(mmHg.s)/ml"), FinalResistance(displayUnit = "(mmHg.s)/ml")) "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater";
        Physiolibrary.Types.Constants.HydraulicConductanceConst mvgoff(k = 0);
      equation
        connect(venacavastenosis.hydrauliccompliance, busConnector.venacavacompliance0) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(aorticstenosis.conductance, busConnector.avoutflowresistance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(mitralvalvestenosis.conductance, busConnector.mv_gon) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(mvgoff.y, busConnector.mv_goff) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(AVgon.y, busConnector.avbackflowconductance) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
      end StenosisControl;

      package Stenosis  
        extends Modelica.Icons.UtilitiesPackage;

        model StenosisElastance  
          parameter Physiolibrary.Types.HydraulicElastance InitialElastance;
          parameter Physiolibrary.Types.HydraulicElastance FinalElastance;
          parameter Physiolibrary.Types.Time startTime(displayUnit = "s") = 20;
          parameter Physiolibrary.Types.Time duration(displayUnit = "s") = 5;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput hydrauliccompliance;
        equation
          hydrauliccompliance = 1 / (InitialElastance + (if time < startTime then 0 else if time < startTime + duration then (time - startTime) * (FinalElastance - InitialElastance) / duration else FinalElastance - InitialElastance));
        end StenosisElastance;

        model StenosisResistance  
          parameter Physiolibrary.Types.HydraulicResistance InitialResistance;
          parameter Physiolibrary.Types.HydraulicResistance FinalResistance;
          parameter Physiolibrary.Types.Time startTime(displayUnit = "s") = 20;
          parameter Physiolibrary.Types.Time duration(displayUnit = "s") = 5;
          Physiolibrary.Types.RealIO.HydraulicConductanceOutput conductance;
        equation
          conductance = 1 / (InitialResistance + (if time < startTime then 0 else if time < startTime + duration then (time - startTime) * (FinalResistance - InitialResistance) / duration else FinalResistance - InitialResistance));
        end StenosisResistance;
      end Stenosis;

      model BleedingTransfusionScenario  
        extends Cardiovascular.Controlled.ScenarioControl;
        parameter .Physiolibrary.Types.Time Tbs = 60;
        parameter .Physiolibrary.Types.Time Tbd = 5 * 60;
        parameter .Physiolibrary.Types.Volume BloodLoss = 0.001;
        parameter .Physiolibrary.Types.Time Tts = 20 * 60;
        parameter .Physiolibrary.Types.Time Ttd = 10 * 60;
        parameter .Physiolibrary.Types.Volume BloodTrans = 0.001;
        BleedingTransfusionBurkhoffInterface bleedingTransfusionBurkhoffInterface;
        BleedingTransfusionRate bleedingTransfusionRate(Tbs = Tbs, Tbd = Tbd, BloodLoss = BloodLoss, Tts = Tts, Ttd = Ttd, BloodTrans = BloodTrans);
      equation
        connect(bleedingTransfusionBurkhoffInterface.hematocrit, busConnector.hematocrit) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bleedingTransfusionBurkhoffInterface.RBCbleed, busConnector.RBCbleed) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bleedingTransfusionBurkhoffInterface.RBCtransfusion, busConnector.RBCtransfusion) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bleedingTransfusionBurkhoffInterface.plasmableed, busConnector.plasmableed) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bleedingTransfusionBurkhoffInterface.plasmatransfusion, busConnector.plasmatransfusion) annotation(Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
        connect(bleedingTransfusionRate.bleedrate, bleedingTransfusionBurkhoffInterface.bleedrate);
        connect(bleedingTransfusionRate.transrate, bleedingTransfusionBurkhoffInterface.transrate);
      end BleedingTransfusionScenario;

      model BleedingTransfusionBurkhoffInterface  
        Physiolibrary.Types.RealIO.VolumeFlowRateInput bleedrate;
        Physiolibrary.Types.RealIO.VolumeFlowRateInput transrate;
        Modelica.Blocks.Interfaces.RealInput hematocrit;
        Modelica.Blocks.Interfaces.RealOutput RBCbleed;
        Modelica.Blocks.Interfaces.RealOutput RBCtransfusion;
        Modelica.Blocks.Interfaces.RealOutput plasmableed;
        Modelica.Blocks.Interfaces.RealOutput plasmatransfusion;
      equation
        RBCbleed = bleedrate * hematocrit * 12e12 / 2.4e-3;
        plasmableed = bleedrate * (1 - hematocrit);
        RBCtransfusion = transrate * 0.4 * 12e12 / 2.4e-3;
        plasmatransfusion = transrate * (1 - 0.4);
      end BleedingTransfusionBurkhoffInterface;

      model BleedingTransfusionRate  
        parameter .Physiolibrary.Types.Time Tbs = 60;
        parameter .Physiolibrary.Types.Time Tbd = 5 * 60;
        parameter .Physiolibrary.Types.Volume BloodLoss = 0.001;
        parameter .Physiolibrary.Types.Time Tts = 20 * 60;
        parameter .Physiolibrary.Types.Time Ttd = 10 * 60;
        parameter .Physiolibrary.Types.Volume BloodTrans = 0.001;
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput bleedrate;
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput transrate;
      equation
        if time > Tbs and time < Tbs + Tbd then
          bleedrate = BloodLoss / Tbd;
        else
          bleedrate = 0;
        end if;
        if time > Tts and time < Tts + Ttd then
          transrate = BloodTrans / Ttd;
        else
          transrate = 0;
        end if;
      end BleedingTransfusionRate;
    end Scenario;
  end Model;

  package Types  
    package Constants  
      block FrequencyControl  "External signal of type Frequency" 
        Physiolibrary.Types.RealIO.FrequencyOutput y "HydraulicCompliance constant";
        Physiolibrary.Types.RealIO.FrequencyInput c;
        parameter Physiolibrary.Types.Frequency k;
      equation
        y = c;
      end FrequencyControl;
    end Constants;
  end Types;

  package Test  
    model AllModels  
      Model.Meurs.HemodynamicsMeurs_shallow hemodynamicsMeurs_shallow;
      Model.Meurs.HemodynamicsMeurs hemodynamicsMeurs;
      Model.Meurs.HemodynamicsMeursBVControl hemodynamicsMeursBVControl;
      Model.Meurs.StenosisAorticValve stenosisAorticValve;
      Model.Meurs.Bleeding bleeding;
      Model.Burkhoff.HemodynamicsBurkhoff_shallow hemodynamicsBurkhoff_shallow;
      Model.Burkhoff.HemodynamicsBurkhoff hemodynamicsBurkhoff;
      Model.Burkhoff.HemodynamicsBurkhoffBVControl hemodynamicsBurkhoffBVControl;
      Model.Burkhoff.StenosisAorticValve stenosisAorticValve1;
      Model.Burkhoff.Bleeding bleeding1;
      Model.Smith2004.HemodynamicsSmith_shallow hemodynamicsSmith_shallow;
      Model.Smith2004.HemodynamicsSmith hemodynamicsSmith;
      Model.Smith2004.HemodynamicsSmithControl hemodynamicsSmithControl;
      Model.Smith2004.StenosisAorticValve stenosisAorticValve2;
      Model.Smith2004.Bleeding bleeding2;
    end AllModels;
  end Test;
end Cardiovascular;

package Physiolibrary  "Modelica library for Physiology (version 2.3.1)" 
  extends Modelica.Icons.Package;

  package Hydraulic  "Domain with Pressure and Volumetric Flow" 
    extends Modelica.Icons.Package;

    package Components  
      extends Modelica.Icons.Package;

      model Conductor  "Hydraulic resistor, where conductance=1/resistance" 
        extends Hydraulic.Interfaces.OnePort;
        extends Icons.HydraulicResistor;
        parameter Boolean useConductanceInput = false "=true, if external conductance value is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.HydraulicConductance Conductance = 0 "Hydraulic conductance if useConductanceInput=false";
        Types.RealIO.HydraulicConductanceInput cond(start = Conductance) = c if useConductanceInput;
      protected
        Types.HydraulicConductance c;
      equation
        if not useConductanceInput then
          c = Conductance;
        end if;
        q_in.q = c * (q_in.pressure - q_out.pressure);
      end Conductor;

      model Resistor  
        extends Physiolibrary.Hydraulic.Components.Conductor(final Conductance = 1 / Resistance);
        parameter Physiolibrary.Types.HydraulicResistance Resistance "Hydraulic conductance if useConductanceInput=false";
      end Resistor;

      model ElasticVessel  "Elastic container for blood vessels, bladder, lumens" 
        extends Icons.ElasticBalloon;
        extends SteadyStates.Interfaces.SteadyState(state_start = volume_start, storeUnit = "ml");
        Interfaces.HydraulicPort_a q_in;
        parameter Types.Volume volume_start = 1e-11 "Volume start value";
        Types.Volume excessVolume "Additional volume, that generate pressure";
        parameter Boolean useV0Input = false "=true, if zero-pressure-volume input is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.Volume ZeroPressureVolume = 1e-11 "Maximal volume, that does not generate pressure if useV0Input=false";
        parameter Types.Volume CollapsingPressureVolume = 1e-12 "Maximal volume, which generate negative collapsing pressure";
        Types.RealIO.VolumeInput zeroPressureVolume(start = ZeroPressureVolume) = zpv if useV0Input;
        parameter Boolean useComplianceInput = false "=true, if compliance input is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.HydraulicCompliance Compliance = 1 "Compliance if useComplianceInput=false";
        Types.RealIO.HydraulicComplianceInput compliance(start = Compliance) = c if useComplianceInput;
        parameter Boolean useExternalPressureInput = false "=true, if external pressure input is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.Pressure ExternalPressure = 0 "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false.";
        parameter Types.Pressure MinimalCollapsingPressure = -101325;
        Types.RealIO.PressureInput externalPressure(start = ExternalPressure) = ep if useExternalPressureInput;
        Types.RealIO.VolumeOutput volume;
      protected
        Types.Volume zpv;
        Types.HydraulicCompliance c;
        Types.Pressure ep;
        parameter Types.Pressure a = MinimalCollapsingPressure / log(Modelica.Constants.eps);
      equation
        if not useV0Input then
          zpv = ZeroPressureVolume;
        end if;
        if not useComplianceInput then
          c = Compliance;
        end if;
        if not useExternalPressureInput then
          ep = ExternalPressure;
        end if;
        excessVolume = max(0, volume - zpv);
        q_in.pressure = smooth(0, if noEvent(volume > CollapsingPressureVolume) then excessVolume / c + ep else a * log(max(Modelica.Constants.eps, volume / CollapsingPressureVolume)) + ep);
        state = volume;
        change = q_in.q;
      end ElasticVessel;

      model ElasticVesselElastance  
        extends Physiolibrary.Hydraulic.Components.ElasticVessel(final Compliance = 1 / Elastance);
        parameter Physiolibrary.Types.HydraulicElastance Elastance = 1 "Elastance if useComplianceInput=false";
      end ElasticVesselElastance;

      model Inertia  "Inertia of the volumetric flow" 
        extends SteadyStates.Interfaces.SteadyState(state_start = volumeFlow_start, storeUnit = "ml/min");
        extends Interfaces.OnePort;
        extends Icons.Inertance;
        parameter Types.VolumeFlowRate volumeFlow_start = 0.3 "Volumetric flow start value";
        parameter Types.HydraulicInertance I "Inertance";
      equation
        state = q_in.q;
        change = (q_in.pressure - q_out.pressure) / I;
      end Inertia;

      model IdealValve  
        extends Interfaces.OnePort;
        Boolean open(start = true) "Switching state";
        Real passableVariable(start = 0, final unit = "1") "Auxiliary variable for actual position on the ideal diode characteristic";
        parameter Types.HydraulicConductance _Gon(final min = 0, displayUnit = "l/(mmHg.min)") = 1.2501026264094e-02 "Forward state-on conductance (open valve conductance)";
        parameter Types.HydraulicConductance _Goff(final min = 0, displayUnit = "l/(mmHg.min)") = 1.2501026264094e-12 "Backward state-off conductance (closed valve conductance)";
        parameter Types.Pressure Pknee(final min = 0) = 0 "Forward threshold pressure";
        parameter Boolean useLimitationInputs = false "=true, if Gon and Goff are from inputs" annotation(Evaluate = true, HideResult = true);
        Types.RealIO.HydraulicConductanceInput Gon(start = _Gon) = gon if useLimitationInputs "open valve conductance = infinity for ideal case";
        Types.RealIO.HydraulicConductanceInput Goff(start = _Goff) = goff if useLimitationInputs "closed valve conductance = zero for ideal case";
      protected
        Types.HydraulicConductance gon;
        Types.HydraulicConductance goff;
        constant Types.Pressure unitPressure = 1;
        constant Types.VolumeFlowRate unitFlow = 1;
      equation
        if not useLimitationInputs then
          gon = _Gon;
          goff = _Goff;
        end if;
        open = passableVariable > Modelica.Constants.eps;
        dp = passableVariable * unitFlow * (if open then 1 / gon else 1) + Pknee;
        volumeFlowRate = passableVariable * unitPressure * (if open then 1 else goff) + goff * Pknee;
      end IdealValve;

      model IdealValveResistance  
        extends Physiolibrary.Hydraulic.Components.IdealValve(final _Gon = 1 / _Ron);
        parameter Physiolibrary.Types.HydraulicResistance _Ron = 79.993432449 "forward state resistance";
      end IdealValveResistance;
    end Components;

    package Sensors  
      extends Modelica.Icons.SensorsPackage;

      model FlowMeasure  "Volumetric flow between ports" 
        extends Interfaces.OnePort;
        extends Modelica.Icons.RotationalSensor;
        Types.RealIO.VolumeFlowRateOutput volumeFlow "Actual volume flow rate";
      equation
        q_out.pressure = q_in.pressure;
        volumeFlow = q_in.q;
      end FlowMeasure;

      model PressureMeasure  "Hydraulic pressure at port" 
        extends Icons.PressureMeasure;
        Interfaces.HydraulicPort_a q_in;
        Types.RealIO.PressureOutput pressure "Pressure";
      equation
        pressure = q_in.pressure;
        q_in.q = 0;
      end PressureMeasure;
    end Sensors;

    package Sources  
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedPump  "Prescribed flow at port" 
        extends Interfaces.ConditionalSolutionFlow;
        Interfaces.HydraulicPort_b q_out;
      equation
        q_out.q = -q;
      end UnlimitedPump;
    end Sources;

    package Interfaces  
      extends Modelica.Icons.InterfacesPackage;

      connector HydraulicPort  "Hydraulical connector with pressure and volumetric flow" 
        Types.Pressure pressure "Pressure";
        flow Types.VolumeFlowRate q "Volume flow";
      end HydraulicPort;

      connector HydraulicPort_a  "Hydraulical inflow connector" 
        extends HydraulicPort;
      end HydraulicPort_a;

      connector HydraulicPort_b  "Hydraulical outflow connector" 
        extends HydraulicPort;
      end HydraulicPort_b;

      partial model OnePort  "Hydraulical OnePort" 
        HydraulicPort_a q_in "Volume inflow";
        HydraulicPort_b q_out "Volume outflow";
        Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
        Types.Pressure dp "Pressure gradient";
      equation
        q_in.q + q_out.q = 0;
        volumeFlowRate = q_in.q;
        dp = q_in.pressure - q_out.pressure;
      end OnePort;

      partial model ConditionalSolutionFlow  "Input of solution volumetric flow vs. parametric solution volumetric flow" 
        parameter Boolean useSolutionFlowInput = false "=true, if solution flow input is used instead of parameter SolutionFlow" annotation(Evaluate = true, HideResult = true);
        parameter Types.VolumeFlowRate SolutionFlow = 0 "Volumetric flow of solution if useSolutionFlowInput=false" annotation(HideResult = not useSolutionFlowInput);
        Types.RealIO.VolumeFlowRateInput solutionFlow(start = SolutionFlow) = q if useSolutionFlowInput;
        Types.VolumeFlowRate q "Current solution flow";
      equation
        if not useSolutionFlowInput then
          q = SolutionFlow;
        end if;
      end ConditionalSolutionFlow;
    end Interfaces;
  end Hydraulic;

  package Population  "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc." 
    extends Modelica.Icons.Package;

    package Components  
      extends Modelica.Icons.Package;

      model Population  
        extends Icons.Population;
        extends SteadyStates.Interfaces.SteadyState(state(nominal = NominalPopulation), change(nominal = NominalPopulationChange), state_start = population_start, storeUnit = "1");
        parameter Types.Population population_start(nominal = NominalPopulation) = 1e-8 "Initial population size in compartment" annotation(HideResult = true);
        parameter Types.Population NominalPopulation = 1 "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount." annotation(HideResult = true);
        parameter Types.PopulationChange NominalPopulationChange = 1 / (60 * 60 * 24) "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different." annotation(HideResult = true);
        Interfaces.PopulationPort_b port(population(nominal = NominalPopulation), change(nominal = NominalPopulationChange));
        Types.RealIO.PopulationOutput population(nominal = NominalPopulation);
      equation
        port.population = population;
        state = population;
        change = port.change;
      end Population;

      model Mortality  "As population change per one individual" 
        extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_a port_a;
      equation
        port_a.change = changePerPopulationMember * port_a.population;
      end Mortality;
    end Components;

    package Sources  
      extends Modelica.Icons.SourcesPackage;

      model Growth  
        extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_b port_b;
      equation
        port_b.change = -change;
      end Growth;

      model Loss  
        extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_a port_a;
      equation
        port_a.change = change;
      end Loss;
    end Sources;

    package Interfaces  
      extends Modelica.Icons.InterfacesPackage;

      connector PopulationPort  "Average number of population members and their change" 
        Types.Population population "Average number of population individuals";
        flow Types.PopulationChange change "Average population change = change of population individuals";
      end PopulationPort;

      connector PopulationPort_a  "Increase (or decrease) of population" 
        extends PopulationPort;
      end PopulationPort_a;

      connector PopulationPort_b  "Decrease (or increase) of population" 
        extends PopulationPort;
      end PopulationPort_b;

      partial model ConditionalChange  "Input of population change vs. parametric constant change" 
        parameter Boolean useChangeInput = false "=true, if real input connector is used instead of parameter PopulationChange" annotation(Evaluate = true, HideResult = true);
        parameter Types.PopulationChange PopulationChange = 0 "Population change if useChangeInput=false" annotation(HideResult = not useChangeInput);
        Types.RealIO.PopulationChangeInput populationChange(start = PopulationChange) = change if useChangeInput;
        Types.PopulationChange change "Current population change";
      equation
        if not useChangeInput then
          change = PopulationChange;
        end if;
      end ConditionalChange;

      partial model ConditionalLifeTime  "Input of population change per one population member vs. parametric lifetime" 
        parameter Boolean useChangePerMemberInput = false "=true, if real input connector is used instead of parameter LifeTime" annotation(Evaluate = true, HideResult = true);
        parameter Types.Time LifeTime = 1e-8 "Mean life time for population (=1.44*halftime) if useChangePerMember=false" annotation(HideResult = not useChangePerMemberInput);
        Types.RealIO.PopulationChangePerMemberInput changePerMember(start = 1 / LifeTime) = changePerPopulationMember if useChangePerMemberInput;
        Types.PopulationChangePerMember changePerPopulationMember "Current population change per individual";
      equation
        if not useChangePerMemberInput then
          changePerPopulationMember = 1 / LifeTime;
        end if;
      end ConditionalLifeTime;
    end Interfaces;
  end Population;

  package SteadyStates  "Dynamic Simulation / Steady State" 
    extends Modelica.Icons.Package;

    package Interfaces  
      extends Modelica.Icons.InterfacesPackage;

      partial model SteadyState  "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option." 
        replaceable package Utilities = Types.FilesUtilities(directoryName = dirName) constrainedby Types.Utilities;
        parameter Types.SimulationType Simulation = Types.SimulationType.NormalInit "Dynamic with Initialization or Steady State" annotation(Evaluate = true, HideResult = true);
        parameter Boolean isDependent = false "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc." annotation(Evaluate = true, HideResult = true);
        parameter Real state_start "State start or init value" annotation(HideResult = true);
        Real state(start = if LOAD_STARTS then Utilities.readReal(stateName, storeUnit) else state_start, stateSelect = StateSelect.prefer) "This state must be connected in inherited class definition" annotation(HideResult = true);
        Real change "Dynamic change of state value per minute" annotation(HideResult = true);
        constant String dirName = "io" "Directory name to save and load values" annotation(HideResult = true);
        parameter String storeUnit = "" "Unit in Utilities input/output function" annotation(Evaluate = true, HideResult = true);
        parameter String stateName = getInstanceName() "Name in Utilities input/output function" annotation(Evaluate = true, HideResult = true);
        parameter Boolean LOAD_STARTS = false "Load start value of state" annotation(Evaluate = true, HideResult = true);
        parameter Boolean SAVE_RESULTS = false "Save final state values" annotation(Evaluate = true, HideResult = true);
        parameter Boolean SAVE_COMPARISON = false "Compare final state values with original values" annotation(Evaluate = true, HideResult = true);
      protected
        parameter Real defaultValue(fixed = false) "Default value of state.";
        parameter Real initialValue(fixed = false) "Initial value of state.";
      initial equation
        if Simulation == Types.SimulationType.NormalInit then
          state = state_start;
        elseif Simulation == Types.SimulationType.ReadInit then
          state = Utilities.readReal(stateName, storeUnit);
        elseif Simulation == Types.SimulationType.InitSteadyState and not isDependent then
          der(state) = 0;
        end if;
        initialValue = state;
        if SAVE_COMPARISON then
          defaultValue = Utilities.readReal(stateName, storeUnit);
        else
          defaultValue = Modelica.Constants.N_A;
        end if;
      equation
        when terminal() then
          if SAVE_RESULTS then
            Utilities.writeReal(stateName, state, storeUnit);
          end if;
          if SAVE_COMPARISON then
            Utilities.writeComparison(stateName, defaultValue, initialValue, state, storeUnit);
          end if;
        end when;
        if Simulation <> Types.SimulationType.SteadyState then
          der(state) = change;
        elseif not isDependent then
          change = 0;
        end if;
      end SteadyState;
    end Interfaces;
  end SteadyStates;

  package Icons  "Icons for physiological models" 
    extends Modelica.Icons.Package;

    class SystemicCirculation  end SystemicCirculation;

    class PulmonaryCirculation  end PulmonaryCirculation;

    partial class BaseFactorIcon  
      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;
    end BaseFactorIcon;

    partial class BaseFactorIcon3  
      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;
    end BaseFactorIcon3;

    partial class BaseFactorIcon4  
      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;
    end BaseFactorIcon4;

    class Substance  end Substance;

    class ElasticBalloon  end ElasticBalloon;

    partial class HydraulicResistor  end HydraulicResistor;

    class Membrane  end Membrane;

    class PressureMeasure  end PressureMeasure;

    class Inertance  end Inertance;

    class OsmoticCell  end OsmoticCell;

    class Population  end Population;
  end Icons;

  package Types  "Physiological units with nominals" 
    extends Modelica.Icons.Package;

    package Constants  
      extends Modelica.Icons.SourcesPackage;

      block FractionConst  "Constant signal of type Fraction" 
        parameter Types.Fraction k "Constant Fraction output value";
        RealIO.FractionOutput y "Fraction constant";
      equation
        y = k;
      end FractionConst;

      block FrequencyConst  "Constant signal of type Frequency" 
        parameter Types.Frequency k "Constant Frequency output value";
        RealIO.FrequencyOutput y "Frequency constant";
      equation
        y = k;
      end FrequencyConst;

      block HydraulicConductanceConst  "Constant signal of type HydraulicConductance" 
        parameter Types.HydraulicConductance k "Constant HydraulicConductance output value";
        RealIO.HydraulicConductanceOutput y "HydraulicConductance constant";
      equation
        y = k;
      end HydraulicConductanceConst;

      block MolarFlowRateConst  "Constant signal of type MolarFlowRate" 
        parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
        RealIO.MolarFlowRateOutput y "MolarFlowRate constant";
      equation
        y = k;
      end MolarFlowRateConst;

      block PressureConst  "Constant signal of type Pressure" 
        parameter Types.Pressure k "Constant Pressure output value";
        RealIO.PressureOutput y "Pressure constant";
      equation
        y = k;
      end PressureConst;

      block VolumeFlowRateConst  "Constant signal of type VolumeFlowRate" 
        parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
        RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant";
      equation
        y = k;
      end VolumeFlowRateConst;

      block OneConst  "1" 
        RealIO.FractionOutput y "=1";
      equation
        y = 1;
      end OneConst;

      block PopulationChangeConst  "Constant signal of type PopulationChange" 
        parameter Types.PopulationChange k "Constant PopulationChange output value";
        RealIO.PopulationChangeOutput y "PopulationChange constant";
      equation
        y = k;
      end PopulationChangeConst;
    end Constants;

    package RealIO  
      extends Modelica.Icons.Package;
      connector AmountOfSubstanceInput = input AmountOfSubstance "input AmountOfSubstance as connector";
      connector AmountOfSubstanceOutput = output AmountOfSubstance "output AmountOfSubstance as connector";
      connector ConcentrationOutput = output Concentration "output Concentration as connector";
      connector EnergyOutput = output Energy "output Energy as connector";
      connector MolarFlowRateInput = input MolarFlowRate "input MolarFlowRate as connector";
      connector MolarFlowRateOutput = output MolarFlowRate "output MolarFlowRate as connector";
      connector PressureInput = input Pressure "input Pressure as connector";
      connector PressureOutput = output Pressure "output Pressure as connector";
      connector VolumeInput = input Volume "input Volume as connector";
      connector VolumeOutput = output Volume "output Volume as connector";
      connector VolumeFlowRateInput = input VolumeFlowRate "input VolumeFlowRate as connector";
      connector VolumeFlowRateOutput = output VolumeFlowRate "output VolumeFlowRate as connector";
      connector TemperatureInput = input Temperature "input Temperature as connector";
      connector TimeOutput = output Time "output Time as connector";
      connector FractionInput = input Fraction "input Fraction as connector";
      connector FractionOutput = output Fraction "output Fraction as connector";
      connector FrequencyInput = input Frequency "input Frequency as connector";
      connector FrequencyOutput = output Frequency "output Frequency as connector";
      connector OsmoticPermeabilityInput = input OsmoticPermeability "input OsmoticPermeability as connector";
      connector HydraulicConductanceInput = input HydraulicConductance "input HydraulicConductance as connector";
      connector HydraulicConductanceOutput = output HydraulicConductance "output HydraulicConductance as connector";
      connector HydraulicComplianceInput = input HydraulicCompliance "input HydraulicCompliance as connector";
      connector HydraulicComplianceOutput = output HydraulicCompliance "output HydraulicCompliance as connector";
      connector PopulationOutput = output Population "output Population as connector";
      connector PopulationChangeInput = input PopulationChange "input PopulationChange as connector";
      connector PopulationChangeOutput = output PopulationChange "output PopulationChange as connector";
      connector PopulationChangePerMemberInput = input PopulationChangePerMember "input PopulationChangePerMember as connector";
    end RealIO;

    expandable connector BusConnector  "Empty control bus that is adapted to the signals connected to it" end BusConnector;

    type Energy = Modelica.SIunits.Energy(displayUnit = "kcal", nominal = 4186.8);
    type Time = Modelica.SIunits.Time(displayUnit = "min", nominal = 60);
    type Frequency = Modelica.SIunits.Frequency(displayUnit = "1/min");
    type Pressure = Modelica.SIunits.Pressure(displayUnit = "mmHg", nominal = 133.322387415);
    type Volume = Modelica.SIunits.Volume(displayUnit = "ml", nominal = 1e-6, min = 0);
    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit = "ml/min", nominal = 1e-6 / 60);
    replaceable type Concentration = Modelica.SIunits.Concentration(displayUnit = "mmol/l", min = 0) constrainedby Real;
    replaceable type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance(displayUnit = "mmol", min = 0) constrainedby Real;
    replaceable type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit = "mmol/min") constrainedby Real;
    replaceable type MolarEnergy = Modelica.SIunits.MolarEnergy(displayUnit = "kcal/mol", nominal = 4186.8) constrainedby Real;
    type Temperature = Modelica.SIunits.Temperature(displayUnit = "degC", nominal = 1, min = 0);
    type Fraction = Real(final quantity = "Fraction", final unit = "1", displayUnit = "%", nominal = 1e-2);
    type OsmoticPermeability = Real(final quantity = "OsmoticPermeability", final unit = "m3/(Pa.s)", displayUnit = "ml/(mmHg.min)", nominal = 1e-6 / (133.322387415 * 60), min = 0);
    type HydraulicConductance = Real(final quantity = "HydraulicConductance", final unit = "m3/(Pa.s)", displayUnit = "ml/(mmHg.min)", nominal = 1e-6 / (133.322387415 * 60), min = 0);
    type HydraulicResistance = Real(final quantity = "HydraulicConductance", final unit = "(Pa.s)/m3", displayUnit = "(mmHg.min)/ml", nominal = 1e+6 * 133.322387415 * 60, min = 0);
    type HydraulicCompliance = Real(final quantity = "HydraulicCompliance", final unit = "m3/Pa", displayUnit = "ml/mmHg", nominal = 1e-6 / 133.322387415);
    type HydraulicElastance = Real(final quantity = "HydraulicElastance", final unit = "Pa/m3", displayUnit = "mmHg/ml", nominal = 133.322387415 / 1e-6);
    type HydraulicInertance = Real(final quantity = "HydraulicInertance", final unit = "Pa.s2/m3", displayUnit = "mmHg.min2/ml", nominal = 133.322387415 * 60 ^ 2 / 1e-6);
    type Population = Real(final quantity = "Population", final unit = "1", displayUnit = "1", min = 0) "Average number of population individuals";
    type PopulationChange = Real(final quantity = "PopulationChange", final unit = "1/s", displayUnit = "1/d") "Average change of population individuals";
    type PopulationChangePerMember = Real(final quantity = "PopulationChangePerMember", final unit = "1/s", displayUnit = "1/d") "Average change per population individual";

    package FilesUtilities  "File input/output/test" 
      extends Types.Utilities;
      extends Modelica.Icons.VariantsPackage;
      constant String directoryName = "io";
      constant String inputFileName = "input.txt" "File to load values with (non-)SI units";
      constant String outputFileName = "output.txt" "File to save values with (non-)SI units";
      constant String comparisonFileName = "comparison.txt" "File to save comparison from loaded values and simulation results with (non-)SI units";
      constant String inputSIFileName = "input_SI.txt" "File to load values in SI units";
      constant String outputSIFileName = "output_SI.txt" "File to save values in SI units";
      constant String comparisonSIFileName = "comparison_SI.txt" "File to save comparison in SI units from loaded values and simulation results";

      redeclare function extends readReal  
      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer lineLen;
        Integer iline = 1;
        Boolean found = false;
        Boolean endOfFile = false;
        String str;
        Real inputValue;
        Integer typeDef;
      algorithm
        fn := directoryName + "/" + inputFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          .Modelica.Utilities.Streams.error("readRealParameter(\"" + name + "\", \"" + fn + "\")  Error: the file does not exist.\n");
        else
          typeDef := UnitConversions.findUnit(storeUnit, unitConversions);
          (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline);
          while not found and not endOfFile loop
            if line == name then
              (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline + 1);
              lineLen := .Modelica.Utilities.Strings.length(line);
              nextIndex := 1;
              (inputValue, nextIndex) := .Modelica.Utilities.Strings.scanReal(line, nextIndex);
              nextIndex := .Modelica.Utilities.Strings.Advanced.skipWhiteSpace(line, nextIndex);
              if nextIndex > lineLen then
                if .Modelica.Utilities.Strings.length(unitConversions[typeDef].DisplayUnit) > 0 then
                  .Modelica.Utilities.Streams.error("No units detected for variable '" + name + "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                else
                end if;
              else
                str := .Modelica.Utilities.Strings.substring(line, .Modelica.Utilities.Strings.Advanced.skipWhiteSpace(line, nextIndex), .Modelica.Utilities.Strings.length(line));
                if str <> unitConversions[typeDef].DisplayUnit then
                  .Modelica.Utilities.Streams.error("Units '" + str + "' not expected for variable '" + name + "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                else
                end if;
              end if;
              value := inputValue * unitConversions[typeDef].Scale + unitConversions[typeDef].Offset;
              found := true;
            else
              iline := iline + 2;
              (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline);
            end if;
          end while;
          if not found then
            .Modelica.Utilities.Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
          else
          end if;
        end if;
      end readReal;

      redeclare function extends readReal_SI  
      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer iline = 1;
        Boolean found = false;
        Boolean endOfFile = false;
      algorithm
        fn := directoryName + "/" + inputSIFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          .Modelica.Utilities.Streams.error("readRealParameter(\"" + name + "\", \"" + fn + "\")  Error: the file does not exist.\n");
        else
          (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline);
          while not found and not endOfFile loop
            if line == name then
              (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline + 1);
              nextIndex := 1;
              (value, nextIndex) := .Modelica.Utilities.Strings.scanReal(line, nextIndex);
              found := true;
            else
              iline := iline + 2;
              (line, endOfFile) := .Modelica.Utilities.Streams.readLine(fn, iline);
            end if;
          end while;
          if not found then
            .Modelica.Utilities.Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
          else
          end if;
        end if;
      end readReal_SI;

      redeclare function extends readBoolean  
      algorithm
        value := readReal(name, "") > 0.005;
      end readBoolean;

      redeclare function extends writeReal  "Write the value to file" 
      protected
        String fn;
        Integer typeDef "Variable type";
      algorithm
        fn := directoryName + "/" + outputFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist(directoryName) then
            .Modelica.Utilities.Files.createDirectory(directoryName);
          else
          end if;
        else
        end if;
        typeDef := UnitConversions.findUnit(storeUnit, unitConversions);
        .Modelica.Utilities.Streams.print(name + "\n" + String((value - unitConversions[typeDef].Offset) / unitConversions[typeDef].Scale) + " " + unitConversions[typeDef].DisplayUnit, fn);
      end writeReal;

      redeclare function extends writeReal_SI  "Write the value to file using SI unit" 
      protected
        String fn;
        Integer typeDef "Variable type";
      algorithm
        fn := directoryName + "/" + outputSIFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist(directoryName) then
            .Modelica.Utilities.Files.createDirectory(directoryName);
          else
          end if;
        else
        end if;
        .Modelica.Utilities.Streams.print(name + "\n" + String(value), fn);
      end writeReal_SI;

      redeclare function extends writeBoolean  
      protected
        String fn;
      algorithm
        fn := directoryName + "/" + outputFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist(directoryName) then
            .Modelica.Utilities.Files.createDirectory(directoryName);
          else
          end if;
        else
        end if;
        .Modelica.Utilities.Streams.print(name + "\n" + String(if value then 1 else 0), fn);
      end writeBoolean;

      redeclare function extends writeComparison  "Compare and write the result and the value to file" 
      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
        Integer typeDef "Variable output units";
      algorithm
        fn := directoryName + "/" + comparisonFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist("output") then
            .Modelica.Utilities.Files.createDirectory("output");
          else
          end if;
        else
        end if;
        typeDef := UnitConversions.findUnit(storeUnit, unitConversions);
        outputDefaultValue := (defaultValue - unitConversions[typeDef].Offset) / unitConversions[typeDef].Scale;
        outputInitialValue := (initialValue - unitConversions[typeDef].Offset) / unitConversions[typeDef].Scale;
        outputFinalValue := (finalValue - unitConversions[typeDef].Offset) / unitConversions[typeDef].Scale;
        .Modelica.Utilities.Streams.print((if abs(outputDefaultValue) > Modelica.Constants.eps then String(abs((outputFinalValue - outputDefaultValue) / outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) + " ; " + name + " : default=" + String(outputDefaultValue) + " " + unitConversions[typeDef].DisplayUnit + ", initial=" + String(outputInitialValue) + " " + unitConversions[typeDef].DisplayUnit + ", final=" + String(outputFinalValue) + " " + unitConversions[typeDef].DisplayUnit, fn);
      end writeComparison;

      redeclare function extends writeComparison_SI  "Compare and write the result and the value to file using SI units" 
      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn := directoryName + "/" + comparisonSIFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist("output") then
            .Modelica.Utilities.Files.createDirectory("output");
          else
          end if;
        else
        end if;
        outputDefaultValue := defaultValue;
        outputInitialValue := initialValue;
        outputFinalValue := finalValue;
        .Modelica.Utilities.Streams.print((if abs(outputDefaultValue) > Modelica.Constants.eps then String(abs((outputFinalValue - outputDefaultValue) / outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) + " ; " + name + " : default=" + String(outputDefaultValue) + ", initial=" + String(outputInitialValue) + ", final=" + String(outputFinalValue), fn);
      end writeComparison_SI;

      redeclare function extends writeBooleanComparison  "Compare and write the result and the value to file" 
      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn := directoryName + "/" + comparisonFileName;
        if not .Modelica.Utilities.Files.exist(fn) then
          if not .Modelica.Utilities.Files.exist("output") then
            .Modelica.Utilities.Files.createDirectory("output");
          else
          end if;
        else
        end if;
        if defaultValue == finalValue then
          .Modelica.Utilities.Streams.print("0 ; " + name + " : default=" + String(if defaultValue then 1 else 0) + ", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
        else
          .Modelica.Utilities.Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) + ", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
        end if;
      end writeBooleanComparison;
    end FilesUtilities;

    package Utilities  "Value input/output/test support" 
      extends Modelica.Icons.BasesPackage;

      replaceable function readReal  "Read the real value of parameter from file with lines in format:
        <parameterName>
        <value> <unit>" 
        extends Modelica.Icons.Function;
        input String name "Name of parameter";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef "Unit conversions";
        output Real value = 0 "Actual value of parameter in SI units";
      end readReal;

      replaceable function readReal_SI  "Read the real value in SI units of parameter from file with lines in format:
        <parameterName>\\\\n<value>" 
        extends Modelica.Icons.Function;
        input String name "Name of parameter";
        output Real value = 0 "Actual value of parameter in SI units";
      end readReal_SI;

      replaceable function readBoolean  "Read the boolean value of parameter from file with lines in format:
        <parameterName>
        <value> <unit>" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        output Boolean value "Variable value";
      end readBoolean;

      replaceable function writeReal  "Write the real value to file" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Real value "Variable value";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef "Unit conversions";
      end writeReal;

      replaceable function writeReal_SI  "Write the real value using SI unit to file" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Real value "Variable value";
      end writeReal_SI;

      replaceable function writeBoolean  "Write the boolean value to file" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Boolean value "Variable value";
      end writeBoolean;

      replaceable function writeComparison  "Compare and write the result and the value to file" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Real defaultValue "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef "Unit conversions";
      end writeComparison;

      replaceable function writeComparison_SI  "Compare and write the result and the value to file using SI units" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Real defaultValue "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";
      end writeComparison_SI;

      replaceable function writeBooleanComparison  "Compare and write the result and the value to file" 
        extends Modelica.Icons.Function;
        input String name "Variable name";
        input Boolean defaultValue "Original value[in SIunits] to compare with final value";
        input Boolean initialValue "Initial variable value[in SI units]";
        input Boolean finalValue "Final variable value[in SI units]";
      end writeBooleanComparison;

      package UnitConversions  "Conversions non-SI units at input/output" 
        function findUnit  
          input String unitToFind "display unit to find in unitConversions";
          input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef "Unit conversions";
          output Integer typeDef "index in unitConversions";
        algorithm
          typeDef := 0;
          for i in 1:size(unitConversions, 1) loop
            if unitConversions[i].DisplayUnit == unitToFind then
              typeDef := i;
              break;
            else
            end if;
          end for;
          if typeDef == 0 then
            Modelica.Utilities.Streams.print("Unit \"" + unitToFind + "\" not defined. Do not hesitate to contact me. marek@matfyz.cz\n");
          else
          end if;
        end findUnit;

        record RealTypeRecord  "The Real Type definition" 
          parameter String Quantity = "" "Quantity";
          parameter String Unit = "1" "SI unit";
          parameter String DisplayUnit = "" "Display unit";
          parameter Real Scale = 1 "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
          parameter Real Offset = 0 "Offset from display unit to SI unit such that x <d> = x*s+o <u>";
          parameter Real Min = -Modelica.Constants.inf "minimal value";
          parameter Real Max = +Modelica.Constants.inf;
          parameter Real Start = Offset;
          parameter Real Nominal = Scale;
          parameter StateSelect StateSelection = StateSelect.default;
        end RealTypeRecord;

        constant RealTypeRecord[:] RealTypeDef = {RealTypeRecord(), RealTypeRecord(), RealTypeRecord(Quantity = "pH", Unit = "log10(mol/l)", DisplayUnit = "log10(mol/l)", Scale = 1), RealTypeRecord(Quantity = "Energy", Unit = "J", DisplayUnit = "kcal", Scale = 4186.8), RealTypeRecord(Quantity = "Time", Unit = "s", DisplayUnit = "min", Scale = 60), RealTypeRecord(Quantity = "Frequency", Unit = "1/s", DisplayUnit = "Hz", Scale = 1), RealTypeRecord(Quantity = "Frequency", Unit = "1/s", DisplayUnit = "1/min", Scale = 1 / 60), RealTypeRecord(Quantity = "Mass", Unit = "kg", Min = 0, DisplayUnit = "g", Scale = 1e-3), RealTypeRecord(Quantity = "Mass", Unit = "kg", Min = 0, DisplayUnit = "mg", Scale = 1e-6), RealTypeRecord(Quantity = "MassFlowRate", Unit = "kg/s", DisplayUnit = "mg/min", Scale = 1e-6 / 60), RealTypeRecord(Quantity = "MassFlowRate", Unit = "kg/s", DisplayUnit = "g/min", Scale = 1e-3 / 60), RealTypeRecord(Quantity = "Density", Unit = "kg/m3", Min = 0, DisplayUnit = "kg/l", Scale = 1e3), RealTypeRecord(Quantity = "Density", Unit = "kg/m3", Min = 0, DisplayUnit = "g/l", Scale = 1), RealTypeRecord(Quantity = "MassConcentration", Unit = "kg/m3", Min = 0, DisplayUnit = "mg/l", Scale = 1e-3), RealTypeRecord(Quantity = "MassConcentration", Unit = "kg/m3", Min = 0, DisplayUnit = "mg/dl", Scale = 1e-6 / 1e-4), RealTypeRecord(Quantity = "MassConcentration", Unit = "kg/m3", Min = 0, DisplayUnit = "ng/l", Scale = 1e-12 / 1e-3), RealTypeRecord(Quantity = "MassConcentration", Unit = "kg/m3", Min = 0, DisplayUnit = "ng/dl", Scale = 1e-12 / 1e-4), RealTypeRecord(Quantity = "MassConcentration", Unit = "kg/m3", Min = 0, DisplayUnit = "ng/ml", Scale = 1e-12 / 1e-6), RealTypeRecord(Quantity = "Length", Unit = "m", DisplayUnit = "cm", Scale = 1e-2), RealTypeRecord(Quantity = "Velocity", Unit = "m/s", DisplayUnit = "MPH", Scale = 0.44704), RealTypeRecord(Quantity = "Acceleration", Unit = "m/s2", DisplayUnit = "m/s2", Scale = 1), RealTypeRecord(Quantity = "Pressure", Unit = "Pa", DisplayUnit = "mmHg", Scale = 101325 / 760), RealTypeRecord(Quantity = "Volume", Unit = "m3", DisplayUnit = "ml", Scale = 1e-6), RealTypeRecord(Quantity = "VolumeFlowRate", Unit = "m3/s", DisplayUnit = "ml/min", Scale = 1e-6 / 60), RealTypeRecord(Quantity = "Concentration", Unit = "mol/m3", DisplayUnit = "mol/l", Scale = 1e+3), RealTypeRecord(Quantity = "Concentration", Unit = "mol/m3", DisplayUnit = "mmol/l", Scale = 1), RealTypeRecord(Quantity = "Concentration", Unit = "mol/m3", DisplayUnit = "pmol/l", Scale = 1e-12 / 1e-3), RealTypeRecord(Quantity = "Concentration", Unit = "mol/m3", DisplayUnit = "uU_Insulin/ml", Scale = 6.622e-9), RealTypeRecord(Quantity = "Concentration", Unit = "mol/m3", DisplayUnit = "U_EPO/l", Scale = 0.45e-9), RealTypeRecord(Quantity = "AmountOfSubstance", Unit = "mol", DisplayUnit = "mmol", Scale = 1e-3), RealTypeRecord(Quantity = "AmountOfSubstance", Unit = "mol", DisplayUnit = "osm", Scale = 1), RealTypeRecord(Quantity = "AmountOfSubstance", Unit = "mol", DisplayUnit = "mosm", Scale = 1e-3), RealTypeRecord(Quantity = "MolarFlowRate", Unit = "mol/s", DisplayUnit = "mmol/min", Scale = 1e-3 / 60), RealTypeRecord(Quantity = "MolarFlowRate", Unit = "mol/s", DisplayUnit = "ml_STP/min", Scale = 1 / 1362657.193569), RealTypeRecord(Quantity = "Energy", Unit = "J", DisplayUnit = "kcal", Scale = 4186.8), RealTypeRecord(Quantity = "ThermodynamicTemperature", Unit = "K", DisplayUnit = "K", Scale = 1, Start = 310.15), RealTypeRecord(Quantity = "ThermodynamicTemperature", Unit = "K", DisplayUnit = "degC", Scale = 1, Offset = 273.15, Start = 310.15), RealTypeRecord(Quantity = "Power", Unit = "W", DisplayUnit = "W", Scale = 1), RealTypeRecord(Quantity = "Power", Unit = "W", DisplayUnit = "kcal/min", Scale = 4186.8 / 60), RealTypeRecord(Quantity = "Power", Unit = "W", DisplayUnit = "cal/min", Scale = 4.1868 / 60), RealTypeRecord(Quantity = "ThermalConductance", Unit = "W/K", DisplayUnit = "kcal/(min.degC)", Scale = 4186.8 / 60), RealTypeRecord(Quantity = "SpecificHeatCapacity", Unit = "J/(kg.K)", DisplayUnit = "kcal/(degC.kg)", Scale = 4186.8), RealTypeRecord(Quantity = "SpecificEnergy", Unit = "J/kg", DisplayUnit = "kcal/kg", Scale = 4186.8), RealTypeRecord(Quantity = "ElectricPotential", Unit = "V", DisplayUnit = "mV", Scale = 1e-3), RealTypeRecord(Quantity = "ElectricCharge", Unit = "C", DisplayUnit = "meq", Scale = 1e-3 * (9.64853399 * 10 ^ 4)), RealTypeRecord(Quantity = "VolumeDensityOfCharge", Unit = "C/m3", DisplayUnit = "meq/l", Scale = 1e-3 * (9.64853399 * 10 ^ 4) / 1e-3), RealTypeRecord(Quantity = "VolumeDensityOfCharge", Unit = "C/m3", DisplayUnit = "eq/l", Scale = 9.64853399 * 10 ^ 4 / 1e-3), RealTypeRecord(Quantity = "ElectricCurrent", Unit = "A", DisplayUnit = "meq/min", Scale = 1e-3 * (9.64853399 * 10 ^ 4) / 60), RealTypeRecord(Quantity = "Fraction", Unit = "1", DisplayUnit = "%", Scale = 1e-2), RealTypeRecord(Quantity = "OsmoticMembramePermeability", Unit = "m6/(mol.s)", DisplayUnit = "ml/(mOsmol.min)", Scale = 1e-6 / (1e-3 * 60)), RealTypeRecord(Quantity = "DiffusionMembranePermeability", Unit = "m3/s", DisplayUnit = "ml/min", Scale = 1e-3 / 60), RealTypeRecord(Quantity = "HydraulicConductance", Unit = "m3/(Pa.s)", DisplayUnit = "ml/(mmHg.min)", Scale = 1e-6 / (101325 / 760 * 60)), RealTypeRecord(Quantity = "HydraulicCompliance", Unit = "m3/Pa", DisplayUnit = "ml/mmHg", Scale = 1e-6 / (101325 / 760)), RealTypeRecord(Quantity = "HydraulicInertance", Unit = "Pa.s2/m3", DisplayUnit = "mmHg.min2/ml", Scale = 101325 / 760 * 60 ^ 2 / 1e-6), RealTypeRecord(Quantity = "GasSolubility", Unit = "mol/(m3.Pa)", DisplayUnit = "mmol/(l.mmHg)", Scale = 1e-3 / (1e-3 * (101325 / 760))), RealTypeRecord(Quantity = "Osmolarity", Unit = "mol/m3", DisplayUnit = "mosm/l", Scale = 1), RealTypeRecord(Quantity = "Osmolarity", Unit = "mol/m3", DisplayUnit = "osm/l", Scale = 1000), RealTypeRecord(Quantity = "MolarEnergy", Unit = "J/mol", DisplayUnit = "kcal/mol", Scale = 4186.8), RealTypeRecord(Quantity = "Pharmacology Concentration", Unit = "1/m3", DisplayUnit = "iu/l", Scale = 1000), RealTypeRecord(Quantity = "Pharmacology Concentration", Unit = "1/m3", DisplayUnit = "uiu/ml", Scale = 1), RealTypeRecord(Quantity = "PopulationChange", Unit = "1/s", DisplayUnit = "1/min", Scale = 1 / 60), RealTypeRecord(Quantity = "PopulationChange", Unit = "1/s", DisplayUnit = "1/d", Scale = 1 / (60 * 60 * 24))} "All defined Real types - units, displayUnits, conversions, nominals";
      end UnitConversions;
    end Utilities;

    type SimulationType = enumeration(NoInit "Use start values only as a guess of state values", NormalInit "Initialization by start values", ReadInit "Initialization by function Utilities.readReal('state name')", InitSteadyState "Initialization in Steady State (initial derivations are zeros)", SteadyState "Steady State = Derivations are zeros during simulation") "Initialization or Steady state options (to determine model type before simulating)" annotation(Evaluate = true);
  end Types;

  package Blocks  "Base Signal Blocks Library" 
    extends Modelica.Icons.Package;

    package Math  "Modelica.Math extension" 
      extends Modelica.Icons.Package;

      model Integrator  "Integrator with support of steady state calculation." 
        extends SteadyStates.Interfaces.SteadyState(state_start = y_start, state(nominal = NominalValue));
        parameter Real k = 1 "Integrator gain";
        parameter Real y_start = 0 "Initial or guess value of output (= state)";
        extends Modelica.Blocks.Interfaces.SISO(u(nominal = NominalValue / k), y(nominal = NominalValue));
        parameter Real NominalValue = 1 "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set." annotation(HideResult = true);
      equation
        state = y;
        change = k * u;
      end Integrator;

      block Power  "b ^ u" 
        parameter Boolean useBaseInput = false "=true, if exponential base input is used instead of parameter Base" annotation(Evaluate = true, HideResult = true);
        parameter Real Base = 10 "exponential base if useBaseInput=false";
        Modelica.Blocks.Interfaces.RealOutput y;
        Modelica.Blocks.Interfaces.RealInput base(start = Base) = b if useBaseInput;
        Modelica.Blocks.Interfaces.RealInput exponent;
      protected
        Real b "Current exponential base";
      equation
        if not useBaseInput then
          b = Base;
        end if;
        y = b ^ exponent;
      end Power;
    end Math;

    package Interpolation  "Empirical Dependence of Two Variables" 
      extends Modelica.Icons.Package;

      function Spline  "Cubic spline interpolation function" 
        input Real[:] x "x coordinations of interpolating points";
        input Real[:, 4] a "cubic polynom coefficients of curve segments between interpolating points";
        input Real xVal "input value of x to calculate y value";
        output Real yVal "y value at xVal";
      protected
        Integer index "index of segment";
        Integer n "number of interpolating points";
      algorithm
        if xVal <= x[1] then
          yVal := xVal * a[1, 3] + a[1, 4];
        else
          n := size(x, 1);
          if xVal >= x[n] then
            yVal := xVal * a[n + 1, 3] + a[n + 1, 4];
          else
            index := 2;
            while xVal > x[index] and index < n loop
              index := index + 1;
            end while;
            yVal := ((a[index, 1] * xVal + a[index, 2]) * xVal + a[index, 3]) * xVal + a[index, 4];
          end if;
        end if;
      end Spline;

      function SplineCoefficients  "Cubic spline interpolation coefficients" 
        input Real[:] x "x coordinations of interpolating points";
        input Real[:] y "y coordinations of interpolating points";
        input Real[:] slope "slopes at interpolating points";
        output Real[size(x, 1) + 1, 4] a "cubic polynom coefficients of curve segments between interpolating points";
      protected
        Integer n "number of interpolating points";
        Integer i "index of segment";
        Real x1 "previos point";
        Real x2 "current point";
        Real y1 "previous point";
        Real y2 "current point";
        Real slope1 "previous point";
        Real slope2 "current point";
      algorithm
        n := size(x, 1);
        for i in 2:n loop
          x1 := x[i - 1];
          x2 := x[i];
          y1 := y[i - 1];
          y2 := y[i];
          slope1 := slope[i - 1];
          slope2 := slope[i];
          a[i, 1] := -((-x2 * slope2) - x2 * slope1 + x1 * slope2 + x1 * slope1 + 2 * y2 - 2 * y1) / (x2 - x1) ^ 3;
          a[i, 2] := ((-x2 ^ 2 * slope2) - 2 * x2 ^ 2 * slope1 - 3 * x2 * y1 + x2 * slope1 * x1 + 3 * x2 * y2 - x2 * slope2 * x1 - 3 * y1 * x1 + slope1 * x1 ^ 2 + 3 * y2 * x1 + 2 * slope2 * x1 ^ 2) / (x2 - x1) ^ 3;
          a[i, 3] := -((-slope1 * x2 ^ 3) - 2 * x2 ^ 2 * slope2 * x1 - x2 ^ 2 * slope1 * x1 + x2 * slope2 * x1 ^ 2 + 2 * x2 * slope1 * x1 ^ 2 + 6 * x2 * x1 * y2 - 6 * x2 * x1 * y1 + slope2 * x1 ^ 3) / (x2 - x1) ^ 3;
          a[i, 4] := ((-slope1 * x2 ^ 3 * x1) + y1 * x2 ^ 3 - slope2 * x1 ^ 2 * x2 ^ 2 + slope1 * x1 ^ 2 * x2 ^ 2 - 3 * y1 * x2 ^ 2 * x1 + 3 * y2 * x1 ^ 2 * x2 + slope2 * x1 ^ 3 * x2 - y2 * x1 ^ 3) / (x2 - x1) ^ 3;
        end for;
        a[1, :] := {0, 0, slope[1], y[1] - x[1] * slope[1]};
        a[n + 1, :] := {0, 0, slope[n], y[n] - x[n] * slope[n]};
      end SplineCoefficients;
    end Interpolation;

    package Factors  "Multiplication Effects" 
      extends Modelica.Icons.Package;

      model Normalization  "effect = u/NormalValue" 
        extends Icons.BaseFactorIcon;
        parameter Real NormalValue = 1 "Normal value of u, because y=(u/NormalValue)*yBase.";
        parameter Boolean enabled = true "disabled => y=yBase";
        Modelica.Blocks.Interfaces.RealInput u;
        Types.Fraction effect;
      equation
        effect = if enabled then u / NormalValue else 1;
        y = effect * yBase;
      end Normalization;

      model Spline  "effect = spline(data,u)" 
        extends Icons.BaseFactorIcon4;
        Modelica.Blocks.Interfaces.RealInput u(nominal = Xscale);
        parameter Boolean enabled = true "disabled => y=yBase";
        parameter Real[:, 3] data "Array of interpolating points as {x,y,slope}";
        parameter Real Xscale = 1 "conversion scale to SI unit of x values";
        parameter Real Yscale = 1 "conversion scale to SI unit of y values";
        parameter Boolean UsePositiveLog10 = false "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";
        Types.Fraction effect "Multiplication coeffecient for yBase to reach y";
      protected
        parameter Real[:, :] a = if enabled then Interpolation.SplineCoefficients(data[:, 1], data[:, 2] * Yscale, data[:, 3] * Yscale) else zeros(1, 1) "Cubic polynom coefficients of curve segments between interpolating points";
      equation
        effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1], a, if u / Xscale <= 1 then 0 else log10(u / Xscale)) else Interpolation.Spline(data[:, 1], a, u / Xscale);
        y = effect * yBase;
      end Spline;

      model SplineLag  "Adapt the effect after interpolation" 
        extends Icons.BaseFactorIcon3;
        Modelica.Blocks.Interfaces.RealInput u;
        parameter Boolean enabled = true "disabled => y=yBase";
        parameter Types.Time HalfTime(displayUnit = "d");
        parameter String stateName = getInstanceName() "Name in Utilities input/output function" annotation(Evaluate = true, HideResult = true);
        parameter Real Xscale = 1 "conversion scale to SI unit of x values";
        parameter Boolean UsePositiveLog10 = false "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";
        parameter Real[:, 3] data;
        Modelica.Blocks.Math.Product product;
        Blocks.Math.Integrator integrator(y_start = 1, k = Modelica.Math.log(2) / HalfTime, stateName = stateName);
        Modelica.Blocks.Math.Feedback feedback;
        Types.Fraction effect;
        Spline spline(data = data, Xscale = Xscale, UsePositiveLog10 = UsePositiveLog10, enabled = enabled);
        Types.Constants.FractionConst fraction(k(displayUnit = "1") = 1);
      equation
        effect = integrator.y;
        connect(yBase, product.u1);
        connect(product.y, y);
        connect(feedback.y, integrator.u);
        connect(integrator.y, feedback.u2);
        connect(integrator.y, product.u2);
        connect(feedback.u1, spline.y);
        connect(u, spline.u);
        connect(fraction.y, spline.yBase);
      end SplineLag;
    end Factors;
  end Blocks;

  package Chemical  "Please use 'Chemical' library instead!" 
    extends Modelica.Icons.Package;

    package Components  
      extends Modelica.Icons.Package;

      model Substance  "Substance accumulation in solution" 
        extends Icons.Substance;
        extends Interfaces.ConditionalVolume;
        extends SteadyStates.Interfaces.SteadyState(state(nominal = NominalSolute), change(nominal = NominalSolute / 60), state_start = solute_start, storeUnit = "mmol");
        parameter Types.AmountOfSubstance solute_start(nominal = NominalSolute) = 1e-8 "Initial solute amount in compartment" annotation(HideResult = true);
        Types.RealIO.AmountOfSubstanceOutput solute(nominal = NominalSolute) "Current amount of solute";
        parameter Types.AmountOfSubstance NominalSolute = 0.001 "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller." annotation(HideResult = true);
        Interfaces.ChemicalPort_b q_out(conc(start = solute_start / NormalVolume)) "Concentration and molar flow from/to compartment";
        parameter Types.MolarEnergy dH = 0 "Standard Enthalpy Change" annotation(HideResult = true);
        Types.RealIO.EnergyOutput internalHeat "Internal heat energy = enthalpy*amountOfSubstance";
      equation
        q_out.conc = solute / volume;
        state = solute;
        change = q_out.q;
        internalHeat = dH * solute;
      end Substance;
    end Components;

    package Sensors  
      extends Modelica.Icons.SensorsPackage;

      model ConcentrationMeasure  "Measure of molar concentration" 
        extends Modelica.Icons.RotationalSensor;
        Interfaces.ChemicalPort_a q_in "For measure only";
        Types.RealIO.ConcentrationOutput concentration "Concentration";
      equation
        concentration = q_in.conc;
        q_in.q = 0;
      end ConcentrationMeasure;
    end Sensors;

    package Sources  
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedSolutePump  "Molar pump of solute to system" 
        extends Interfaces.ConditionalSoluteFlow;
        Interfaces.ChemicalPort_b q_out "Outflow";
      equation
        q_out.q = -q;
      end UnlimitedSolutePump;

      model UnlimitedSolutePumpOut  "Molar pump of solute out of system" 
        extends Interfaces.ConditionalSoluteFlow;
        Interfaces.ChemicalPort_a q_in "Inflow";
      equation
        q_in.q = q;
      end UnlimitedSolutePumpOut;
    end Sources;

    package Interfaces  
      extends Modelica.Icons.InterfacesPackage;

      connector ChemicalPort  "Concentration and Solute flow" 
        Types.Concentration conc "Solute concentration";
        flow Types.MolarFlowRate q "Solute flow";
      end ChemicalPort;

      connector ChemicalPort_a  "Concentration and expected positive Solute inflow" 
        extends ChemicalPort;
      end ChemicalPort_a;

      connector ChemicalPort_b  "Concentration and expected negative Solute outflow" 
        extends ChemicalPort;
      end ChemicalPort_b;

      partial model ConditionalVolume  "Chemical processes can be modeled with or without(normalized to 1 liter) variable solution volume" 
        constant Types.Volume NormalVolume = 0.001 "1 liter" annotation(Evaluate = true, HideResult = true);
        parameter Boolean useNormalizedVolume = true "Normalized volume of solution is 1 liter" annotation(Evaluate = true, HideResult = true);
        Types.Volume volume "Solution volume";
        Types.RealIO.VolumeInput solutionVolume = volume if not useNormalizedVolume "Volume of solution";
      equation
        if useNormalizedVolume then
          volume = NormalVolume;
        end if;
      end ConditionalVolume;

      partial model ConditionalSoluteFlow  "Input of solute molar flow vs. parametric solute molar flow" 
        parameter Boolean useSoluteFlowInput = false "=true, if solute flow input is used instead of parameter SoluteFlow" annotation(Evaluate = true, HideResult = true);
        parameter Types.MolarFlowRate SoluteFlow = 0 "Volumetric flow of solute if useSoluteFlowInput=false" annotation(HideResult = not useSoluteFlowInput);
        Types.RealIO.MolarFlowRateInput soluteFlow(start = SoluteFlow) = q if useSoluteFlowInput;
        Types.MolarFlowRate q "Current solute flow";
      equation
        if not useSoluteFlowInput then
          q = SoluteFlow;
        end if;
      end ConditionalSoluteFlow;
    end Interfaces;
  end Chemical;

  package Osmotic  "Please use 'Chemical' library instead!" 
    extends Modelica.Icons.Package;

    package Components  
      extends Modelica.Icons.Package;

      model OsmoticCell  "Solvent container" 
        extends Icons.OsmoticCell;
        extends SteadyStates.Interfaces.SteadyState(state_start = volume_start, storeUnit = "mOsm/l");
        parameter Integer NumberOfMembraneTypes = 1 "Membrane type is determined by membrane permeabilities for substances.";
        Interfaces.OsmoticPort_a[NumberOfMembraneTypes] q_in "Flux to/from osmotic compartment";
        parameter Types.Volume volume_start = 0.001 "Initial volume of compartment";
        parameter Boolean useImpermeableSolutesInput = false "=true, if impermeable substance amount as an input" annotation(Evaluate = true, HideResult = true);
        parameter Types.AmountOfSubstance[NumberOfMembraneTypes] ImpermeableSolutes = zeros(NumberOfMembraneTypes) "Amount of impermeable substance if useImpermeableSolutesInput=false";
        Types.RealIO.AmountOfSubstanceInput[NumberOfMembraneTypes] impermeableSolutes(start = ImpermeableSolutes) = is if useImpermeableSolutesInput "Amount of impermeable solutes in compartment";
        Types.RealIO.VolumeOutput volume "Actual volume of compartment";
      protected
        Types.AmountOfSubstance[NumberOfMembraneTypes] is "Current amount of impermeable solutes";
      equation
        if not useImpermeableSolutesInput then
          is = ImpermeableSolutes;
        end if;
        q_in.o = is / volume;
        change = ones(NumberOfMembraneTypes) * q_in.q;
        state = volume;
      end OsmoticCell;

      model Membrane  "Solvent diffusion through semipermeable membrane" 
        extends Interfaces.OnePort;
        extends Icons.Membrane;
        parameter Boolean useConductanceInput = false "=true, if membrane permeability input is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.OsmoticPermeability cond = 1e-15 "Membrane permeability for solvent if useConductanceInput = false";
        parameter Boolean useHydraulicPressureInputs = false "=true, if hydraulic pressure inputs is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.Pressure HydraulicPressureIn = 0 "Hydraulic pressure inside if useHydraulicPressureInputs=false";
        parameter Types.Pressure HydraulicPressureOut = 0 "Hydraulic pressure outside if useHydraulicPressureInputs=false";
        Types.RealIO.PressureInput hydraulicPressureIn(start = HydraulicPressureIn) = pi if useHydraulicPressureInputs;
        Types.RealIO.PressureInput hydraulicPressureOut(start = HydraulicPressureOut) = po if useHydraulicPressureInputs;
        parameter Boolean useTemperatureInputs = false "=true, if temperature on both sides is used" annotation(Evaluate = true, HideResult = true);
        parameter Types.Temperature T = 310.15 "Temperature on both membrane sides if  useTemperatureInputs=false";
        Types.RealIO.TemperatureInput temperatureIn(start = T) = ti if useTemperatureInputs;
        Types.RealIO.TemperatureInput temperatureOut(start = T) = to if useTemperatureInputs;
        Types.OsmoticPermeability perm;
        Types.Pressure opi "osmotic pressure at q_in";
        Types.Pressure opo "osmotic pressure at q_out";
      protected
        Types.Pressure pi;
        Types.Pressure po;
        Types.Temperature ti;
        Types.Temperature to;
      public
        Types.RealIO.OsmoticPermeabilityInput conduction = perm if useConductanceInput;
      equation
        if not useHydraulicPressureInputs then
          pi = HydraulicPressureIn;
          po = HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          ti = T;
          to = T;
        end if;
        if not useConductanceInput then
          cond = perm;
        end if;
        q_in.q = perm * ((-po) + q_out.o * (Modelica.Constants.R * to) - ((-pi) + q_in.o * (Modelica.Constants.R * ti)));
        opi = q_in.o * (Modelica.Constants.R * ti);
        opo = q_out.o * (Modelica.Constants.R * to);
      end Membrane;

      model SolventFlux  "Prescripted solvent flow" 
        extends Interfaces.OnePort;
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;
      equation
        q_in.q = q;
      end SolventFlux;
    end Components;

    package Sources  
      extends Modelica.Icons.SourcesPackage;

      model SolventInflux  "Prescribed solvent inflow" 
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;
        Interfaces.OsmoticPort_b q_out;
      equation
        q_out.q = -q;
      end SolventInflux;

      model SolventOutflux  "Prescribed solvent outflow" 
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;
        Interfaces.OsmoticPort_a q_in;
      equation
        q_in.q = q;
      end SolventOutflux;
    end Sources;

    package Interfaces  
      extends Modelica.Icons.InterfacesPackage;

      connector OsmoticPort  "Flux through semipermeable membrane by osmotic pressure gradient" 
        Types.Concentration o "Osmolarity is the molar concentration of the impermeable solutes";
        flow Types.VolumeFlowRate q "The flux of the permeable solvent (!not the impermeable solutes!)";
      end OsmoticPort;

      connector OsmoticPort_a  "Influx" 
        extends OsmoticPort;
      end OsmoticPort_a;

      connector OsmoticPort_b  "Outflux" 
        extends OsmoticPort;
      end OsmoticPort_b;

      partial model OnePort  "Osmotic one port" 
        OsmoticPort_a q_in "Forward flux through membrane";
        OsmoticPort_b q_out "Backward flux through membrane";
      equation
        q_in.q + q_out.q = 0;
      end OnePort;
    end Interfaces;
  end Osmotic;
  annotation(version = "2.3.1", versionBuild = 1, versionDate = "2015-09-15", dateModified = "2015-09-15 12:49:00Z"); 
end Physiolibrary;

package ModelicaServices  "ModelicaServices (OpenModelica implementation) - Models and functions used in the Modelica Standard Library requiring a tool specific implementation" 
  extends Modelica.Icons.Package;

  package Machine  
    extends Modelica.Icons.Package;
    final constant Real eps = 1.e-15 "Biggest number such that 1.0 + eps = 1.0";
    final constant Real small = 1.e-60 "Smallest number such that small and -small are representable on the machine";
    final constant Real inf = 1.e+60 "Biggest Real number such that inf and -inf are representable on the machine";
    final constant Integer Integer_inf = OpenModelica.Internal.Architecture.integerMax() "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
  end Machine;
  annotation(Protection(access = Access.hide), version = "3.2.1", versionBuild = 2, versionDate = "2013-08-14", dateModified = "2013-08-14 08:44:41Z"); 
end ModelicaServices;

package Modelica  "Modelica Standard Library - Version 3.2.1 (Build 3)" 
  extends Modelica.Icons.Package;

  package Blocks  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)" 
    extends Modelica.Icons.Package;

    package Continuous  "Library of continuous control blocks with internal states" 
      extends Modelica.Icons.Package;

      block TransferFunction  "Linear transfer function" 
        extends .Modelica.Blocks.Interfaces.SISO;
        parameter Real[:] b = {1} "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
        parameter Real[:] a = {1} "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
        parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" annotation(Evaluate = true);
        parameter Real[size(a, 1) - 1] x_start = zeros(nx) "Initial or guess values of states";
        parameter Real y_start = 0 "Initial value of output (derivatives of y are zero upto nx-1-th derivative)";
        output Real[size(a, 1) - 1] x(start = x_start) "State of transfer function from controller canonical form";
      protected
        parameter Integer na = size(a, 1) "Size of Denominator of transfer function.";
        parameter Integer nb = size(b, 1) "Size of Numerator of transfer function.";
        parameter Integer nx = size(a, 1) - 1;
        parameter Real[:] bb = vector([zeros(max(0, na - nb), 1); b]);
        parameter Real d = bb[1] / a[1];
        parameter Real a_end = if a[end] > 100 * Modelica.Constants.eps * sqrt(a * a) then a[end] else 1.0;
        Real[size(x, 1)] x_scaled "Scaled vector x";
      initial equation
        if initType == .Modelica.Blocks.Types.Init.SteadyState then
          der(x_scaled) = zeros(nx);
        elseif initType == .Modelica.Blocks.Types.Init.InitialState then
          x_scaled = x_start * a_end;
        elseif initType == .Modelica.Blocks.Types.Init.InitialOutput then
          y = y_start;
          der(x_scaled[2:nx]) = zeros(nx - 1);
        end if;
      equation
        assert(size(b, 1) <= size(a, 1), "Transfer function is not proper");
        if nx == 0 then
          y = d * u;
        else
          der(x_scaled[1]) = ((-a[2:na] * x_scaled) + a_end * u) / a[1];
          der(x_scaled[2:nx]) = x_scaled[1:nx - 1];
          y = (bb[2:na] - d * a[2:na]) * x_scaled / a_end + d * u;
          x = x_scaled / a_end;
        end if;
      end TransferFunction;
    end Continuous;

    package Interfaces  "Library of connectors and partial models for input/output blocks" 
      extends Modelica.Icons.InterfacesPackage;
      connector RealInput = input Real "'input Real' as connector";
      connector RealOutput = output Real "'output Real' as connector";
      connector BooleanInput = input Boolean "'input Boolean' as connector";
      connector BooleanOutput = output Boolean "'output Boolean' as connector";

      partial block SISO  "Single Input Single Output continuous control block" 
        extends Modelica.Blocks.Icons.Block;
        RealInput u "Connector of Real input signal";
        RealOutput y "Connector of Real output signal";
      end SISO;

      partial block SI2SO  "2 Single Input / 1 Single Output continuous control block" 
        extends Modelica.Blocks.Icons.Block;
        RealInput u1 "Connector of Real input signal 1";
        RealInput u2 "Connector of Real input signal 2";
        RealOutput y "Connector of Real output signal";
      end SI2SO;

      partial block MISO  "Multiple Input Single Output continuous control block" 
        extends Modelica.Blocks.Icons.Block;
        parameter Integer nin = 1 "Number of inputs";
        RealInput[nin] u "Connector of Real input signals";
        RealOutput y "Connector of Real output signal";
      end MISO;

      partial block partialBooleanThresholdComparison  "Partial block to compare the Real input u with a threshold and provide the result as 1 Boolean output signal" 
        parameter Real threshold = 0 "Comparison with respect to threshold";
        Blocks.Interfaces.RealInput u "Connector of Boolean input signal";
        Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal";
      end partialBooleanThresholdComparison;
    end Interfaces;

    package Logical  "Library of components with Boolean input and output signals" 
      extends Modelica.Icons.Package;

      block GreaterThreshold  "Output y is true, if input u is greater than threshold" 
        extends Blocks.Interfaces.partialBooleanThresholdComparison;
      equation
        y = u > threshold;
      end GreaterThreshold;

      block Switch  "Switch between two Real signals" 
        extends Modelica.Blocks.Icons.PartialBooleanBlock;
        Blocks.Interfaces.RealInput u1 "Connector of first Real input signal";
        Blocks.Interfaces.BooleanInput u2 "Connector of Boolean input signal";
        Blocks.Interfaces.RealInput u3 "Connector of second Real input signal";
        Blocks.Interfaces.RealOutput y "Connector of Real output signal";
      equation
        y = if u2 then u1 else u3;
      end Switch;
    end Logical;

    package Math  "Library of Real mathematical functions as input/output blocks" 
      extends Modelica.Icons.Package;

      block Gain  "Output the product of a gain value with the input signal" 
        parameter Real k(start = 1, unit = "1") "Gain value multiplied with input signal";
        .Modelica.Blocks.Interfaces.RealInput u "Input signal connector";
        .Modelica.Blocks.Interfaces.RealOutput y "Output signal connector";
      equation
        y = k * u;
      end Gain;

      block Sum  "Output the sum of the elements of the input vector" 
        extends .Modelica.Blocks.Interfaces.MISO;
        parameter Real[nin] k = ones(nin) "Optional: sum coefficients";
      equation
        y = k * u;
      end Sum;

      block Feedback  "Output difference between commanded and feedback input" 
        .Modelica.Blocks.Interfaces.RealInput u1;
        .Modelica.Blocks.Interfaces.RealInput u2;
        .Modelica.Blocks.Interfaces.RealOutput y;
      equation
        y = u1 - u2;
      end Feedback;

      block Add  "Output the sum of the two inputs" 
        extends .Modelica.Blocks.Interfaces.SI2SO;
        parameter Real k1 = +1 "Gain of upper input";
        parameter Real k2 = +1 "Gain of lower input";
      equation
        y = k1 * u1 + k2 * u2;
      end Add;

      block Add3  "Output the sum of the three inputs" 
        extends Modelica.Blocks.Icons.Block;
        parameter Real k1 = +1 "Gain of upper input";
        parameter Real k2 = +1 "Gain of middle input";
        parameter Real k3 = +1 "Gain of lower input";
        .Modelica.Blocks.Interfaces.RealInput u1 "Connector 1 of Real input signals";
        .Modelica.Blocks.Interfaces.RealInput u2 "Connector 2 of Real input signals";
        .Modelica.Blocks.Interfaces.RealInput u3 "Connector 3 of Real input signals";
        .Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signals";
      equation
        y = k1 * u1 + k2 * u2 + k3 * u3;
      end Add3;

      block Product  "Output product of the two inputs" 
        extends .Modelica.Blocks.Interfaces.SI2SO;
      equation
        y = u1 * u2;
      end Product;

      block Division  "Output first input divided by second input" 
        extends .Modelica.Blocks.Interfaces.SI2SO;
      equation
        y = u1 / u2;
      end Division;
    end Math;

    package Nonlinear  "Library of discontinuous or non-differentiable algebraic control blocks" 
      extends Modelica.Icons.Package;

      block DeadZone  "Provide a region of zero output" 
        parameter Real uMax(start = 1) "Upper limits of dead zones";
        parameter Real uMin = -uMax "Lower limits of dead zones";
        parameter Boolean deadZoneAtInit = true "= false, if dead zone is ignored during initialization (i.e., y=u)";
        extends .Modelica.Blocks.Interfaces.SISO;
      equation
        assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) + ") < uMin (=" + String(uMin) + ")");
        if initial() and not deadZoneAtInit then
          y = u;
        else
          y = smooth(0, if u > uMax then u - uMax else if u < uMin then u - uMin else 0);
        end if;
      end DeadZone;
    end Nonlinear;

    package Types  "Library of constants and types with choices, especially to build menus" 
      extends Modelica.Icons.TypesPackage;
      type Init = enumeration(NoInit "No initialization (start values are used as guess values with fixed=false)", SteadyState "Steady state initialization (derivatives of states are zero)", InitialState "Initialization with initial states", InitialOutput "Initialization with initial outputs (and steady state of the states if possible)") "Enumeration defining initialization of a block" annotation(Evaluate = true);
    end Types;

    package Icons  "Icons for Blocks" 
      extends Modelica.Icons.IconsPackage;

      partial block Block  "Basic graphical layout of input/output block" end Block;

      partial block PartialBooleanBlock  "Basic graphical layout of logical block" end PartialBooleanBlock;
    end Icons;
  end Blocks;

  package Math  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices" 
    extends Modelica.Icons.Package;

    package Icons  "Icons for Math" 
      extends Modelica.Icons.IconsPackage;

      partial function AxisLeft  "Basic icon for mathematical function with y-axis on left side" end AxisLeft;

      partial function AxisCenter  "Basic icon for mathematical function with y-axis in the center" end AxisCenter;
    end Icons;

    function asin  "Inverse sine (-1 <= u <= 1)" 
      extends Modelica.Math.Icons.AxisCenter;
      input Real u;
      output .Modelica.SIunits.Angle y;
      external "builtin" y = asin(u);
    end asin;

    function exp  "Exponential, base e" 
      extends Modelica.Math.Icons.AxisCenter;
      input Real u;
      output Real y;
      external "builtin" y = exp(u);
    end exp;

    function log  "Natural (base e) logarithm (u shall be > 0)" 
      extends Modelica.Math.Icons.AxisLeft;
      input Real u;
      output Real y;
      external "builtin" y = log(u);
    end log;
  end Math;

  package Utilities  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)" 
    extends Modelica.Icons.Package;

    package Files  "Functions to work with files and directories" 
      extends Modelica.Icons.Package;

      function createDirectory  "Create directory (if directory already exists, ignore call)" 
        extends Modelica.Icons.Function;
        input String directoryName "Name of directory to be created (if present, ignore call)";

      protected
        function existDirectory  "Inquire whether directory exists; if present and not a directory, trigger an error" 
          extends Modelica.Icons.Function;
          input String directoryName;
          output Boolean exists "true if directory exists";
        protected
          Types.FileType fileType = Modelica.Utilities.Internal.FileSystem.stat(directoryName);
        algorithm
          if fileType == Types.FileType.RegularFile or fileType == Types.FileType.SpecialFile then
            Streams.error("Directory \"" + directoryName + "\" cannot be created\n" + "because this is an existing file.");
          elseif fileType == Types.FileType.Directory then
            exists := true;
          else
            exists := false;
          end if;
        end existDirectory;

        function assertCorrectIndex  "Print error, if index to last essential character in directory is wrong" 
          extends Modelica.Icons.Function;
          input Integer index "Index must be > 0";
          input String directoryName "Directory name for error message";
        algorithm
          if index < 1 then
            Streams.error("It is not possible to create the directory\n" + "\"" + directoryName + "\"\n" + "because this directory name is not valid");
          else
          end if;
        end assertCorrectIndex;

        String fullName;
        Integer index;
        Integer oldIndex;
        Integer lastIndex;
        Boolean found;
        Boolean finished;
        Integer nDirectories = 0 "Number of directories that need to be generated";
      algorithm
        if not existDirectory(directoryName) then
          fullName := Files.fullPathName(directoryName);
          index := Strings.length(fullName);
          if Strings.substring(fullName, index, index) == "/" then
            index := index - 1;
            assertCorrectIndex(index, fullName);
          else
          end if;
          lastIndex := index;
          fullName := Strings.substring(fullName, 1, index);
          found := false;
          while not found loop
            oldIndex := index;
            index := Strings.findLast(fullName, "/", startIndex = index);
            if index == 0 then
              index := oldIndex;
              found := true;
            else
              index := index - 1;
              assertCorrectIndex(index, fullName);
              found := existDirectory(Strings.substring(fullName, 1, index));
            end if;
          end while;
          index := oldIndex;
          finished := false;
          while not finished loop
            Modelica.Utilities.Internal.FileSystem.mkdir(Strings.substring(fullName, 1, index));
            if index >= lastIndex then
              finished := true;
            elseif index < lastIndex then
              index := Strings.find(fullName, "/", startIndex = index + 2);
              if index == 0 then
                index := lastIndex;
              else
              end if;
            else
            end if;
          end while;
        else
        end if;
      end createDirectory;

      function exist  "Inquire whether file or directory exists" 
        extends Modelica.Icons.Function;
        input String name "Name of file or directory";
        output Boolean result "= true, if file or directory exists";
      algorithm
        result := Modelica.Utilities.Internal.FileSystem.stat(name) > Types.FileType.NoFile;
      end exist;

      function fullPathName  "Get full path name of file or directory name" 
        extends Modelica.Icons.Function;
        input String name "Absolute or relative file or directory name";
        output String fullName "Full path of 'name'";
        external "C" fullName = ModelicaInternal_fullPathName(name) annotation(Library = "ModelicaExternalC");
      end fullPathName;
    end Files;

    package Streams  "Read from files and write to files" 
      extends Modelica.Icons.Package;

      function print  "Print string to terminal or file" 
        extends Modelica.Icons.Function;
        input String string = "" "String to be printed";
        input String fileName = "" "File where to print (empty string is the terminal)";
        external "C" ModelicaInternal_print(string, fileName) annotation(Library = "ModelicaExternalC");
      end print;

      function readLine  "Reads a line of text from a file and returns it in a string" 
        extends Modelica.Icons.Function;
        input String fileName "Name of the file that shall be read";
        input Integer lineNumber(min = 1) "Number of line to read";
        output String string "Line of text";
        output Boolean endOfFile "If true, end-of-file was reached when trying to read line";
        external "C" string = ModelicaInternal_readLine(fileName, lineNumber, endOfFile) annotation(Library = "ModelicaExternalC");
      end readLine;

      function error  "Print error message and cancel all actions" 
        extends Modelica.Icons.Function;
        input String string "String to be printed to error message window";
        external "C" ModelicaError(string) annotation(Library = "ModelicaExternalC");
      end error;
    end Streams;

    package Strings  "Operations on strings" 
      extends Modelica.Icons.Package;

      function length  "Returns length of string" 
        extends Modelica.Icons.Function;
        input String string;
        output Integer result "Number of characters of string";
        external "C" result = ModelicaStrings_length(string) annotation(Library = "ModelicaExternalC");
      end length;

      function substring  "Returns a substring defined by start and end index" 
        extends Modelica.Icons.Function;
        input String string "String from which a substring is inquired";
        input Integer startIndex(min = 1) "Character position of substring begin (index=1 is first character in string)";
        input Integer endIndex(min = 1) "Character position of substring end";
        output String result "String containing substring string[startIndex:endIndex]";
        external "C" result = ModelicaStrings_substring(string, startIndex, endIndex) annotation(Library = "ModelicaExternalC");
      end substring;

      function repeat  "Repeat a string n times" 
        extends Modelica.Icons.Function;
        input Integer n(min = 0) = 1 "Number of occurrences";
        input String string = " " "String that is repeated";
        output String repeatedString "String containing n concatenated strings";
      algorithm
        repeatedString := "";
        for i in 1:n loop
          repeatedString := repeatedString + string;
        end for;
      end repeat;

      function compare  "Compare two strings lexicographically" 
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive = true "= false, if case of letters is ignored";
        output Modelica.Utilities.Types.Compare result "Result of comparison";
        external "C" result = ModelicaStrings_compare(string1, string2, caseSensitive) annotation(Library = "ModelicaExternalC");
      end compare;

      function isEqual  "Determine whether two strings are identical" 
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive = true "= false, if lower and upper case are ignored for the comparison";
        output Boolean identical "True, if string1 is identical to string2";
      algorithm
        identical := compare(string1, string2, caseSensitive) == Types.Compare.Equal;
      end isEqual;

      function find  "Find first occurrence of a string within another string" 
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min = 1) = 1 "Start search at index startIndex";
        input Boolean caseSensitive = true "= false, if lower and upper case are ignored for the search";
        output Integer index "Index of the beginning of the first occurrence of 'searchString' within 'string', or zero if not present";
      protected
        Integer lengthSearchString = length(searchString);
        Integer len = lengthSearchString - 1;
        Integer i = startIndex;
        Integer i_max = length(string) - lengthSearchString + 1;
      algorithm
        index := 0;
        while i <= i_max loop
          if isEqual(substring(string, i, i + len), searchString, caseSensitive) then
            index := i;
            i := i_max + 1;
          else
            i := i + 1;
          end if;
        end while;
      end find;

      function findLast  "Find last occurrence of a string within another string" 
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min = 0) = 0 "Start search at index startIndex. If startIndex = 0, start at length(string)";
        input Boolean caseSensitive = true "= false, if lower and upper case are ignored for the search";
        output Integer index "Index of the beginning of the last occurrence of 'searchString' within 'string', or zero if not present";
      protected
        Integer lenString = length(string);
        Integer lenSearchString = length(searchString);
        Integer iMax = lenString - lenSearchString + 1;
        Integer i;
      algorithm
        i := if startIndex == 0 or startIndex > iMax then iMax else startIndex;
        index := 0;
        while i >= 1 loop
          if isEqual(substring(string, i, i + lenSearchString - 1), searchString, caseSensitive) then
            index := i;
            i := 0;
          else
            i := i - 1;
          end if;
        end while;
      end findLast;

      function scanReal  "Scan for the next Real number and trigger an assert if not present" 
        extends Modelica.Icons.Function;
        input String string "String to be scanned";
        input Integer startIndex(min = 1) = 1 "Start scanning of string at character startIndex";
        input Boolean unsigned = false "= true, if Real token shall not start with a sign";
        input String message = "" "Message used in error message if scan is not successful";
        output Real number "Value of real number";
        output Integer nextIndex "index of character after the found number";
      algorithm
        (nextIndex, number) := Advanced.scanReal(string, startIndex, unsigned);
        if nextIndex == startIndex then
          nextIndex := Advanced.skipWhiteSpace(string, startIndex);
          if unsigned then
            syntaxError(string, nextIndex, "Expected a Real number without a sign " + message);
          else
            syntaxError(string, nextIndex, "Expected a Real number " + message);
          end if;
        else
        end if;
      end scanReal;

      function syntaxError  "Print an error message, a string and the index at which scanning detected an error" 
        extends Modelica.Icons.Function;
        input String string "String that has an error at position index";
        input Integer index "Index of string at which scanning detected an error";
        input String message = "" "String printed at end of error message";
      protected
        Integer maxIndex = 40;
        Integer maxLenString = 60;
        Integer lenString = length(string);
        String errString;
        Integer index2 = if index < 1 then 1 else if index > lenString then lenString else index;
      algorithm
        if index2 <= maxIndex then
          errString := string;
        else
          errString := "... " + substring(string, index2 - maxIndex, lenString);
          index2 := maxIndex + 5;
        end if;
        if length(errString) > maxLenString then
          errString := substring(errString, 1, maxLenString) + " ...";
        else
        end if;
        Streams.error("Syntax error at character " + String(index) + " of\n" + errString + "\n" + repeat(index2 - 1, " ") + "*" + "\n" + message);
      end syntaxError;

      package Advanced  "Advanced scanning functions" 
        extends Modelica.Icons.Package;

        function scanReal  "Scans a signed real number" 
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min = 1) = 1 "Index where scanning starts";
          input Boolean unsigned = false "= true, if number shall not start with '+' or '-'";
          output Integer nextIndex "Index after the found token (success=true) or index at which scanning failed (success=false)";
          output Real number "Value of Real number";
          external "C" ModelicaStrings_scanReal(string, startIndex, unsigned, nextIndex, number) annotation(Library = "ModelicaExternalC");
        end scanReal;

        function skipWhiteSpace  "Scans white space" 
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min = 1) = 1;
          output Integer nextIndex;
          external "C" nextIndex = ModelicaStrings_skipWhiteSpace(string, startIndex) annotation(Library = "ModelicaExternalC");
        end skipWhiteSpace;
      end Advanced;
    end Strings;

    package Types  "Type definitions used in package Modelica.Utilities" 
      extends Modelica.Icons.TypesPackage;
      type Compare = enumeration(Less "String 1 is lexicographically less than string 2", Equal "String 1 is identical to string 2", Greater "String 1 is lexicographically greater than string 2") "Enumeration defining comparison of two strings";
      type FileType = enumeration(NoFile "No file exists", RegularFile "Regular file", Directory "Directory", SpecialFile "Special file (pipe, FIFO, device, etc.)") "Enumeration defining the type of a file";
    end Types;

    package Internal  "Internal components that a user should usually not directly utilize" 
      extends Modelica.Icons.InternalPackage;

      package FileSystem  "Internal package with external functions as interface to the file system" 
        extends Modelica.Icons.InternalPackage;

        function mkdir  "Make directory (POSIX: 'mkdir')" 
          extends Modelica.Icons.Function;
          input String directoryName "Make a new directory";
          external "C" ModelicaInternal_mkdir(directoryName) annotation(Library = "ModelicaExternalC");
        end mkdir;

        function stat  "Inquire file information (POSIX function 'stat')" 
          extends Modelica.Icons.Function;
          input String name "Name of file, directory, pipe etc.";
          output Types.FileType fileType "Type of file";
          external "C" fileType = ModelicaInternal_stat(name) annotation(Library = "ModelicaExternalC");
        end stat;
      end FileSystem;
    end Internal;
  end Utilities;

  package Constants  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)" 
    extends Modelica.Icons.Package;
    final constant Real pi = 2 * Math.asin(1.0);
    final constant Real eps = ModelicaServices.Machine.eps "Biggest number such that 1.0 + eps = 1.0";
    final constant Real inf = ModelicaServices.Machine.inf "Biggest Real number such that inf and -inf are representable on the machine";
    final constant .Modelica.SIunits.Velocity c = 299792458 "Speed of light in vacuum";
    final constant Real R(final unit = "J/(mol.K)") = 8.314472 "Molar gas constant";
    final constant Real N_A(final unit = "1/mol") = 6.0221415e23 "Avogadro constant";
    final constant Real mue_0(final unit = "N/A2") = 4 * pi * 1.e-7 "Magnetic constant";
  end Constants;

  package Icons  "Library of icons" 
    extends Icons.Package;

    partial package ExamplesPackage  "Icon for packages containing runnable examples" 
      extends Modelica.Icons.Package;
    end ExamplesPackage;

    partial package Package  "Icon for standard packages" end Package;

    partial package BasesPackage  "Icon for packages containing base classes" 
      extends Modelica.Icons.Package;
    end BasesPackage;

    partial package VariantsPackage  "Icon for package containing variants" 
      extends Modelica.Icons.Package;
    end VariantsPackage;

    partial package InterfacesPackage  "Icon for packages containing interfaces" 
      extends Modelica.Icons.Package;
    end InterfacesPackage;

    partial package SourcesPackage  "Icon for packages containing sources" 
      extends Modelica.Icons.Package;
    end SourcesPackage;

    partial package SensorsPackage  "Icon for packages containing sensors" 
      extends Modelica.Icons.Package;
    end SensorsPackage;

    partial package UtilitiesPackage  "Icon for utility packages" 
      extends Modelica.Icons.Package;
    end UtilitiesPackage;

    partial package TypesPackage  "Icon for packages containing type definitions" 
      extends Modelica.Icons.Package;
    end TypesPackage;

    partial package IconsPackage  "Icon for packages containing icons" 
      extends Modelica.Icons.Package;
    end IconsPackage;

    partial package InternalPackage  "Icon for an internal package (indicating that the package should not be directly utilized by user)" end InternalPackage;

    partial class RotationalSensor  "Icon representing a round measurement device" end RotationalSensor;

    partial function Function  "Icon for functions" end Function;
  end Icons;

  package SIunits  "Library of type and unit definitions based on SI units according to ISO 31-1992" 
    extends Modelica.Icons.Package;

    package Conversions  "Conversion functions to/from non SI units and type definitions of non SI units" 
      extends Modelica.Icons.Package;

      package NonSIunits  "Type definitions of non SI units" 
        extends Modelica.Icons.Package;
        type Temperature_degC = Real(final quantity = "ThermodynamicTemperature", final unit = "degC") "Absolute temperature in degree Celsius (for relative temperature use SIunits.TemperatureDifference)" annotation(absoluteValue = true);
      end NonSIunits;
    end Conversions;

    type Angle = Real(final quantity = "Angle", final unit = "rad", displayUnit = "deg");
    type Volume = Real(final quantity = "Volume", final unit = "m3");
    type Time = Real(final quantity = "Time", final unit = "s");
    type Velocity = Real(final quantity = "Velocity", final unit = "m/s");
    type Acceleration = Real(final quantity = "Acceleration", final unit = "m/s2");
    type Frequency = Real(final quantity = "Frequency", final unit = "Hz");
    type Pressure = Real(final quantity = "Pressure", final unit = "Pa", displayUnit = "bar");
    type Energy = Real(final quantity = "Energy", final unit = "J");
    type VolumeFlowRate = Real(final quantity = "VolumeFlowRate", final unit = "m3/s");
    type ThermodynamicTemperature = Real(final quantity = "ThermodynamicTemperature", final unit = "K", min = 0.0, start = 288.15, nominal = 300, displayUnit = "degC") "Absolute temperature (use type TemperatureDifference for relative temperatures)" annotation(absoluteValue = true);
    type Temperature = ThermodynamicTemperature;
    type AmountOfSubstance = Real(final quantity = "AmountOfSubstance", final unit = "mol", min = 0);
    type MolarEnergy = Real(final quantity = "MolarEnergy", final unit = "J/mol", nominal = 2e4);
    type MolarFlowRate = Real(final quantity = "MolarFlowRate", final unit = "mol/s");
    type Concentration = Real(final quantity = "Concentration", final unit = "mol/m3");
    type FaradayConstant = Real(final quantity = "FaradayConstant", final unit = "C/mol");
  end SIunits;
  annotation(version = "3.2.1", versionBuild = 3, versionDate = "2013-08-14", dateModified = "2014-06-27 19:30:00Z"); 
end Modelica;

model AllModels_total
  extends Cardiovascular.Test.AllModels;
end AllModels_total;
