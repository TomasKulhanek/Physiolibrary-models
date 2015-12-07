package ModelicaServices
  "(version = 3.2.1, target = \"Dymola\") Models and functions used in the Modelica Standard Library requiring a tool specific implementation"

package ExternalReferences

  function loadResource
  "Return the absolute path name of a URI or local file name (in this default implementation URIs are not supported, but only local file names)"
    input String uri;
    output String fileReference;
  external "builtin" fileReference =
                                   Dymola_ResolveURI(uri);
  end loadResource;
end ExternalReferences;

package Machine

  final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";

  final constant Real small=1.e-60
  "Smallest number such that small and -small are representable on the machine";

  final constant Real inf=1.e+60
  "Biggest Real number such that inf and -inf are representable on the machine";
end Machine;
end ModelicaServices;

package Physiolibrary "Modelica library for Physiology (version 2.3.1)"
 extends Modelica.Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

  class Overview "Overview of Physiolibrary"
    extends Modelica.Icons.Information;

  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;

  end Connectors;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;

  class Version_2_3_1 "Version 2.3.1 (Sep. 15, 2015)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_3_1;

  class Version_2_3_0 "Version 2.3.0 (Feb. 16, 2015)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_3_0;

  class Version_2_2_0 "Version 2.2.0 (Sep. 06, 2014)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_2_0;

  class Version_2_1_1 "Version 2.1.1 (May. 02, 2014)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_1_1;

  class Version_2_1 "Version 2.1 (Feb. 28, 2014)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_1;

  class Version_2_0 "Version 2.0 (Jan. 26, 2014)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_2_0;

  class Version_1_2 "Version 1.2 (Jan 15, 2014)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_1_2;

  class Version_1_1 "Version 1.1 (Dec. 30, 2013)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_1_1;

  class Version_1_0 "Version 1.0.0 (Dec. 09, 2013)"
    extends Modelica.Icons.ReleaseNotes;

  end Version_1_0;
  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;


  end Contact;

    class License "BSD 3-Clause License"
       extends Modelica.Icons.Information;
    end License;

  class NewRealease "Publishing new release"
    extends Modelica.Icons.Information;

  end NewRealease;

  end UsersGuide;

  package Hydraulic "Domain with Pressure and Volumetric Flow"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model MinimalCirculation
        "Minimal circulation models driven by cardiac output"
         extends Modelica.Icons.Example;
        Components.Pump heart(useSolutionFlowInput=true);
        Components.ElasticVessel
                       arteries(
          volume_start(displayUnit="l") = 0.001,
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08);
        Components.Conductor resistance(Conductance(displayUnit="l/(mmHg.min)") = 6.2755151845753e-09);
        Components.ElasticVessel
                       veins(
          Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
          ZeroPressureVolume(displayUnit="l") = 0.00295,
          volume_start(displayUnit="l") = 0.0032);
        Modelica.Blocks.Sources.Pulse pulse(
          width=25,
          amplitude=3.3e-4,
          period=60/75);
      equation
        connect(heart.q_out, arteries.q_in);
        connect(arteries.q_in, resistance.q_out);
        connect(resistance.q_in, veins.q_in);
        connect(veins.q_in, heart.q_in);
        connect(pulse.y, heart.solutionFlow);
      end MinimalCirculation;

      model Windkessel_2element "Two-element Windkessel model"
        extends Modelica.Icons.Example;
        Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
              true);
        Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
          volume_start(displayUnit="l") = 0.00097);
        Physiolibrary.Hydraulic.Components.Conductor resistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
            8.1006650191331e-09);
        Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins;
        Utilities.Pulses pulses(QP(displayUnit="m3/s")=
               0.000424, HR=1.2);
      equation
        connect(heart.q_out, arteries.q_in);
        connect(resistance.q_out, veins.y);
        connect(pulses.volumeflowrate, heart.solutionFlow);
        connect(resistance.q_in, arteries.q_in);
      end Windkessel_2element;

      model Windkessel_3element "Three-element windkessel model"
        extends Modelica.Icons.Example;
        Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
              true);
        Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
          volume_start(displayUnit="l") = 0.00097);
        Physiolibrary.Hydraulic.Components.Conductor resistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09);
        Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins;
        Utilities.Pulses pulses(
          QP(displayUnit="m3/s") = 0.000424,
          TD1(displayUnit="s"),
          HR(displayUnit="1/min") = 1.2);
        Physiolibrary.Hydraulic.Components.Conductor impedance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
            1.5001231516913e-06);
      equation
        connect(resistance.q_out, veins.y);
        connect(pulses.volumeflowrate, heart.solutionFlow);
        connect(heart.q_out, impedance.q_in);
        connect(impedance.q_out, arteries.q_in);
        connect(resistance.q_in, arteries.q_in);
      end Windkessel_3element;

      model Windkessel_4element "Four-element windkessel model"
        extends Modelica.Icons.Example;
        Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
              true);
        Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
          volume_start(displayUnit="l") = 0.00097);
        Physiolibrary.Hydraulic.Components.Conductor resistance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)") = 8.1006650191331e-09);
        Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins;
        Utilities.Pulses pulses(QP(displayUnit="m3/s")=
               0.000424, HR=1.2);
        Physiolibrary.Hydraulic.Components.Conductor impedance(
            useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
            1.5001231516913e-06);
        Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
                "mmHg.s2/ml") = 666611.937075, volumeFlow_start(displayUnit=
                "l/min") = 8.3333333333333e-05);
      equation
        connect(resistance.q_out, veins.y);
        connect(pulses.volumeflowrate, heart.solutionFlow);
        connect(heart.q_out, impedance.q_in);
        connect(impedance.q_out, arteries.q_in);
        connect(heart.q_out, inertia.q_in);
        connect(inertia.q_out, arteries.q_in);
        connect(resistance.q_in, arteries.q_in);
      end Windkessel_4element;

      model CardiovascularSystem_GCG
        "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
         extends Modelica.Icons.Example;
         import Physiolibrary.Hydraulic;
        Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
          volume_start(displayUnit="l") = 0.0004,
          ZeroPressureVolume(displayUnit="l") = 0.0004,
          Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08);
        Components.ElasticVessel
                       pulmonaryArteries(
          ZeroPressureVolume(displayUnit="l") = 0.00030625,
          Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
          volume_start(displayUnit="l") = 0.00038);
        Hydraulic.Components.Conductor
                 pulmonary(Conductance(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08);
        Components.ElasticVessel
                       arteries(
          volume_start(displayUnit="l") = 0.00085,
          ZeroPressureVolume(displayUnit="l") = 0.000495,
          Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08);
        Components.ElasticVessel
                       veins(
          Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
          volume_start(displayUnit="l") = 0.00325,
          ZeroPressureVolume(displayUnit="l") = 0.00295);
        Hydraulic.Components.Conductor
                 nonMuscle(Conductance(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09);
        Sensors.PressureMeasure
                        pressureMeasure;
        Components.Pump
             rightHeart(useSolutionFlowInput=true);
        Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05);
        Sensors.PressureMeasure
                        pressureMeasure1;
        Components.Pump
             leftHeart(useSolutionFlowInput=true);
        Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05);
        Hydraulic.Components.Conductor
                 kidney(Conductance(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09);
        Hydraulic.Components.Conductor
                 muscle(Conductance(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09);
        Hydraulic.Components.Conductor
                 largeVeins(Conductance(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07);
        Components.ElasticVessel
                       rightAtrium(
          volume_start(displayUnit="l") = 0.0001,
          ZeroPressureVolume(displayUnit="l") = 0.0001,
          Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08);
        Blocks.Factors.Spline       rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
              0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}}, Xscale=101325/760)
          "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1).";
        Blocks.Factors.Spline       leftStarling(data={{-4,0,0},{-1,
              0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}}, Xscale=
              101325/760)
          "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1).";
      equation
        connect(pulmonaryArteries.q_in,pulmonary. q_in);
        connect(pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in);
        connect(veins.q_in, nonMuscle.q_in);
        connect(nonMuscle.q_out, arteries.q_in);
        connect(rightHeart.q_out,pulmonaryArteries. q_in);
        connect(leftHeart.q_in, pulmonaryVeinsAndLeftAtrium.q_in);
        connect(leftHeart.q_out,arteries. q_in);
        connect(pressureMeasure.q_in,rightHeart. q_in);
        connect(pressureMeasure1.q_in, pulmonaryVeinsAndLeftAtrium.q_in);
        connect(muscle.q_out, arteries.q_in);
        connect(kidney.q_out, arteries.q_in);
        connect(kidney.q_in, nonMuscle.q_in);
        connect(muscle.q_in, nonMuscle.q_in);
        connect(veins.q_in, largeVeins.q_out);
        connect(largeVeins.q_in, rightAtrium.q_in);
        connect(rightAtrium.q_in, rightHeart.q_in);
        connect(RNormalCO.y, rightStarling.yBase);
        connect(LNormalCO.y, leftStarling.yBase);
        connect(pressureMeasure.q_in, rightAtrium.q_in);
        connect(rightHeart.solutionFlow, rightStarling.y);
        connect(leftStarling.y, leftHeart.solutionFlow);
        connect(pressureMeasure.pressure, rightStarling.u);
        connect(pressureMeasure1.pressure, leftStarling.u);
      end CardiovascularSystem_GCG;

      package Utilities "Utility components used by package Examples"
      extends Modelica.Icons.UtilitiesPackage;

        model Pulses "example pulse flow generator"
          import Physiolibrary.Types.*;
          Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate;
          discrete Time T0 "beginning of cardiac cycle";
          Boolean b(start=false);
          discrete Time HP "duration of cardiac cycle";
          parameter Frequency HR=1.2;
          Time tc "relative time in carciac cycle";
          parameter Time TD1=0.07 "relative time of start of systole";
          discrete Time TD2 "relative time of end of systole";
          parameter VolumeFlowRate QP=0.000424 "peak volume flowrate";
        equation
          b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
          when {initial(),b} then
            T0 = time "set beginning of cardiac cycle";
            HP = 1/HR "update length of carciac cycle";
            TD2 = TD1 + (2/5)*HP "compute end time of systole";
          end when;
          tc = time - T0 "relative time in carciac cycle";
          volumeflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
            (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
            "zero before and after systole, otherwise sin up to peak flow";
        end Pulses;
      end Utilities;

      package Kofranek2014
        "models of cardiovascular system used in www.physiome.cz/atlas"
        extends Modelica.Icons.ExamplesPackage;
        model NonPulsatileCirculation
          extends Physiolibrary.Icons.CardioVascular;
          Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
            useV0Input=true,
            useComplianceInput=true,
            volume_start=0.000373);
          Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k=
                2.2576853432954e-08);
          Physiolibrary.Types.Constants.VolumeConst V0AP(k=0.000327);
          Physiolibrary.Hydraulic.Components.Conductor TotalPulmonaryResistance(
              useConductanceInput=true);
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RP(k(
                displayUnit="(Pa.s)/m3") = 9332567.11905);
          Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
            useV0Input=true,
            useComplianceInput=true,
            volume_start=0.000704);
          Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k=
                2.250184727537e-07);
          Physiolibrary.Types.Constants.VolumeConst V0VP(k=0.000435);
          Physiolibrary.Hydraulic.Components.ElasticVessel SystemicVeins(
            useV0Input=true,
            useComplianceInput=true,
            volume_start=0.003922);
          Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k=
                1.5001231516913e-06);
          Physiolibrary.Types.Constants.VolumeConst V0VS(k=0.002845);
          Physiolibrary.Hydraulic.Components.Conductor TotalSystemicResistance(
              useConductanceInput=true);
          Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RT(k(
                displayUnit="(Pa.s)/m3") = 133322387.415);
          Physiolibrary.Hydraulic.Components.ElasticVessel SystemicArteries(
            useV0Input=true,
            useComplianceInput=true,
            volume_start=0.000672);
          Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k=
                1.1250923637685e-08);
          Physiolibrary.Types.Constants.VolumeConst V0AS(k=0.000529);
          replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit=
                  "ml/(mmHg.s)") = 1.2503526469347e-07);
          replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit=
                  "m3/(Pa.s)") = 7.5006157584566e-08);
        equation
          connect(CAP.y, PulmonaryArteries.compliance);
          connect(V0AP.y, PulmonaryArteries.zeroPressureVolume);
          connect(RP.y, TotalPulmonaryResistance.cond);
          connect(CVP.y, PulmonaryVeins.compliance);
          connect(CVS.y, SystemicVeins.compliance);
          connect(RT.y, TotalSystemicResistance.cond);
          connect(CAS.y, SystemicArteries.compliance);
          connect(PulmonaryArteries.q_in, TotalPulmonaryResistance.q_in);
          connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in);
          connect(PulmonaryVeins.q_in, leftHeart.inflow);
          connect(leftHeart.outflow, SystemicArteries.q_in);
          connect(SystemicArteries.q_in, TotalSystemicResistance.q_in);
          connect(TotalSystemicResistance.q_out, SystemicVeins.q_in);
          connect(SystemicVeins.q_in, rightHeart.inflow);
          connect(PulmonaryVeins.zeroPressureVolume, V0VP.y);
          connect(SystemicVeins.zeroPressureVolume, V0VS.y);
          connect(V0AS.y, SystemicArteries.zeroPressureVolume);
          connect(rightHeart.outflow, PulmonaryArteries.q_in);
        end NonPulsatileCirculation;

        model PulsatileCirculation
            extends NonPulsatileCirculation(
            redeclare Parts.PulsatileHeartPump rightHeart(pulses(
                  QP=0.000338)),
            redeclare Parts.PulsatileHeartPump leftHeart(pulses(QP=
                   0.000338)),
            CAS(k=7.2755972857029e-09),
            SystemicArteries(volume_start=0.000603),
            SystemicVeins(volume_start=0.003991));

        end PulsatileCirculation;

        package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;
          model HeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

            Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow;
            Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow;
            parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
          equation
            inflow.q + outflow.q = 0;
            inflow.q = StarlingSlope*inflow.pressure;
          end HeartPump;

          model PulsatileHeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

            Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow;
            Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow;
            Utilities.Pulses pulses;
            Physiolibrary.Hydraulic.Components.Pump pump(useSolutionFlowInput=
                  true);
            parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
          equation
            connect(pump.q_out, outflow);
            connect(pump.solutionFlow, pulses.volumeflowrate);
            connect(inflow, pump.q_in);
            connect(inflow, inflow);
          end PulsatileHeartPump;

        end Parts;

      end Kofranek2014;

      package Fernandez2013
        "Model of CVS introduced by Fernandez de Canete et al. 2013"
          extends Modelica.Icons.ExamplesPackage;

        model PulsatileCirculation
          "Model of cardiovascular system with pulsatile dynamic"
                                  extends Physiolibrary.Icons.CardioVascular;

          Physiolibrary.Hydraulic.Components.Conductor RPulmonaryVeins(
              useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
              7.425609600872e-08);
          Physiolibrary.Hydraulic.Components.Inertia pulmonaryVeinsInertia(
              volumeFlow_start(displayUnit="m3/s") = 2.225e-05, I(displayUnit=
                  "Pa.s2/m3") = 410632.9532382);
          Physiolibrary.Hydraulic.Components.Conductor RPulmonaryArtery(
              useConductanceInput=false, Conductance(displayUnit="m3/(Pa.s)")=
              2.2216823876548e-07);
          Physiolibrary.Hydraulic.Components.Inertia pulmonaryArterialInertia(
              volumeFlow_start(displayUnit="ml/min") = 7.3233333333333e-07, I(
                displayUnit="mmHg.s2/ml") = 99991.79056125);
          Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
            useComplianceInput=false,
            volume_start(displayUnit="ml") = 0.0006597,
            ZeroPressureVolume=0.0001,
            Compliance(displayUnit="ml/mmHg") = 3.5027875591992e-07);
          Physiolibrary.Hydraulic.Components.IdealValve mitralValve(
                                      useLimitationInputs=false, _Gon(displayUnit=
                 "ml/(mmHg.s)") = 1.9996641612045e-06);
          Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
              useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=0.0002097,
            ZeroPressureVolume=9e-05);
          Physiolibrary.Hydraulic.Components.Conductor RLeftMyo(useConductanceInput=false,
              Conductance(displayUnit="m3/(Pa.s)") = 9.3757696980707e-08);
          Physiolibrary.Hydraulic.Components.IdealValve aorticValve(_Gon(displayUnit="ml/(mmHg.s)")=
                 1.9996641612045e-06, useLimitationInputs=false);
          Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
            volume_start=4.6e-05,
            ZeroPressureVolume=3e-05,
            Compliance(displayUnit="ml/mmHg") = 1.6501354668604e-09);
          Physiolibrary.Hydraulic.Components.Conductor Raorta(useConductanceInput=false,
              Conductance(displayUnit="m3/(Pa.s)") = 1.1108411938274e-07);
          Physiolibrary.Hydraulic.Components.Inertia aorticInertia(
              volumeFlow_start(displayUnit="m3/s") = 1.0385e-05, I(displayUnit=
                  "Pa.s2/m3") = 109990.96961737);
          Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
            volume_start=0.000805,
            ZeroPressureVolume=0.0007,
            Compliance(displayUnit="ml/mmHg") = 1.0950899007347e-08);
          Physiolibrary.Hydraulic.Components.Conductor RSystemic(useConductanceInput=false,
              Conductance(displayUnit="m3/(Pa.s)") = 7.5006157584566e-09);
          Physiolibrary.Hydraulic.Components.Inertia systemicInertia(
              volumeFlow_start(displayUnit="m3/s") = 7.935e-05, I(displayUnit=
                  "Pa.s2/m3") = 479960.594694);
          Physiolibrary.Hydraulic.Components.IdealValve tricuspidValve(
              useLimitationInputs=false, _Gon(displayUnit="ml/(mmHg.s)") = 1.9996641612045e-06);
          Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
              useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=0.00018,
            ZeroPressureVolume=7e-05);
          Physiolibrary.Hydraulic.Components.Conductor RRightMyo(useConductanceInput=false,
              Conductance(displayUnit="m3/(Pa.s)") = 4.2858518443821e-07);
          Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve(_Gon(displayUnit=
                 "ml/(mmHg.s)") = 1.9996641612045e-06, useLimitationInputs=false);
          Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArtery(
            volume_start=2.1e-05,
            ZeroPressureVolume=2e-05,
            Compliance(displayUnit="m3/Pa") = 6.7505541826109e-10);
          Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArterioles(
            volume_start=0.000637,
            ZeroPressureVolume=0.0006,
            Compliance(displayUnit="ml/mmHg") = 2.0026644075079e-08);
          Physiolibrary.Hydraulic.Components.ElasticVessel veins(
            volume_start(displayUnit="ml") = 0.002443,
            ZeroPressureVolume=0.00237,
            Compliance(displayUnit="ml/mmHg") = 1.5001231516913e-07);
          Parts.TimeVaryingElastance timeVaryingElastanceLeft(
            Ed(displayUnit="mmHg/ml") = 13332238.7415,
            Es(displayUnit="mmHg/ml") = 183318282.69563,
            Pi0(displayUnit="mmHg") = 6666.11937075);
          Parts.TimeVaryingElastance timeVaryingElastanceRight(
            Ed(displayUnit="mmHg/ml") = 3999671.62245,
            Es(displayUnit="mmHg/ml") = 43729743.0721,
            Pi0(displayUnit="mmHg") = 3199.73729796);
          Physiolibrary.Types.Constants.FrequencyConst heartRate(k(displayUnit=
                  "Hz") = 1.2);
        equation
          connect(aorta.q_in, Raorta.q_in);
          connect(Raorta.q_out, aorticInertia.q_in);
          connect(systemicInertia.q_out, veins.q_in);
          connect(timeVaryingElastanceLeft.C, leftVentricle.compliance);
          connect(timeVaryingElastanceRight.C, rightVentricle.compliance);
          connect(veins.q_in, tricuspidValve.q_in);
          connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure);
          connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure);
          connect(heartRate.y, timeVaryingElastanceLeft.HR);
          connect(aorticInertia.q_out, arteries.q_in);
          connect(arteries.q_in, RSystemic.q_in);
          connect(RSystemic.q_out, systemicInertia.q_in);
          connect(rightVentricle.q_in, tricuspidValve.q_out);
          connect(RRightMyo.q_in, rightVentricle.q_in);
          connect(heartRate.y, timeVaryingElastanceRight.HR);
          connect(RRightMyo.q_out, pulmonaryValve.q_in);
          connect(pulmonaryValve.q_out, pulmonaryArtery.q_in);
          connect(pulmonaryArtery.q_in, RPulmonaryArtery.q_in);
          connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in);
          connect(pulmonaryArterialInertia.q_out, pulmonaryArterioles.q_in);
          connect(pulmonaryArterioles.q_in, RPulmonaryVeins.q_in);
          connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in);
          connect(pulmonaryVeinsInertia.q_out, pulmonaryVeins.q_in);
          connect(pulmonaryVeins.q_in, mitralValve.q_in);
          connect(mitralValve.q_out, leftVentricle.q_in);
          connect(leftVentricle.q_in, RLeftMyo.q_in);
          connect(aorticValve.q_out, aorta.q_in);
          connect(RLeftMyo.q_out, aorticValve.q_in);
        end PulsatileCirculation;

        package Parts "Utility components used by package KofranekModels2013"
          extends Modelica.Icons.UtilitiesPackage;
          model TimeVaryingElastance
            parameter Physiolibrary.Types.HydraulicElastance Ed
              "elastance of diastole";
            parameter Physiolibrary.Types.HydraulicElastance Es
              "elastance of systole";
            parameter Physiolibrary.Types.Pressure Pi0
              "peak isovolumic pressure";
            Physiolibrary.Types.Time tm
              "relative time from the beginning of cardiac cycle";
            discrete Physiolibrary.Types.Time HP "heart period";
            discrete Physiolibrary.Types.Time t0
              "time of beginning of the cardiac cycle";
            discrete Physiolibrary.Types.Time ts "duration of systole";
            Real a;
            Physiolibrary.Types.RealIO.HydraulicComplianceOutput C;
                  Physiolibrary.Types.HydraulicElastance E;
            Physiolibrary.Types.RealIO.PressureOutput Pi;
            Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate";
          equation
            tm = time - pre(t0);
            if (tm<pre(ts)) then
              a= (1-cos(2*Modelica.Constants.pi*tm/pre(ts)))/2;
            else
              a=0;
            end if;
            E=Ed+Es*a;
            C=1/E;
            Pi = Pi0*a;
            when {initial(), tm >= pre(HP)} then
              HP = 1/HR;
              t0= time;
              ts = 0.16+0.3*HP;
            end when;
          end TimeVaryingElastance;
        end Parts;
      end Fernandez2013;

      package MeursModel2011
        "models of cardiovascular system used in www.physiome.cz/atlas"
        extends Modelica.Icons.ExamplesPackage;
        package Parts "Utility components used by package KofranekModels2013"
          extends Modelica.Icons.UtilitiesPackage;
          model AtrialElastance
            extends HeartIntervals;
            Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct
              "compliance";
            Physiolibrary.Types.HydraulicElastance Et "elasticity";
            parameter Physiolibrary.Types.HydraulicElastance EMIN
              "Diastolic elastance";
          parameter Boolean useEs_extInput = false
              "=true, if external elastance/compliance value is used";
            parameter Physiolibrary.Types.HydraulicElastance EMAX
              "Maximum systolic elastance";
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Ees)=1/es_int if useEs_extInput;
          protected
             Physiolibrary.Types.HydraulicElastance es_int;
          equation
            if not useEs_extInput then
              es_int=EMAX;
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
            Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct
              "ventricular elasticity";
            Modelica.Blocks.Interfaces.RealOutput Et0
              "normalized ventricular elasticity (0..1)";
            Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time";
            Physiolibrary.Types.HydraulicElastance Et;
            parameter Physiolibrary.Types.HydraulicElastance EMIN
              "Diastolic elastance ";
            constant Real Kn = 0.57923032735652;
            //Kn is always = 0.5792303273565197
            //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
            //Equation to calculate normalized elastance ET0 was:
            //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
          parameter Boolean useEs_extInput = false
              "=true, if external elastance/compliance value is used";
            parameter Physiolibrary.Types.HydraulicElastance EMAX
              "Maximum systolic elastance";
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/EMAX)=1/es_int if useEs_extInput;
          protected
             Physiolibrary.Types.HydraulicElastance es_int;
          equation
            if not useEs_extInput then
              es_int=EMAX;
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
            discrete Physiolibrary.Types.Time Tas, T0, Tvs;
            parameter Physiolibrary.Types.Time Tav(displayUnit = "s") = 0.01
              "atrioventricular delay";
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

        model HemodynamicsMeurs_flatNorm
        extends Physiolibrary.Icons.CardioVascular;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Epa(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000106,
            ZeroPressureVolume=5e-05,
            ExternalPressure=-533.28954966,
            Elastance=31064116.267695);
          Physiolibrary.Hydraulic.Components.Resistor Rpp(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 14665462.61565);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Epv(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000518,
            ZeroPressureVolume=0.00035,
            ExternalPressure=-533.28954966,
            Elastance=6066168.6273825);
          Physiolibrary.Hydraulic.Components.Resistor Rlain(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance LeftAtrium(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=9.31e-05,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance LeftVentricle(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000144,
            ZeroPressureVolume=6e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance AorticValve(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 1066579.09932);
          Parts.AtrialElastance LAtrialElastance(
            Tav(displayUnit="s"),
            EMIN=15998686.4898,
            EMAX=37330268.4762);
          Parts.VentricularElastance LVentricularElastance(EMIN=11999014.86735,
              EMAX=533289549.66);
          Physiolibrary.Hydraulic.Components.IdealValveResistance MitralValve(
            useLimitationInputs=false,
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Eitha(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000204,
            ZeroPressureVolume=0.00014,
            ExternalPressure=-533.28954966,
            Elastance=190651014.00345);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Eetha(
            volume_start(displayUnit="ml") = 0.000526,
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            ZeroPressureVolume=0.00037,
            Elastance=74127247.40274);
          Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905,
              volumeFlow_start(displayUnit="ml/min") = 2.1666666666667e-05);
          Physiolibrary.Hydraulic.Components.Resistor Retha(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 7999343.2449);
          Physiolibrary.Hydraulic.Components.Resistor Rsart(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 106657909.932);
          Physiolibrary.Hydraulic.Components.Resistor Rsven(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 26664477.483);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Est(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000283,
            ZeroPressureVolume=0.000185,
            Elastance=34930465.50273);
          Physiolibrary.Hydraulic.Components.Resistor Rethv(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 11999014.86735);
          Physiolibrary.Hydraulic.Components.Resistor Rrain(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Eithv(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00148,
            ZeroPressureVolume=0.00119,
            ExternalPressure=-533.28954966,
            Elastance=2426467.450953);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance Eethv(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00153,
            ZeroPressureVolume=0.001,
            Elastance=2253148.3473135);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance RightAtrium(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000135,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance RightVentricle(
            useComplianceInput=true,
            useV0Input=false,
            useExternalPressureInput=false,
            volume_start=0.000131,
            ZeroPressureVolume=4e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance PulmonaryValve(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Parts.AtrialElastance RAtrialElastance(EMIN=6666119.37075, EMAX=
                19998358.11225);
          Parts.VentricularElastance RVentricularElastance(EMIN=7599376.082655,
              EMAX=65327969.83335);
          Physiolibrary.Hydraulic.Components.IdealValveResistance TricuspidValve(
            _Goff=0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2);
        equation
          connect(Epa.q_in, Rpp.q_in);
          connect(Rpp.q_out, Epv.q_in);
          connect(Epv.q_in, Rlain.q_in);
          connect(LeftAtrium.q_in, MitralValve.q_in);
          connect(LeftVentricle.q_in, MitralValve.q_out);
          connect(LeftVentricle.q_in, AorticValve.q_in);
          connect(LeftVentricle.compliance, LVentricularElastance.Ct);
          connect(Rlain.q_out, LeftAtrium.q_in);
          connect(Retha.q_in, Eetha.q_in);
          connect(Retha.q_out, inertia.q_out);
          connect(inertia.q_in, Eitha.q_in);
          connect(Eitha.q_in, AorticValve.q_out);
          connect(Rrain.q_in, Eithv.q_in);
          connect(Eithv.q_in, Rethv.q_out);
          connect(Rethv.q_in, Eethv.q_in);
          connect(RightAtrium.q_in, TricuspidValve.q_in);
          connect(RightVentricle.q_in, TricuspidValve.q_out);
          connect(RightVentricle.q_in, PulmonaryValve.q_in);
          connect(Rrain.q_out, RightAtrium.q_in);
          connect(RightAtrium.compliance,RAtrialElastance. Ct);
          connect(PulmonaryValve.q_out, Epa.q_in);
          connect(RightVentricle.compliance,RVentricularElastance. Ct);
          connect(LeftAtrium.compliance, LAtrialElastance.Ct);
          connect(HeartRate.y,RAtrialElastance. HR);
          connect(RVentricularElastance.HR, HeartRate.y);
          connect(LAtrialElastance.HR, HeartRate.y);
          connect(LVentricularElastance.HR, HeartRate.y);
          connect(Est.q_in, Rsart.q_out);
          connect(Rsart.q_in, Eetha.q_in);
          connect(Eethv.q_in, Rsven.q_out);
          connect(Rsven.q_in, Est.q_in);
        end HemodynamicsMeurs_flatNorm;
      end MeursModel2011;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model Conductor "Hydraulic resistor, where conductance=1/resistance"
       extends Hydraulic.Interfaces.OnePort;
       extends Icons.HydraulicResistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used";

        parameter Types.HydraulicConductance Conductance=0
          "Hydraulic conductance if useConductanceInput=false";

        Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput;
      protected
         Types.HydraulicConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;
        q_in.q = c * (q_in.pressure - q_out.pressure);
      end Conductor;

      model Resistor
        extends Physiolibrary.Hydraulic.Components.Conductor(final Conductance = 1/Resistance);
        parameter Physiolibrary.Types.HydraulicResistance Resistance
          "Hydraulic conductance if useConductanceInput=false";
      end Resistor;

      model ElasticVessel
        "Elastic container for blood vessels, bladder, lumens"
       extends Icons.ElasticBalloon;
       extends SteadyStates.Interfaces.SteadyState(
                                          state_start=volume_start, storeUnit=
            "ml");
        Interfaces.HydraulicPort_a
                             q_in;
        parameter Types.Volume volume_start = 1e-11 "Volume start value";              //default = 1e-5 ml
        Types.Volume excessVolume "Additional volume, that generate pressure";

         parameter Boolean useV0Input = false
          "=true, if zero-pressure-volume input is used";

         parameter Types.Volume ZeroPressureVolume = 1e-11
          "Maximal volume, that does not generate pressure if useV0Input=false";
                                                      //default = 1e-5 ml

          parameter Types.Volume CollapsingPressureVolume = 1e-12
          "Maximal volume, which generate negative collapsing pressure"; //default = 1e-6 ml

         Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input;
        parameter Boolean useComplianceInput = false
          "=true, if compliance input is used";
        parameter Types.HydraulicCompliance Compliance = 1
          "Compliance if useComplianceInput=false";

        Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) = c if useComplianceInput;
        parameter Boolean useExternalPressureInput = false
          "=true, if external pressure input is used";
        parameter Types.Pressure ExternalPressure=0
          "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false.";
        parameter Types.Pressure MinimalCollapsingPressure = -101325;
        Types.RealIO.PressureInput externalPressure(start=ExternalPressure) = ep if useExternalPressureInput;

        Types.RealIO.VolumeOutput volume;

      protected
        Types.Volume zpv;
        Types.HydraulicCompliance c;
        Types.Pressure ep;
        parameter Types.Pressure a=MinimalCollapsingPressure/log(Modelica.Constants.eps);

      equation
        if not useV0Input then
          zpv=ZeroPressureVolume;
        end if;
        if not useComplianceInput then
          c=Compliance;
        end if;
        if not useExternalPressureInput then
          ep=ExternalPressure;
        end if;
        excessVolume = max( 0, volume - zpv);
        q_in.pressure =
        smooth(0,
          if noEvent(volume>CollapsingPressureVolume) then
            (excessVolume/c + ep)
          else
            (a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)) + ep));
        //then: normal physiological state
        //else: abnormal collapsing state

        //Collapsing state: the max function prevents the zero or negative input to logarithm, the logarithm brings more negative pressure for smaller volume
        //However this collapsing is limited with numerical precission, which is reached relatively soon.

        state = volume; // der(volume) =  q_in.q;
        change = q_in.q;
       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
      end ElasticVessel;

      model ElasticVesselElastance
        extends Physiolibrary.Hydraulic.Components.ElasticVessel(final Compliance = 1/Elastance);
        parameter Physiolibrary.Types.HydraulicElastance Elastance = 1
          "Elastance if useComplianceInput=false";
      end ElasticVesselElastance;

      model HydrostaticColumn
        "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
        extends Icons.HydrostaticGradient;
        Hydraulic.Interfaces.HydraulicPort_a
                             q_up "Top site";
        Interfaces.HydraulicPort_a
                             q_down "Bottom site";
        parameter Boolean useHeightInput = false
          "=true, if height input is used";
        parameter Types.Height H=0
          "Height of hydrostatic column if useHeightInput=false";

        Types.RealIO.HeightInput height(start=H)=h if useHeightInput
          "Vertical distance between top and bottom connector";
        parameter Modelica.SIunits.Density ro=1060; //liquid density
        parameter Boolean useExternalG = false
          "=true, if external gravity acceleration is used";
        parameter Types.Acceleration GravityAcceleration = 9.81
          "Gravity acceleration if useExternalG=false";
         //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
        Types.RealIO.AccelerationInput G(start=GravityAcceleration)=g if useExternalG
          "Gravity acceleration";
        parameter Boolean usePumpEffect = false
          "=true, if musce pump effect is used";
        Types.RealIO.FractionInput
                              pumpEffect(start=PumpEffect)=pe if       usePumpEffect;
      protected
        parameter Types.Fraction PumpEffect = 1
          "Pump effect if usePumpEffect=false";
      protected
        Types.Acceleration g;
        Types.Fraction pe;
        Types.Height h;
      equation
        if not useHeightInput then
          h=H;
        end if;
        if not useExternalG then
          g=GravityAcceleration;
        end if;
        if not usePumpEffect then
          pe = PumpEffect;
       end if;
        q_down.pressure = q_up.pressure + g*ro*h*pe;
        q_up.q + q_down.q = 0;
      end HydrostaticColumn;

      model Inertia "Inertia of the volumetric flow"
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=volumeFlow_start,
          storeUnit="ml/min");
        extends Interfaces.OnePort;
        extends Icons.Inertance;
        parameter Types.VolumeFlowRate volumeFlow_start=0.3
          "Volumetric flow start value";                                                                         //5 l/min is normal volumetric flow in aorta

        parameter Types.HydraulicInertance I "Inertance";

      equation
        state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
        change = (q_in.pressure - q_out.pressure)/I;
      end Inertia;

      model IdealValve
        extends Interfaces.OnePort;
         Boolean open(start=true) "Switching state";
         Real passableVariable(start=0, final unit="1")
          "Auxiliary variable for actual position on the ideal diode characteristic";
        /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */
        parameter Types.HydraulicConductance _Gon(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-02
          "Forward state-on conductance (open valve conductance)";
                                                               //= the same as resistance 1e-5 mmHg/(l/min)
        parameter Types.HydraulicConductance _Goff(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-12
          "Backward state-off conductance (closed valve conductance)";
                                                               //= 1e-5 (l/min)/mmHg
        parameter Types.Pressure Pknee(final min=0) = 0
          "Forward threshold pressure";
        parameter Boolean useLimitationInputs = false
          "=true, if Gon and Goff are from inputs";
        Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=gon if useLimitationInputs
          "open valve conductance = infinity for ideal case";
        Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=goff if useLimitationInputs
          "closed valve conductance = zero for ideal case";
      protected
        Types.HydraulicConductance gon,goff;
        constant Types.Pressure unitPressure=1;
        constant Types.VolumeFlowRate unitFlow=1;
      equation
        if not useLimitationInputs then
          gon = _Gon;
          goff = _Goff;
        end if;
        open = passableVariable > Modelica.Constants.eps;
        dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
        volumeFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;
      end IdealValve;

      model IdealValveResistance
        extends Physiolibrary.Hydraulic.Components.IdealValve(final _Gon=1/_Ron);
        parameter Physiolibrary.Types.HydraulicResistance _Ron = 79.993432449
          "forward state resistance";
      end IdealValveResistance;

      model Pump "Prescribed volumetric flow"
        extends Hydraulic.Interfaces.OnePort;
        extends Interfaces.ConditionalSolutionFlow;
      equation
        volumeFlowRate = q;
      end Pump;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolibrary;
        extends Icons.Reabsorption;

        Hydraulic.Interfaces.HydraulicPort_a
                             Inflow;
        Hydraulic.Interfaces.HydraulicPort_b
                             Outflow;
        Hydraulic.Interfaces.HydraulicPort_b
                             Reabsorption;
        Types.RealIO.FractionInput FractReab;
        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted";
        parameter Types.VolumeFlowRate OutflowMin = 0
          "Minimal outflow if useExternalOutflowMin=false";

        Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin;
      protected
         Types.VolumeFlowRate om;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;
        Inflow.pressure = Outflow.pressure;
        0 = Inflow.q + Outflow.q + Reabsorption.q;
       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");
        Reabsorption.q = -max(0,FractReab*(Inflow.q-om));
      end Reabsorption;

      model ElasticMembrane
        "Interaction between internal and external cavities"
       extends SteadyStates.Interfaces.SteadyState(
                                          state_start=volume_start, storeUnit=
            "ml");
       extends Icons.InternalElasticBalloon;
        Interfaces.HydraulicPort_a
                             q_int "Internal space";
        Interfaces.HydraulicPort_b
                             q_ext "External space";
       parameter Types.HydraulicCompliance Compliance "Compliance";
       parameter Types.Volume zeroPressureVolume=0
          "Maximal volume, that does not generate pressure";
       parameter Types.Volume volume_start=0 "Volume start value";
       Types.Volume volume;
       Types.Volume stressedVolume;

       parameter Types.Volume NominalVolume=1e-6
          "Scale numerical calculation from quadratic meter to miniliters.";
      equation
        q_int.q + q_ext.q = 0;
        q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
        stressedVolume = max(volume-zeroPressureVolume,0);
        state = volume; // der(volume) =  q_int.q;
        change = q_int.q;
        // assert(volume>=-Modelica.Constants.eps,"Totally collapsed compartments are not supported!");
      end ElasticMembrane;

    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Volumetric flow between ports"
        extends Interfaces.OnePort;
        //extends Icons.FlowMeasure;
        extends Modelica.Icons.RotationalSensor;

        Types.RealIO.VolumeFlowRateOutput volumeFlow "Actual volume flow rate";
      equation
        q_out.pressure = q_in.pressure;
        volumeFlow = q_in.q;
      end FlowMeasure;

      model PressureMeasure "Hydraulic pressure at port"
        extends Icons.PressureMeasure;
        Interfaces.HydraulicPort_a
                             q_in;
        Types.RealIO.PressureOutput pressure "Pressure";
      equation
        pressure = q_in.pressure;
        q_in.q = 0;
      end PressureMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedPump "Prescribed flow at port"
        extends Interfaces.ConditionalSolutionFlow;
        Interfaces.HydraulicPort_b
                             q_out;
      equation
        q_out.q = - q;
      end UnlimitedPump;

        model UnlimitedVolume "Prescribed pressure at port"
          parameter Boolean usePressureInput = false
          "=true, if pressure input is used";

          parameter Types.Pressure P=0
          "Hydraulic pressure if usePressureInput=false";

          Types.RealIO.PressureInput pressure(start=P)=p if usePressureInput
          "Pressure";
          Interfaces.HydraulicPort_a
                               y "PressureFlow output connectors";
         parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state";
         parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added.";
      protected
          Types.Pressure p;
        initial equation
          if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
            y.q = 0;
          end if;
        equation
          if not usePressureInput then
            p=P;
          end if;
          y.pressure = p;
          if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
             y.q = 0;
          end if;
        end UnlimitedVolume;

      model UnlimitedOutflowPump "Prescribed flow at port"
        extends Interfaces.ConditionalSolutionFlow;
        Interfaces.HydraulicPort_a q_in;
      equation
        q_in.q = q;
      end UnlimitedOutflowPump;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;
      connector HydraulicPort
        "Hydraulical connector with pressure and volumetric flow"
        Types.Pressure pressure "Pressure";
        flow Types.VolumeFlowRate q "Volume flow";
      end HydraulicPort;

      connector HydraulicPort_a "Hydraulical inflow connector"
        extends HydraulicPort;
      end HydraulicPort_a;

      connector HydraulicPort_b "Hydraulical outflow connector"
        extends HydraulicPort;
      end HydraulicPort_b;

      partial model OnePort "Hydraulical OnePort"
        HydraulicPort_a      q_in "Volume inflow";
        HydraulicPort_b      q_out "Volume outflow";
         Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
         Types.Pressure dp "Pressure gradient";
      equation
        q_in.q + q_out.q = 0;
        volumeFlowRate = q_in.q;
        dp = q_in.pressure - q_out.pressure;
      end OnePort;

      partial model ConditionalSolutionFlow
        "Input of solution volumetric flow vs. parametric solution volumetric flow"

        parameter Boolean useSolutionFlowInput = false
          "=true, if solution flow input is used instead of parameter SolutionFlow";

        parameter Types.VolumeFlowRate SolutionFlow=0
          "Volumetric flow of solution if useSolutionFlowInput=false";

        Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput;

        Types.VolumeFlowRate q "Current solution flow";
      equation
        if not useSolutionFlowInput then
          q = SolutionFlow;
        end if;

      end ConditionalSolutionFlow;
    end Interfaces;
  end Hydraulic;

  package Thermal
    "Domain with Temperature and Heat Flow - extension of Modelica.Thermal.HeatTransfer"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model SkinHeatFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood flow through skin";
        Sources.UnlimitedHeat bodyCore(T(displayUnit="degC") = 310.15);
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15);
      equation
        connect(skinCirculation.q_in, bodyCore.port);
        connect(skin.port, skinCirculation.q_out);
      end SkinHeatFlow;

      model MuscleHeat
      extends Modelica.Icons.Example;

        Components.HeatAccumulation
                         muscle(
          relativeHeat_start=52125.66,
          SpecificHeat=3475.044,
          Weight(displayUnit="kg") = 15);
        Components.IdealRadiator
                      muscleCirculation(MassFlow(displayUnit="g/min") = 0.0114)
          "Blood circulation in skeletal muscle";
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(Q_flow=13.956)
          "Heat energy created by muscle";
        Sources.UnlimitedHeat                                  body(T(displayUnit="degC")=
               310.15);
      equation
        connect(muscle.q_in, generatedHeat.port);
        connect(muscleCirculation.q_in, body.port);
        connect(muscle.q_in, muscleCirculation.q_out);
      end MuscleHeat;

      model ThermalBody_QHP
        import Physiolibrary;
        extends Modelica.Icons.Example;
        Thermal.Components.HeatAccumulation
                          core(SpecificHeat=3475.044, Weight=10.75);
        Thermal.Components.HeatAccumulation
                          GILumen(Weight=1);
        Thermal.Components.HeatAccumulation
                          skeletalMuscle(SpecificHeat=3475.044, Weight=7.05);
        Thermal.Components.IdealRadiator
                      muscleBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0114,
          useMassFlowInput=false,
          SpecificHeat=3851.856);
        Thermal.Sources.MassOutflow urination;
        Thermal.Sources.MassOutflow lungsVapor(
          VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 4.6666666666667e-06);
        Thermal.Components.HeatAccumulation
                          skin(
          relativeHeat_start=-8373.6,
          SpecificHeat=3475.044,
          Weight=0.56);
        Thermal.Components.IdealRadiator
                      skinBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0028333333333333,
          useMassFlowInput=false,
          SpecificHeat=3851.856);
        Thermal.Sources.MassOutflow insensibleVapor(
          VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 6.5e-06);
        Thermal.Sources.MassOutflow sweating(VaporizationHeat(
              displayUnit="kcal/g") = 2428344, SpecificHeat(displayUnit=
                "kcal/(kg.K)"));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G(
              displayUnit="kcal/(min.K)") = 1);
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
              displayUnit="kcal/(min.K)") = 2.4423);
        Thermal.Sources.UnlimitedHeat            ambient(T=295.15);
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow skinMetabolicHeat(Q_flow=
              1.95384);
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow coreMetabolicHeat(Q_flow=
              55.824);
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow(
              displayUnit="kcal/min") = 9.7692);
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(Q_flow=0);
        Thermal.Components.Stream
                   foodAbsorption(SpecificHeat=4186.8);
      equation

        connect(core.q_in, muscleBloodFlow.q_in);
        connect(skeletalMuscle.q_in, muscleBloodFlow.q_out);
        connect(core.q_in, urination.q_in);
        connect(core.q_in, lungsVapor.q_in);
        connect(skinBloodFlow.q_in, lungsVapor.q_in);
        connect(skin.q_in, skinBloodFlow.q_out);
        connect(skin.q_in, insensibleVapor.q_in);
        connect(sweating.q_in, insensibleVapor.q_in);
        connect(GILumen.q_in, lumenVolume.port_a);
        connect(core.q_in, lumenVolume.port_b);
        connect(skin.q_in, air.port_b);
        connect(skin.q_in, skinMetabolicHeat.port);
        connect(GILumen.q_in, foodHeatIntake.port);
        connect(skeletalMuscle.q_in, muscleMetabolicHeat.port);
        connect(core.q_in, coreMetabolicHeat.port);
        connect(skinBloodFlow.q_in, core.q_in);
        connect(GILumen.q_in,foodAbsorption. q_in);
        connect(foodAbsorption.q_out, core.q_in);
        connect(ambient.port, air.port_a);
      end ThermalBody_QHP;

      model SkinHeatTransferOnBloodFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood circulation through skin";
        Sources.UnlimitedHeat                                  core(T(displayUnit="degC")=
               310.15);
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15);
      equation
        connect(skinCirculation.q_in, core.port);
        connect(skin.port, skinCirculation.q_out);
      end SkinHeatTransferOnBloodFlow;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model HeatAccumulation "Accumulating of heat to substance"
        extends Icons.HeatAccumulation;
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=relativeHeat_start, storeUnit=
            "kcal");
        Interfaces.HeatPort_b
                         q_in "Heat inflow/outflow connector";

        parameter Types.Heat relativeHeat_start = 0
          "Heat start value = weight*(initialTemperature - 37degC)*specificHeat";

        parameter Types.SpecificHeatCapacity SpecificHeat= 4186.8
          "Mass specific heat";
        Types.Temperature T "Current temperature";

        Types.RealIO.HeatOutput relativeHeat
          "Current accumulated heat = weight*(T - 37degC)*specificHeat";     //nominal=1
       //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

        constant Types.Temperature NormalBodyTemperature = 310.15
          "Shift of absolute zero temperature to normal body values";

        parameter Boolean useMassInput = false "=true, if mass input is used";

        parameter Types.Mass Weight=1 "Total mass weight if useMassInput=false";
        Types.RealIO.MassInput weight(start=Weight)=m if useMassInput
          "Weight of mass, where the heat are accumulated";
      protected
        Types.Mass m;

      equation
        if not useMassInput then
          m=Weight;
        end if;

        q_in.T=NormalBodyTemperature + relativeHeat/(m*SpecificHeat);
        T = q_in.T;

        state = relativeHeat;  // der(relativeHeat)=q_in.q
        change = q_in.Q_flow;
      end HeatAccumulation;

      model IdealRadiator
        "Closed circiut radiator, where outflowed = ambient temperature"
        extends Interfaces.ConditionalMassFlow;
        extends Icons.Radiator;

        parameter Types.SpecificHeatCapacity SpecificHeat=3851.856
          "Specific heat of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

        Thermal.Interfaces.HeatPort_a
                         q_in;
        Thermal.Interfaces.HeatPort_b
                         q_out;
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
      //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
        q_in.Q_flow = q*(q_in.T-q_out.T)*SpecificHeat;

      end IdealRadiator;

      model Conductor "Heat resistor"
       extends Interfaces.OnePort;
       extends Icons.Resistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used";

        parameter Types.ThermalConductance Conductance=0
          "Thermal conductance if useConductanceInput=false";

        Types.RealIO.ThermalConductanceInput conductance(start=Conductance)=c if useConductanceInput;

      protected
         Types.ThermalConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

        q_in.Q_flow = c * (q_in.T - q_out.T);
      end Conductor;

      model Stream "Flow of whole heated mass"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalMassFlow;

        parameter Types.SpecificHeatCapacity SpecificHeat
          "Of flow circuit medium";

      equation
        q_in.Q_flow = if (q>0) then q*q_in.T*SpecificHeat else q*q_out.T*SpecificHeat;

      end Stream;

    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedHeat "Prescribed temperature"
        //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;

        parameter Boolean useTemperatureInput = false
          "=true, if fixed temperature is from input instead of parameter";

         parameter Types.Temperature T = 0
          "Fixed temperature at port if useTemperatureInput=false";

        parameter Boolean isIsolatedInSteadyState = false
          "=true, if there is no flow at port in steady state";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added.";

        Interfaces.HeatPort_b       port;

      protected
        Types.Temperature t "Current temperature";
      public
        Types.RealIO.TemperatureInput temperature(start=T)= t if useTemperatureInput;

      initial equation
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
          port.Q_flow = 0;
        end if;

      equation
        if not useTemperatureInput then
          t=T;
        end if;

        port.T = t;

        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
            port.Q_flow = 0;
        end if;

      end UnlimitedHeat;

      model MassOutflow
        "One-directional outflow of heated mass with enthalpy (vaporization heat)"
        extends Interfaces.ConditionalMassFlow;

        Interfaces.HeatPort_a
                         q_in "flow circuit";
        parameter Types.SpecificEnergy VaporizationHeat=0
          "Used for whole outflow stream";                                            // or 2428344 for water vaporization
        parameter Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      equation
      //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
        q_in.Q_flow = q*(q_in.T*SpecificHeat + VaporizationHeat);

      end MassOutflow;

      model MassInflow
        "One-directional inflow of heated mass with enthalpy (heat of solvation)"
        extends Interfaces.ConditionalMassFlow;
        extends Interfaces.ConditionalTemperature;

        Interfaces.HeatPort_b
                         q_out "flow circuit";
        parameter Types.SpecificEnergy dH=0
          "Enthalpy of incoming substance (i.e. enthalpy of solvation)";                                            // or 2428344 for water vaporization
        parameter Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Of inflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      equation
      //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
        q_out.Q_flow = - q*(temperature*SpecificHeat + dH);

      end MassInflow;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector HeatPort = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
      connector HeatPort_a "Heat inflow"
        extends HeatPort;

      end HeatPort_a;

      connector HeatPort_b "Heat outflow"
        extends HeatPort;


      end HeatPort_b;

      partial model OnePort "Heat OnePort"

        HeatPort_a       q_in;
        HeatPort_b       q_out;
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
      end OnePort;

      partial model ConditionalMassFlow
        "Input of mass flow vs. parametric mass flow"

        parameter Boolean useMassFlowInput = false
          "=true, if mass flow input is used instead of parameter MassFlow";

        parameter Types.MassFlowRate MassFlow=0
          "Mass flow if useMassFlowInput=false";

        Types.RealIO.MassFlowRateInput massFlow(start=MassFlow)=q if useMassFlowInput;

        Types.MassFlowRate q "Current mass flow";
      equation
        if not useMassFlowInput then
          q = MassFlow;
        end if;

      end ConditionalMassFlow;

      partial model ConditionalTemperature
        "Input of temperature vs. parametric temperature"

        parameter Boolean useTemperatureInput = false
          "=true, if temperature input is used instead of parameter T";

        parameter Types.Temperature T=0
          "Temperature if useTemperatureInput=false";

        Types.RealIO.TemperatureInput t(start=T)=temperature if useTemperatureInput;

        Types.Temperature temperature "Current temperature";
      equation
        if not useTemperatureInput then
          temperature = T;
        end if;

      end ConditionalTemperature;
    end Interfaces;
  end Thermal;

  package Population
    "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc."
    extends Modelica.Icons.Package;
    package Examples "Examples that demonstrate usage of the Population models"
       extends Modelica.Icons.ExamplesPackage;

      model PredatorPrey "Lotka–Volterra equations"
        extends Modelica.Icons.Example;

        Components.Population predator(population_start=2);
        Components.Reproduction reproduction2(useChangePerMemberInput=true);
        Components.Mortality mortality2(LifeTime(displayUnit="s") = 1);
        Components.Reproduction reproduction1(LifeTime(displayUnit="s") = 1);
        Components.Mortality mortality1(useChangePerMemberInput=true);
        Components.Population prey(population_start=1);
        Types.Constants.PopulationChangePerMemberConst
                                              preyMortality(LifeTime(displayUnit=
                "s") = 1);
        Blocks.Factors.Normalization predatorEffect;
        Types.Constants.PopulationChangePerMemberConst
                                              predatorReproduction(LifeTime(
              displayUnit="s") = 1);
        Blocks.Factors.Normalization preyEffekt;
      equation
        connect(preyMortality.y, predatorEffect.yBase);
        connect(predator.population, predatorEffect.u);
        connect(predatorReproduction.y, preyEffekt.yBase);
        connect(prey.population, preyEffekt.u);
        connect(reproduction2.port_b, predator.port);
        connect(predator.port, mortality2.port_a);
        connect(reproduction1.port_b, prey.port);
        connect(prey.port, mortality1.port_a);
        connect(preyEffekt.y, reproduction2.changePerMember);
        connect(predatorEffect.y, mortality1.changePerMember);
      end PredatorPrey;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model Population
        extends Icons.Population;
        extends SteadyStates.Interfaces.SteadyState(
        state(nominal=NominalPopulation),
        change(nominal=NominalPopulationChange),
        state_start=population_start,
        storeUnit="1");

        parameter Types.Population population_start(nominal=NominalPopulation) = 1e-8
          "Initial population size in compartment";

        parameter Types.Population NominalPopulation = 1
          "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount.";
        parameter Types.PopulationChange NominalPopulationChange = 1/(60*60*24)
          "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different.";

        Interfaces.PopulationPort_b port(population(nominal=NominalPopulation),change(nominal=NominalPopulationChange));

        Types.RealIO.PopulationOutput population(nominal=NominalPopulation);
      equation
        port.population = population;

        state = population; //der(population) = port.change;
        change = port.change;
      end Population;

      model Reproduction "As population change per one individual"
         extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_b port_b;
      equation
        port_b.change = - changePerPopulationMember * port_b.population;
      end Reproduction;

      model Mortality "As population change per one individual"
         extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_a port_a;
      equation
        port_a.change = changePerPopulationMember*port_a.population;
      end Mortality;

      model Stream "As population change per one individual"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalLifeTime;

      equation
        port_a.change = if (changePerPopulationMember>0) then changePerPopulationMember*port_a.population else changePerPopulationMember*port_b.population;
      end Stream;

      model Change
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalChange;

      equation
        port_a.change = change;
      end Change;
    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model Growth
       extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_b port_b;
      equation
        port_b.change = - change;
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
      connector PopulationPort
        "Average number of population members and their change"
        Types.Population population "Average number of population individuals";
        flow Types.PopulationChange change
          "Average population change = change of population individuals";
      end PopulationPort;

      connector PopulationPort_a "Increase (or decrease) of population"
        extends PopulationPort;


      end PopulationPort_a;

      connector PopulationPort_b "Decrease (or increase) of population"
        extends PopulationPort;


      end PopulationPort_b;

      partial model OnePort
        "Partial change of population between two ports without its accumulation"

        PopulationPort_b port_b;
        PopulationPort_a port_a;
      equation
        port_a.change + port_b.change = 0;
      end OnePort;

      partial model ConditionalChange
        "Input of population change vs. parametric constant change"

        parameter Boolean useChangeInput = false
          "=true, if real input connector is used instead of parameter PopulationChange";

        parameter Types.PopulationChange PopulationChange=0
          "Population change if useChangeInput=false";

        Types.RealIO.PopulationChangeInput populationChange(start=PopulationChange)=change if   useChangeInput;

        Types.PopulationChange change "Current population change";
      equation
        if not useChangeInput then
          change = PopulationChange;
        end if;

      end ConditionalChange;

      partial model ConditionalLifeTime
        "Input of population change per one population member vs. parametric lifetime"

        parameter Boolean useChangePerMemberInput = false
          "=true, if real input connector is used instead of parameter LifeTime";

        parameter Types.Time LifeTime=1e-8
          "Mean life time for population (=1.44*halftime) if useChangePerMember=false";

        Types.RealIO.PopulationChangePerMemberInput changePerMember(start=1/LifeTime)=changePerPopulationMember if useChangePerMemberInput;

        Types.PopulationChangePerMember changePerPopulationMember
          "Current population change per individual";
      equation
        if not useChangePerMemberInput then
          changePerPopulationMember = 1/LifeTime;
        end if;

      end ConditionalLifeTime;
    end Interfaces;
  end Population;

  package SteadyStates "Dynamic Simulation / Steady State"
    extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model SimpleReaction_in_Equilibrium
        extends Modelica.Icons.Example;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=Types.SimulationType.SteadyState);
        Chemical.Components.Substance A(Simulation=Types.SimulationType.SteadyState,
            solute_start=0.9);
        Chemical.Components.ChemicalReaction reaction(K=1);
        Chemical.Components.Substance B(
          Simulation=Types.SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1);

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]);
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]);
        connect(B.q_out,reaction. products[1]);
        connect(A.q_out,reaction. substrates[1]);
      end SimpleReaction_in_Equilibrium;

      model SimpleReaction_NormalInit
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=Types.SimulationType.NormalInit);
        Chemical.Components.Substance A(Simulation=Types.SimulationType.NormalInit,
            solute_start=0.9);
        Chemical.Components.ChemicalReaction reaction(K=1);
        Chemical.Components.Substance B(
          isDependent=true,
          Simulation=Types.SimulationType.NormalInit,
          solute_start=0.1);

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]);
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]);
        connect(B.q_out,reaction. products[1]);
        connect(A.q_out,reaction. substrates[1]);
      end SimpleReaction_NormalInit;

      model SimpleReaction_InitSteadyState
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=Types.SimulationType.InitSteadyState);
        Chemical.Components.Substance A(Simulation=Types.SimulationType.InitSteadyState,
            solute_start=0.9);
        Chemical.Components.ChemicalReaction reaction(K=1);
        Chemical.Components.Substance B(
          isDependent=true,
          Simulation=Types.SimulationType.InitSteadyState,
          solute_start=0.1);

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]);
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]);
        connect(B.q_out,reaction. products[1]);
        connect(A.q_out,reaction. substrates[1]);
      end SimpleReaction_InitSteadyState;

      model SimpleReaction2_in_Equilibrium
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        Chemical.Components.Substance A(Simulation=SimulationType.SteadyState,
            solute_start=0.9);
        Chemical.Components.ChemicalReaction reaction(K=1, nP=2);
        Chemical.Components.Substance B(
          Simulation=SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1);

        Chemical.Components.Substance C(
          Simulation=SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1);

        Components.MolarConservationLaw totalB_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=SimulationType.SteadyState);
        Components.MolarConservationLaw totalC_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=SimulationType.SteadyState);
      equation
        connect(A.q_out,reaction. substrates[1]);
        connect(reaction.products[1],B. q_out);
        connect(reaction.products[2],C. q_out);
        connect(A.solute, totalB_ConservationLaw.fragment[1]);
        connect(B.solute, totalB_ConservationLaw.fragment[2]);
        connect(C.solute, totalC_ConservationLaw.fragment[1]);
        connect(A.solute, totalC_ConservationLaw.fragment[2]);

      end SimpleReaction2_in_Equilibrium;

      model O2_in_water
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

      public
        Chemical.Components.Substance oxygen_dissolved(
          Simulation=SimulationType.SteadyState,
          solute_start=0.000001*7.875647668393782383419689119171e-5,
          isDependent=true);
        Modelica.Blocks.Sources.Clock oxygenPartialPressure(offset=1e-06);
        Modelica.Blocks.Sources.Sine temperature(
          amplitude=10,
          freqHz=1/60,
          offset=310.15);
        Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
          prescribedTemperature;
        Chemical.Components.GasSolubility gasSolubility(
          useHeatPort=true,
          kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
          C=1700);
        Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage(
          Simulation=Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          useHeatPort=true,
          T=295.15);
      equation

        connect(temperature.y, prescribedTemperature.T);
        connect(oxygen_dissolved.q_out, gasSolubility.q_in);
        connect(prescribedTemperature.port, gasSolubility.heatPort);
        connect(oxygenPartialPressure.y, unlimitedGasStorage.partialPressure);
        connect(unlimitedGasStorage.q_out, gasSolubility.q_out);
        connect(prescribedTemperature.port, unlimitedGasStorage.heatPort);
      end O2_in_water;

      model Allosteric_Hemoglobin_MWC
      extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

      //extends SteadyStates.Interfaces.SteadyStateSystem(
      //                                         Simulation=SteadyStates.SimulationType.SteadyState);
      //=States.SimulationType.NoInit); for dynamic simulation
      protected
        parameter Types.GasSolubility alpha =  0.0105 * 1e-3
          "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
        parameter Types.Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Types.Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Types.Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";
      //  Types.Fraction sO2 "hemoglobin oxygen saturation";

      //  parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
      //  Types.AmountOfSubstance totalAmountOfRforms;
      //  Types.AmountOfSubstance totalAmountOfTforms;

      public
        Chemical.Components.Substance T0(
          stateName="T0",
          Simulation=SimulationType.SteadyState,
          solute_start=1);

        Chemical.Components.Substance T1(
          stateName="T1",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance R1(
          stateName="R1",
          Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true);

        Chemical.Components.Substance T2(
          stateName="T2",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance R2(
          stateName="R2",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance T3(
          stateName="T3",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance R3(
          stateName="R3",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance T4(
          stateName="T4",
          Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true);

        Chemical.Components.Substance R4(
          stateName="R4",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.Substance R0(
          stateName="R0",
          Simulation=SimulationType.SteadyState,
          solute_start=0);

        Chemical.Components.ChemicalReaction quaternaryForm(K=L);
        Chemical.Components.ChemicalReaction oxyR1(nP=2, K=KR/4);
        Chemical.Components.ChemicalReaction oxyT1(nP=2, K=KT/4);
        Chemical.Components.ChemicalReaction oxyR2(nP=2, K=KR/(3/2));
        Chemical.Components.ChemicalReaction oxyR3(nP=2, K=KR/(2/3));
        Chemical.Components.ChemicalReaction oxyR4(nP=2, K=KR*4);
        Chemical.Components.ChemicalReaction oxyT2(nP=2, K=KT/(3/2));
        Chemical.Components.ChemicalReaction oxyT3(nP=2, K=KT/(2/3));
        Chemical.Components.ChemicalReaction oxyT4(nP=2, K=KT*4);
        Chemical.Components.ChemicalReaction quaternaryForm1(K=c*L);
        Chemical.Components.ChemicalReaction quaternaryForm2(K=(c^2)*L);
        Chemical.Components.ChemicalReaction quaternaryForm3(K=(c^3)*L);
        Chemical.Components.ChemicalReaction quaternaryForm4(K=(c^4)*L);

        Chemical.Components.Substance oxygen_unbound(solute_start=0.000001*
              7.875647668393782383419689119171e-5, Simulation=SimulationType.SteadyState);
        Modelica.Blocks.Sources.Clock clock(offset=60);
        SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
          n=10, Total(displayUnit="mol") = 1,
          Simulation=Types.SimulationType.SteadyState);

        Chemical.Sources.UnlimitedGasStorage O2_in_air(
          Simulation=Types.SimulationType.SteadyState,
          T=295.15,
          usePartialPressureInput=true);
        Chemical.Components.GasSolubility gasSolubility(
          useHeatPort=false,
          kH_T0=0.026029047188736,
          C=1700);
        Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8);
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation";
        Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10));
      equation
       // sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*hemoglobinConservationLaw.Total);
       // totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
       //  totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

       //  totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

        connect(quaternaryForm.products[1],T0. q_out);
        connect(oxyR1.products[2], oxygen_unbound.q_out);
        connect(oxyR2.products[2], oxygen_unbound.q_out);
        connect(oxyR3.products[2], oxygen_unbound.q_out);
        connect(oxyR4.products[2], oxygen_unbound.q_out);
        connect(oxyR1.substrates[1],R1. q_out);
        connect(R1.q_out,oxyR2. products[1]);
        connect(oxyR2.substrates[1],R2. q_out);
        connect(oxyR3.substrates[1],R3. q_out);
        connect(oxyR3.products[1],R2. q_out);
        connect(R3.q_out,oxyR4. products[1]);
        connect(oxyR4.substrates[1],R4. q_out);
        connect(oxyT1.products[1],T0. q_out);
        connect(oxyT1.substrates[1],T1. q_out);
        connect(oxygen_unbound.q_out, oxyT1.products[2]);
        connect(oxygen_unbound.q_out, oxyT2.products[2]);
        connect(oxygen_unbound.q_out, oxyT3.products[2]);
        connect(oxygen_unbound.q_out, oxyT4.products[2]);
        connect(T1.q_out,oxyT2. products[1]);
        connect(oxyT2.substrates[1],T2. q_out);
        connect(T2.q_out,oxyT3. products[1]);
        connect(oxyT3.substrates[1],T3. q_out);
        connect(T3.q_out,oxyT4. products[1]);
        connect(oxyT4.substrates[1],T4. q_out);
        connect(R0.q_out,quaternaryForm. substrates[1]);
        connect(R0.q_out,oxyR1. products[1]);
        connect(R1.q_out,quaternaryForm1. substrates[1]);
        connect(quaternaryForm1.products[1],T1. q_out);
        connect(R2.q_out,quaternaryForm2. substrates[1]);
        connect(quaternaryForm2.products[1],T2. q_out);
        connect(R3.q_out,quaternaryForm3. substrates[1]);
        connect(quaternaryForm3.products[1],T3. q_out);
        connect(R4.q_out,quaternaryForm4. substrates[1]);
        connect(quaternaryForm4.products[1],T4. q_out);
        connect(R4.solute, hemoglobinConservationLaw.fragment[1]);
        connect(T4.solute, hemoglobinConservationLaw.fragment[2]);
        connect(R3.solute, hemoglobinConservationLaw.fragment[3]);
        connect(T3.solute, hemoglobinConservationLaw.fragment[4]);
        connect(R2.solute, hemoglobinConservationLaw.fragment[5]);
        connect(T2.solute, hemoglobinConservationLaw.fragment[6]);
        connect(R1.solute, hemoglobinConservationLaw.fragment[7]);
        connect(T1.solute, hemoglobinConservationLaw.fragment[8]);
        connect(R0.solute, hemoglobinConservationLaw.fragment[9]);
        connect(T0.solute, hemoglobinConservationLaw.fragment[10]);
        connect(oxygen_unbound.q_out, gasSolubility.q_in);
        connect(O2_in_air.q_out, gasSolubility.q_out);
        connect(clock.y, O2_in_air.partialPressure);
        connect(R1.solute, oxygen_bound.u[1]);
        connect(T1.solute, oxygen_bound.u[2]);
        connect(R2.solute, oxygen_bound.u[3]);
        connect(T2.solute, oxygen_bound.u[4]);
        connect(R3.solute, oxygen_bound.u[5]);
        connect(T3.solute, oxygen_bound.u[6]);
        connect(R4.solute, oxygen_bound.u[7]);
        connect(T4.solute, oxygen_bound.u[8]);
        connect(oxygen_bound.y, sO2_.u1);
        connect(sO2_.u2, tHb.y);
        connect(R0.solute, tHb.u[1]);
        connect(T0.solute, tHb.u[2]);
        connect(R1.solute, tHb.u[3]);
        connect(T1.solute, tHb.u[4]);
        connect(R2.solute, tHb.u[5]);
        connect(T2.solute, tHb.u[6]);
        connect(R3.solute, tHb.u[7]);
        connect(T3.solute, tHb.u[8]);
        connect(R4.solute, tHb.u[9]);
        connect(T4.solute, tHb.u[10]);
      end Allosteric_Hemoglobin_MWC;

      model Allosteric_Hemoglobin2_MWC
        "Allosteric hemoglobin model implemented by Speciation blocks"

       extends Chemical.Examples.Hemoglobin.Allosteric_Hemoglobin2_MWC;

      end Allosteric_Hemoglobin2_MWC;

      model CardiovascularSystem_GCG_SteadyState
        "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
         //extends Modelica.Icons.Example;
         extends Hydraulic.Examples.CardiovascularSystem_GCG(
          pulmonaryArteries(Simulation=Types.SimulationType.SteadyState),
          pulmonaryVeinsAndLeftAtrium(Simulation=Types.SimulationType.SteadyState),
          rightAtrium(Simulation=Types.SimulationType.SteadyState),
          arteries(Simulation=Types.SimulationType.SteadyState),
          veins(Simulation=Types.SimulationType.SteadyState,
              isDependent=true));

        import Physiolibrary.Types.*;

         Components.MassConservationLaw bloodVolume(
          n=5,
          Simulation=Types.SimulationType.SteadyState,
          Total=0.005);
      equation
         connect(pulmonaryArteries.volume, bloodVolume.fragment[4]);
        connect(pulmonaryVeinsAndLeftAtrium.volume, bloodVolume.fragment[5]);
         connect(rightAtrium.volume, bloodVolume.fragment[1]);
        connect(veins.volume, bloodVolume.fragment[2]);
        connect(arteries.volume, bloodVolume.fragment[3]);
      end CardiovascularSystem_GCG_SteadyState;

      model ThermalBody_QHP_STeadyState
        extends Thermal.Examples.ThermalBody_QHP(
          skin(Simulation=Types.SimulationType.SteadyState),
          skeletalMuscle(Simulation=Types.SimulationType.SteadyState,
              isDependent=true),
          core(Simulation=Types.SimulationType.SteadyState),
          GILumen(Simulation=Types.SimulationType.SteadyState));

        Components.EnergyConservationLaw energyConservationLaw(
          n=4,
          Simulation=Types.SimulationType.SteadyState,
          useTotalInput=false,
          Total=-8373.6);
      equation
        connect(core.relativeHeat, energyConservationLaw.fragment[1]);
        connect(skin.relativeHeat, energyConservationLaw.fragment[2]);
        connect(skeletalMuscle.relativeHeat, energyConservationLaw.fragment[3]);

        connect(GILumen.relativeHeat, energyConservationLaw.fragment[4]);
      end ThermalBody_QHP_STeadyState;

      model Cells_SteadyState
       extends Osmotic.Examples.Cell(
          cells(Simulation=Types.SimulationType.SteadyState,
              isDependent=true),
          interstitium(Simulation=Types.SimulationType.SteadyState),
          interstitium1(Simulation=Types.SimulationType.SteadyState),
          cells1(Simulation=Types.SimulationType.SteadyState,
              isDependent=true));
        Components.MassConservationLaw waterConservationLaw(
          n=2,
          Simulation=Types.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002);
        Components.MassConservationLaw waterConservationLaw1(
          n=2,
          Simulation=Types.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002);
      equation

        connect(cells.volume, waterConservationLaw.fragment[1]);
        connect(interstitium.volume, waterConservationLaw.fragment[2]);
        connect(cells1.volume, waterConservationLaw1.fragment[1]);
        connect(interstitium1.volume, waterConservationLaw1.fragment[2]);
      end Cells_SteadyState;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model EnergyConservationLaw "System Energy conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.EnergyInput fragment[n] "Mass/Energy fragment";

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input";

        parameter Types.Energy Total = 1
          "Total mass/energy if useTotalAsInput=false";

        Types.RealIO.EnergyInput total(start=Total) = t if useTotalInput;

        Types.Energy t "Current Mass/Energy";

      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

      end EnergyConservationLaw;

      model MassConservationLaw
        "System Mass (incompresible volume) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.VolumeInput fragment[n] "Mass/Energy fragment";

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input";

        parameter Types.Volume Total = 1
          "Total mass/energy if useTotalAsInput=false";

        Types.RealIO.VolumeInput total(start=Total) = t if useTotalInput;

        Types.Volume t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(abs(fragment));

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

      end MassConservationLaw;

      model MolarConservationLaw
        "System Amount of substance (=number of molecules) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.AmountOfSubstanceInput fragment[n] "Mass/Energy fragment";

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input";

        parameter Types.AmountOfSubstance Total = 1
          "Total mass/energy if useTotalAsInput=false";

        Types.RealIO.AmountOfSubstanceInput total(start=Total) = t if useTotalInput;

        Types.AmountOfSubstance t "Current Mass/Energy";
        Types.RealIO.AmountOfSubstanceOutput totalAmountOfSubstance;
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(abs(fragment));

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);
        totalAmountOfSubstance = t;

      end MolarConservationLaw;

      model ElectricChargeConservationLaw
        "System amount of electric charge (=number of elementary charges) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Types.RealIO.ElectricChargeInput fragment[n] "Mass/Energy fragment";

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input";

        parameter Types.ElectricCharge Total = 1
          "Total mass/energy if useTotalAsInput=false";

        Types.RealIO.ElectricChargeInput total(start=Total) = t if useTotalInput;

        Types.ElectricCharge t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

      end ElectricChargeConservationLaw;

      model ElementaryChargeConservationLaw
        "System amount of electric charge (=number of elementary charges) conservation law"
        extends SteadyStates.Interfaces.SteadyStateSystem;
                                              //(Simulation=Types.SimulationType.SteadyState);
        extends Icons.ConservationLaw;

        parameter Integer NumberOfParticles=1 "Number of mass/energy fragments";
        parameter Integer Charges[NumberOfParticles] = {1}
          "Elementary charges of particles";

        Types.RealIO.AmountOfSubstanceInput fragment[NumberOfParticles]
          "Mass/Energy fragment";

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input";

        parameter Types.ElectricCharge Total = 1
          "Total mass/energy if useTotalAsInput=false";

        Types.RealIO.ElectricChargeInput total(start=Total)=t if
          useTotalInput;

        Types.ElectricCharge t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        //original meaning:
        t*normalizedState[1] = Modelica.Constants.F*Charges*abs(fragment); //elementary charge from Eq to C

        //hacked, but still the same:  (because Dymola find steady state solution for specific problems in negative concentrations, when abs() not used)
        //t*normalizedState[1] = Modelica.Constants.F*(Charges[1]*(if noEvent(fragment[1]>=0) then fragment[1] else -fragment[1]) + sum(Charges[i]*fragment[i] for i in 2:NumberOfParticles));

      end ElementaryChargeConservationLaw;
    end Components;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      partial model SteadyState
        "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'

        replaceable package Utilities = Types.FilesUtilities(directoryName=dirName)
                                                                        constrainedby
          Types.Utilities "How to store or load the values";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "Dynamic with Initialization or Steady State";

        parameter Boolean isDependent = false
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc.";

        parameter Real state_start "State start or init value";

        Real state(start=if LOAD_STARTS then Utilities.readReal(stateName, storeUnit) else
       state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition";
        Real change "Dynamic change of state value per minute";

        constant String dirName = "io" "Directory name to save and load values";

        parameter String storeUnit="" "Unit in Utilities input/output function";

        parameter String stateName=getInstanceName()
          "Name in Utilities input/output function";

        parameter Boolean LOAD_STARTS = false "Load start value of state";

        parameter Boolean SAVE_RESULTS = false "Save final state values";

        parameter Boolean SAVE_COMPARISON = false
          "Compare final state values with original values";

      protected
        parameter Real defaultValue(fixed=false) "Default value of state.";
        parameter Real initialValue(fixed=false) "Initial value of state.";

      initial equation

        if Simulation == Types.SimulationType.NormalInit then
          state = state_start;
        elseif Simulation == Types.SimulationType.ReadInit then
          state = Utilities.readReal(stateName, storeUnit);
        elseif Simulation == Types.SimulationType.InitSteadyState and not isDependent then
          der(state)=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_COMPARISON then
          defaultValue = Utilities.readReal(stateName, storeUnit);
        else
          defaultValue = Modelica.Constants.N_A;
        end if;
      equation

        when terminal() then
          if SAVE_RESULTS then
            Utilities.writeReal(
              stateName,
              state,
              storeUnit);
          end if;
          if SAVE_COMPARISON then
            Utilities.writeComparison(
              stateName,
              defaultValue,
              initialValue,
              state,
              storeUnit);
          end if;
        end when;

        if Simulation <> Types.SimulationType.SteadyState then
          der(state) = change;
        elseif not isDependent then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependent equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
           change = 0;
        end if;

      end SteadyState;

      partial model SteadyStates
        "Abstract class for any dynamic states calculation (for any derivations), which is driven by SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'

        replaceable package Utilities = Types.FilesUtilities            constrainedby
          Types.Utilities "How to store or load the values";

        parameter Integer n "Number of states";

        Real state[n](start=state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition";

        Real change[n] "Dynamic change of state value per minute";

        parameter Real state_start[n] "State start or init value";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "Dynamic with Initialization or Steady State";

        constant String dirName = "io" "Directory name to save and load values";

        parameter Boolean SAVE_RESULTS = false
          "save and test final state values with original values";
        parameter Boolean SAVE_COMPARISON = false
          "Compare final state values with original values";

        parameter String storeUnit[n]=fill("",n)
          "Unit in Utilities input/output function";

        parameter String stateName[n]=fill(getInstanceName(),n)
          "Name in Utilities input/output function";

        parameter Boolean isDependent[n]= fill(false,n)
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc.";

      protected
        parameter Real defaultValue[n](fixed=false) "Default value of state.";
        parameter Real initialValue[n](fixed=false) "Initial value of state.";

      initial equation
        for i in 1:n loop
        if Simulation == Types.SimulationType.NormalInit then
          state[i] = state_start[i];
        elseif Simulation == Types.SimulationType.ReadInit then
            state[i] = Utilities.readReal(stateName[i] + "[" +String(i)+"]", storeUnit[i]);
        elseif Simulation == Types.SimulationType.InitSteadyState and not isDependent[i] then
          der(state[i])=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_COMPARISON then
          defaultValue[i] = Utilities.readReal(stateName[i]+ "[" +String(i)+"]", storeUnit[i]);
        else
          defaultValue[i] = Modelica.Constants.N_A;
        end if;
        end for;
      equation

        when terminal() then
          if SAVE_RESULTS then
            for i in 1:n loop
              Utilities.writeReal(
                stateName[i]+ "[" +String(i)+"]",
                state[i],
                storeUnit[i]);
            end for;
          end if;
          if SAVE_COMPARISON then
            for i in 1:n loop
              Utilities.writeComparison(
                stateName[i]+ "[" +String(i)+"]",
                defaultValue[i],
                initialValue[i],
                state[i],
                storeUnit[i]);
            end for;
          end if;
        end when;

        if Simulation <> Types.SimulationType.SteadyState then
          der(state) = change;
        else
          for i in 1:n loop
            if not isDependent[n] then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependent equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
              change[i] = 0;
            end if;
          end for;
        end if;

      end SteadyStates;

      partial class SteadyStateSystem
        "Global abstract class, for additional global state equations"

        parameter Types.SimulationType  Simulation(start=Types.SimulationType.NormalInit)
          "Dynamic with Initialization or Steady State";

        parameter Integer NumberOfDependentStates=1
          "Number of additional steady state equation of the system";

        Real normalizedState[NumberOfDependentStates]
          "Normalized independent masses of the system/Normalized independent energies of the system/... This variables must always equals to ones.";

      protected
        Real state[NumberOfDependentStates](each start=1)
          "In differential systems has the same meaning as the normalizedState. In steady state has no meaning.";

      initial equation
        if (Simulation == Types.SimulationType.SteadyState) or
                                                       (Simulation == Types.SimulationType.InitSteadyState) then
          state=ones(NumberOfDependentStates);
        end if;
      equation

        if Simulation == Types.SimulationType.SteadyState then
          normalizedState = ones(NumberOfDependentStates); //add additional global steady-state equations
          der(state)=zeros(NumberOfDependentStates);       //remove 'state' from system calculations
        else
          normalizedState = state; //nothing special, just definition of 'state' variable

          //Correct definition of normalizedState should fulfill the equation 'normalizedState=ones(NumberOfDependentStates)' during simulation.
          //The difference from vector 'ones(NumberOfDependentStates)' could be used as the solver calculation error vector.
        end if;

      end SteadyStateSystem;
    end Interfaces;
  end SteadyStates;

  package Icons "Icons for physiological models"
    //extends Modelica.Icons.IconsPackage;
    extends Modelica.Icons.Package;
    package Library
        extends Modelica.Icons.Package;
    end Library;

    class Golem

    end Golem;

    class CardioVascular

    end CardioVascular;

    class Water

    end Water;

    class Electrolytes

    end Electrolytes;

    class Proteins

    end Proteins;

    class Gases

    end Gases;

    class NutrientsMetabolism

    end NutrientsMetabolism;

    class Heat

    end Heat;

    class Hormones

    end Hormones;

    class Nerves

    end Nerves;

    class Setup

    end Setup;

    class Status

    end Status;

    class SkeletalMuscle

    end SkeletalMuscle;

    class Bone

    end Bone;

    class OtherTissue

    end OtherTissue;

    class RespiratoryMuscle

    end RespiratoryMuscle;

    class Fat

    end Fat;

    class Skin

    end Skin;

    class Brain

    end Brain;

    class GITract

    end GITract;

    class LeftHeart

    end LeftHeart;

    class RightHeart

    end RightHeart;

    class Liver

    end Liver;

    class Kidney

    end Kidney;

    class Bladder

    end Bladder;

    class GILumen

    end GILumen;

    class ThyroidGland

    end ThyroidGland;

    class Pancreas

    end Pancreas;

    class AdrenalGland

    end AdrenalGland;

    class Lungs

    end Lungs;

    class Tissues


    end Tissues;

    class Peritoneum

    end Peritoneum;

    class Plasma

    end Plasma;

    class Hypophysis

    end Hypophysis;

    class Heart

    end Heart;

    class SweatGland

    end SweatGland;

    class Cell

    end Cell;

    class HeatLib
      extends BaseLib;

    end HeatLib;

    class StatusLib
      extends BaseLib;

    end StatusLib;

     class NervesLib
      extends BaseLib;

     end NervesLib;

    class NutrientsMetabolismLib
      extends BaseLib;

    end NutrientsMetabolismLib;

    class OxygenLib
      extends BaseLib;
    end OxygenLib;

    class ProteinsLib
      extends BaseLib;

    end ProteinsLib;

    class SetupLib
      extends BaseLib;

    end SetupLib;

    class CardioVascularLib
      extends BaseLib;

    end CardioVascularLib;

    class WaterLib
     extends BaseLib;

    end WaterLib;

     class KidneyLib
      extends BaseLib;

     end KidneyLib;

    class ElectrolytesLib
      extends BaseLib;

    end ElectrolytesLib;

    class GasesLib
      extends BaseLib;

    end GasesLib;

    class GolemLib
      extends BaseLib;
    end GolemLib;

    package BaseLib
      extends Modelica.Icons.Package;
    end BaseLib;

    class HormonesLib
      extends BaseLib;

    end HormonesLib;

     class AutonomicControlLib
      extends BaseLib;

     end AutonomicControlLib;

    partial class Resistor

    end Resistor;

    class Lymph

    end Lymph;

    class RespiratoryCenter

    end RespiratoryCenter;

    class Oxygen

    end Oxygen;

    class CarbonDioxide

    end CarbonDioxide;

    class AcidBase

    end AcidBase;

    class Ventilation

    end Ventilation;

    class PeripheralChemoreceptors

    end PeripheralChemoreceptors;

    class HeatCore

    end HeatCore;

    class Glycogen

    end Glycogen;

    class Lipids

    end Lipids;

    class KetoAcids

    end KetoAcids;

    class Glucose

    end Glucose;

    class Lactate

    end Lactate;

    class AminoAcids

    end AminoAcids;

    class Urea

    end Urea;

    class MetabolismPart

    end MetabolismPart;

    class CellularMetabolism

    end CellularMetabolism;

    class FemaleSex

    end FemaleSex;

    class Barroreceptor

    end Barroreceptor;

    class NervusVagus

    end NervusVagus;

    class SympatheticNerves

    end SympatheticNerves;

    class PhysicalExercise

    end PhysicalExercise;

    class SinoatrialNode

    end SinoatrialNode;

    block StatusNormal

    end StatusNormal;

    block StatusConfused

    end StatusConfused;

    block StatusImpaired

    end StatusImpaired;

    block StatusNotBreathing

    end StatusNotBreathing;

    block StatusComatose

    end StatusComatose;

    block StatusMayBeDead

    end StatusMayBeDead;

    block StatusIsReallyDead

    end StatusIsReallyDead;

    class SkeletalMuscleAcidity

    end SkeletalMuscleAcidity;

    class Sodium

    end Sodium;

    class Potassium

    end Potassium;

    class Phosphate

    end Phosphate;

    class Sulphate

    end Sulphate;

    class Amonium

    end Amonium;

    class Chloride

    end Chloride;

    class LungShunt

    end LungShunt;

    class Hydrostatics

    end Hydrostatics;

    class UpperTorso

    end UpperTorso;

    class MiddleTorso

    end MiddleTorso;

    class LowerTorso

    end LowerTorso;

    class RedCells

    end RedCells;

    class SystemicCirculation

    end SystemicCirculation;

    class PulmonaryCirculation

    end PulmonaryCirculation;

    class Blood

    end Blood;

    class BaseFactorIcon0

    end BaseFactorIcon0;

    partial class BaseFactorIcon

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon;

    partial class BaseFactorIcon2

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon2;

    partial class BaseFactorIcon3

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon3;

    partial class BaseFactorIcon4

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon4;

    partial class BaseFactorIcon5

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon5;

    partial class BaseFactorIcon6

      Modelica.Blocks.Interfaces.RealInput yBase;
      Modelica.Blocks.Interfaces.RealOutput y;

    end BaseFactorIcon6;

    partial class ConversionIcon "Base icon for conversion functions"


    end ConversionIcon;

    partial class Diffusion


    end Diffusion;

    class Substance

    end Substance;

    class Speciation

    end Speciation;

    class MolarFlowMeasure

    end MolarFlowMeasure;

    class GasSolubility

    end GasSolubility;

    class Reabsorption

    end Reabsorption;

    class Reabsorption2

    end Reabsorption2;

    class Dilution

    end Dilution;

    class ElasticBalloon

    end ElasticBalloon;

    class BloodElasticCompartment

    end BloodElasticCompartment;

    class BloodSequesteredCompartment

    end BloodSequesteredCompartment;

    partial class HydraulicResistor

    end HydraulicResistor;

    class FlowMeasure

    end FlowMeasure;

    class Membrane

    end Membrane;

    class PressureMeasure

    end PressureMeasure;

    class InternalElasticBalloon

    end InternalElasticBalloon;

    class Inertance

    end Inertance;

    class HydrostaticGradient


    end HydrostaticGradient;

    class Radiator

    end Radiator;

    class MichaelisMenten

    end MichaelisMenten;

    class HeatAccumulation

    end HeatAccumulation;

    class OsmoticCell

    end OsmoticCell;

    class IdealGas

    end IdealGas;

    class PartialPressure

    end PartialPressure;

    class ConservationLaw

    end ConservationLaw;

    class Nephron

    end Nephron;

    class Torso

    end Torso;

    class PerfusionOD

    end PerfusionOD;

    class PerfusionDO

    end PerfusionDO;

    class CollapsingVessel

    end CollapsingVessel;

    class PeripheralCirculation

    end PeripheralCirculation;

    class HeartVentricle

    end HeartVentricle;

    class Population

    end Population;

    class FlowFiltration

    end FlowFiltration;

    class Microcirculation

    end Microcirculation;
  end Icons;

  package Types "Physiological units with nominals"
    //extends Modelica.Icons.TypesPackage;
    extends Modelica.Icons.Package;
  //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

    package UsersGuide "User's Guide"
      extends Modelica.Icons.Information;

    class NewType "Adding new type"
      extends Modelica.Icons.Information;

    end NewType;

    end UsersGuide;

    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model Units
      extends Modelica.Icons.Example;
       model ParametricClass

        parameter Temperature temperature;
        parameter Heat heat;
        parameter Pressure pressure;
        parameter Volume volume;
        parameter AmountOfSubstance amountOfSubstance;
        parameter ElectricCharge electricCharge;
        parameter ElectricCurrent electricCurrent;

        parameter Time time_;
        parameter Energy energy;
        parameter Mass mass;
        parameter ElectricPotential electricalPotential;
        parameter MassFlowRate massFlowRate;
        parameter Density density;
        parameter Height height;
        parameter Acceleration acceleration;

        parameter VolumeFlowRate volumeFlowRate;
        parameter Concentration concentration;
        parameter Osmolarity osmolarity;

        parameter MolarFlowRate molarFlowRate;
         parameter HeatFlowRate heatFlowRate;
        parameter ThermalConductance thermalConductance;
        parameter SpecificHeatCapacity specificHeatCapacity;
        parameter SpecificEnergy specificEnergy(displayUnit="cal/g");

        parameter Fraction fraction;
        parameter OsmoticPermeability osmoticPermeability;
        parameter DiffusionPermeability diffusionPermeability;
        parameter HydraulicConductance hydraulicConductance;
        parameter HydraulicInertance hydraulicInertance;
        parameter GasSolubility gasSolubility;

        parameter AmountOfSubstance gasSTP(displayUnit="litre_STP");
        parameter AmountOfSubstance gasSATP(displayUnit="litre_SATP");
        parameter AmountOfSubstance gasNIST(displayUnit="litre_NIST");

       end ParametricClass;

        ParametricClass parametricClass(
          acceleration=1,
          concentration=1,
          osmolarity=1,
          gasSTP(displayUnit="litre_STP") = 0.0440316172572,
          mass(displayUnit="ug") = 1e-09,
          temperature=274.15,
          heat=4186.8,
          pressure=133.322387415,
          volume=1e-06,
          amountOfSubstance=0.001,
          electricCharge=96.4853399,
          electricCurrent=1.6080889983333,
          time_=60,
          energy=4186.8,
          electricalPotential=0.001,
          massFlowRate=1.6666666666667e-08,
          density=1000,
          height=0.01,
          volumeFlowRate=1.6666666666667e-08,
          molarFlowRate=1.6666666666667e-05,
          heatFlowRate=69.78,
          thermalConductance=69.78,
          specificHeatCapacity=4186.8,
          specificEnergy=4186.8,
          fraction=0.01,
          osmoticPermeability=1.2501026264094e-10,
          diffusionPermeability=1.6666666666667e-08,
          hydraulicConductance=1.2501026264094e-10,
          hydraulicInertance=479960594694,
          gasSolubility=2.4789568751177,
          gasSATP=0.040339548059044,
          gasNIST=0.041571199502531);
      end Units;

      package IO_Bus
        import Physiolibrary;
        extends Physiolibrary.Types.IO_Bus;

        redeclare model extends Variables "Example of subsystem outputs"

          T.Pressure Bone_PO2(varName="Bone-Flow.PO2")
            "Partial oxygen pressure in bone blood venules.";
          T.VolumeFlowRate BoneBloodFlow(varName="Bone-Flow.BloodFlow")
            "Blood flow through bones";
          T.MolarFlowRate BoneO2Need(varName="Bone-Metabolism.O2-Need")
            "Current desired delivery flow of oxygen to bone metabolism";
          T.Volume BoneLiquidVol(varName="Bone-Tissue.LiquidVol")
            "The extravascular water in bones. ";

        equation
          connect(Bone_PO2.y, busConnector.Bone_PO2);
          connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow);
          connect(BoneO2Need.y, busConnector.Bone_O2Need);
          connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol);
        end Variables;

        model Test
          import Physiolibrary;
          extends Modelica.Icons.Example;

          Physiolibrary.Types.BusConnector busConnector;
          Physiolibrary.Types.Examples.IO_Bus.OutputToFile outputToFile;
          Physiolibrary.Types.Constants.PressureConst
                     Bone_PO2(k=5599.54027143)
            "Partial oxygen pressure in bone blood venules.";
          Physiolibrary.Types.Constants.VolumeFlowRateConst
                           BoneBloodFlow(k=5.3333333333333e-06)
            "Blood flow through bones";
          Physiolibrary.Types.Constants.MolarFlowRateConst
                          BoneO2Need(k(displayUnit="ml_STP/min") = 1.027404402668e-05)
            "Current desired delivery flow of oxygen to bone metabolism";
          Physiolibrary.Types.Constants.VolumeConst
                   BoneLiquidVol(k=0.0027) "The extravascular water in bones. ";
          Physiolibrary.Types.Examples.IO_Bus.OutputToFile_SI outputToFile_SI;
        equation
          connect(busConnector, outputToFile.busConnector);
          connect(Bone_PO2.y, busConnector.Bone_PO2);
          connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow);
          connect(BoneO2Need.y, busConnector.Bone_O2Need);
          connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol);
          connect(busConnector, outputToFile_SI.busConnector);
        end Test;
      end IO_Bus;
    end Examples;

    package Constants
      extends Modelica.Icons.SourcesPackage;

    block AccelerationConst "Constant signal of type Acceleration"
     parameter Types.Acceleration k "Constant Acceleration output value";
          RealIO.AccelerationOutput y "Acceleration constant";
    equation
          y=k;
    end AccelerationConst;

    block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
     parameter Types.AmountOfSubstance k
          "Constant AmountOfSubstance output value";
          RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant";
    equation
          y=k;
    end AmountOfSubstanceConst;

    block ConcentrationConst "Constant signal of type Concentration"
     parameter Types.Concentration k "Constant Concentration output value";
          RealIO.ConcentrationOutput y "Concentration constant";
    equation
          y=k;
    end ConcentrationConst;

    block DensityConst "Constant signal of type Density"
     parameter Types.Density k "Constant Density output value";
          RealIO.DensityOutput y "Density constant";
    equation
          y=k;
    end DensityConst;

    block DiffusionPermeabilityConst
        "Constant signal of type DiffusionPermeability"
     parameter Types.DiffusionPermeability k
          "Constant DiffusionPermeability output value";
          RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant";
    equation
          y=k;
    end DiffusionPermeabilityConst;

    block ElectricChargeConst "Constant signal of type ElectricCharge"
     parameter Types.ElectricCharge k "Constant ElectricCharge output value";
          RealIO.ElectricChargeOutput y "ElectricCharge constant";
    equation
          y=k;
    end ElectricChargeConst;

    block ElectricCurrentConst "Constant signal of type ElectricCurrent"
     parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
          RealIO.ElectricCurrentOutput y "ElectricCurrent constant";
    equation
          y=k;
    end ElectricCurrentConst;

    block ElectricPotentialConst "Constant signal of type ElectricPotential"
     parameter Types.ElectricPotential k
          "Constant ElectricPotential output value";
          RealIO.ElectricPotentialOutput y "ElectricPotential constant";
    equation
          y=k;
    end ElectricPotentialConst;

      block EnergyConst "Constant signal of type Energy"
        parameter Types.Energy k "Constant Energy output value";
          RealIO.EnergyOutput y "Energy constant";
      equation
          y=k;
      end EnergyConst;

    block FractionConst "Constant signal of type Fraction"
     parameter Types.Fraction k "Constant Fraction output value";
          RealIO.FractionOutput y "Fraction constant";
    equation
          y=k;
    end FractionConst;

    block FrequencyConst "Constant signal of type Frequency"
     parameter Types.Frequency k "Constant Frequency output value";
          RealIO.FrequencyOutput y "Frequency constant";
    equation
          y=k;
    end FrequencyConst;

    block GasSolubilityConst "Constant signal of type GasSolubility"
     parameter Types.GasSolubility k "Constant GasSolubility output value";
          RealIO.GasSolubilityOutput y "GasSolubility constant";
    equation
          y=k;
    end GasSolubilityConst;

    block HeatConst "Constant signal of type Heat"
     parameter Types.Heat k "Constant Heat output value";
          RealIO.HeatOutput y "Heat constant";
    equation
          y=k;
    end HeatConst;

    block HeightConst "Constant signal of type Height"
     parameter Types.Height k "Constant Height output value";
          RealIO.HeightOutput y "Height constant";
    equation
          y=k;
    end HeightConst;

    block HeatFlowRateConst "Constant signal of type HeatFlowRate"
     parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
          RealIO.HeatFlowRateOutput y "HeatFlowRate constant";
    equation
          y=k;
    end HeatFlowRateConst;

    block HydraulicComplianceConst
        "Constant signal of type HydraulicCompliance"
     parameter Types.HydraulicCompliance k
          "Constant HydraulicCompliance output value";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant";
    equation
          y=k;
    end HydraulicComplianceConst;

    block HydraulicElastanceConst
        "Obsolete, please use HydraulicCompliance instead!"
      extends Modelica.Icons.ObsoleteModel;
     parameter Types.HydraulicElastance k "Hydraulic elastance";
          Modelica.Blocks.Interfaces.RealOutput
                                           y(final quantity="HydraulicCompliance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6))
          "HydraulicElastance constant";
    equation
          y=k;
    end HydraulicElastanceConst;

    block HydraulicElastanceToComplianceConst
        "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
     parameter Types.HydraulicElastance k
          "Reciprocal constant value of hydraulic compliance";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant";
    equation
          y=1/k;
    end HydraulicElastanceToComplianceConst;

    block HydraulicConductanceConst
        "Constant signal of type HydraulicConductance"
     parameter Types.HydraulicConductance k
          "Constant HydraulicConductance output value";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant";
    equation
          y=k;
    end HydraulicConductanceConst;

    block HydraulicResistanceConst
        "Obsolete, please use HydraulicConductance instead!"

     parameter Types.HydraulicResistance k "Hydraulic resistance";
          Modelica.Blocks.Interfaces.RealOutput
                                            y(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60)
          "HydraulicResistance constant";
    equation
          y=k;
    end HydraulicResistanceConst;

    block HydraulicResistanceToConductanceConst
        "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
     parameter Types.HydraulicResistance k
          "Reciprocal constant value of hydraulic conductance";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant";
    equation
          y=1/k;
    end HydraulicResistanceToConductanceConst;

    block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
     parameter Types.HydraulicInertance k
          "Constant HydraulicInertance output value";
          RealIO.HydraulicInertanceOutput y "HydraulicInertance constant";
    equation
          y=k;
    end HydraulicInertanceConst;

    block MassConst "Constant signal of type Mass"
     parameter Types.Mass k "Constant Mass output value";
          RealIO.MassOutput y "Mass constant";
    equation
          y=k;
    end MassConst;

    block MassConcentrationConst "Constant signal of type MassConcentration"
     parameter Types.MassConcentration k
          "Constant MassConcentration output value";
          RealIO.MassConcentrationOutput y "MassConcentration constant";
    equation
          y=k;
    end MassConcentrationConst;

    block MassFlowRateConst "Constant signal of type MassFlowRate"
     parameter Types.MassFlowRate k "Constant MassFlowRate output value";
          RealIO.MassFlowRateOutput y "MassFlowRate constant";
    equation
          y=k;
    end MassFlowRateConst;

    block MolarFlowRateConst "Constant signal of type MolarFlowRate"
     parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
          RealIO.MolarFlowRateOutput y "MolarFlowRate constant";
    equation
          y=k;
    end MolarFlowRateConst;

    block OsmolarityConst "Constant signal of type Osmolarity"
     parameter Types.Osmolarity k "Constant Osmolarity output value";
          RealIO.OsmolarityOutput y "Osmolarity constant";
    equation
          y=k;
    end OsmolarityConst;

    block OsmoticPermeabilityConst
        "Constant signal of type OsmoticPermeability"
     parameter Types.OsmoticPermeability k
          "Constant OsmoticPermeability output value";
          RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant";
    equation
          y=k;
    end OsmoticPermeabilityConst;

    block PressureConst "Constant signal of type Pressure"
     parameter Types.Pressure k "Constant Pressure output value";
          RealIO.PressureOutput y "Pressure constant";
    equation
          y=k;
    end PressureConst;

    block SpecificEnergyConst "Constant signal of type SpecificEnergy"
     parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
          RealIO.SpecificEnergyOutput y "SpecificEnergy constant";
    equation
          y=k;
    end SpecificEnergyConst;

    block SpecificHeatCapacityConst
        "Constant signal of type SpecificHeatCapacity"
     parameter Types.SpecificHeatCapacity k
          "Constant SpecificHeatCapacity output value";
          RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant";
    equation
          y=k;
    end SpecificHeatCapacityConst;

    block TemperatureConst "Constant signal of type Temperature"
     parameter Types.Temperature k "Constant Temperature output value";
          RealIO.TemperatureOutput y "Temperature constant";
    equation
          y=k;
    end TemperatureConst;

    block ThermalConductanceConst "Constant signal of type ThermalConductance"
     parameter Types.ThermalConductance k
          "Constant ThermalConductance output value";
          RealIO.ThermalConductanceOutput y "ThermalConductance constant";
    equation
          y=k;
    end ThermalConductanceConst;

    block TimeConst "Constant signal of type Time"
     parameter Types.Time k "Constant Time output value";
          RealIO.TimeOutput y "Time constant";
    equation
          y=k;
    end TimeConst;

    block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
     parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
          RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant";
    equation
          y=k;
    end VolumeFlowRateConst;

    block VolumeConst "Constant signal of type Volume"
     parameter Types.Volume k "Constant Volume output value";
          RealIO.VolumeOutput y "Volume constant";
    equation
          y=k;
    end VolumeConst;

    block DeprecatedUntypedConstant
        "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolibrary"
      extends Modelica.Icons.ObsoleteModel;
     parameter Real k "Untyped constant output value";
     parameter String varName="";
     parameter String units="1";

          Modelica.Blocks.Interfaces.RealOutput
                                    y "Untyped constant";
    equation
          y=k;
    end DeprecatedUntypedConstant;

    block pHConst "Constant signal of type pH"
     parameter Types.pH k "Constant pH output value";
          Types.RealIO.pHOutput y "pH constant";
    equation
          y=k;
    end pHConst;

    block VolumeDensityOfChargeConst
        "Constant signal of type VolumeDensityOfCharge"
     parameter Types.VolumeDensityOfCharge k
          "Constant VolumeDensityOfCharge output value";
          Types.RealIO.VolumeDensityOfChargeOutput y
          "VolumeDensityOfCharge constant";
    equation
          y=k;
    end VolumeDensityOfChargeConst;

    block VelocityConst "Constant signal of type Velocity"
     parameter Types.Velocity k "Constant Velocity output value";
          Types.RealIO.VelocityOutput y "Velocity constant";
    equation
          y=k;
    end VelocityConst;

    block PowerConst "Constant signal of type Power"
     parameter Types.Power k "Constant Power output value";
          RealIO.PowerOutput y "Power constant";
    equation
          y=k;
    end PowerConst;

    block PositionConst "Constant signal of type Position"
     parameter Types.Position k "Constant Position output value";
          RealIO.PositionOutput y "Position constant";
    equation
          y=k;
    end PositionConst;

      block MolarEnergyConst "Constant signal of type MolarEnergy"
        parameter Types.MolarEnergy k "Constant MolarEnergy output value";
          RealIO.MolarEnergyOutput y "MolarEnergy constant";
      equation
          y=k;
      end MolarEnergyConst;

    block OneConst "1"

          RealIO.FractionOutput     y "=1";
    equation
          y=1;
    end OneConst;

      block PopulationConst "Constant signal of type Population"
        parameter Types.Population k "Constant Population output value";
          RealIO.PopulationOutput y "Population constant";
      equation
          y=k;
      end PopulationConst;

      block PopulationChangeConst "Constant signal of type PopulationChange"
        parameter Types.PopulationChange k
          "Constant PopulationChange output value";
          RealIO.PopulationChangeOutput y "PopulationChange constant";
      equation
          y=k;
      end PopulationChangeConst;

      block PopulationChangePerMemberConst
        "Constant signal of type PopulationChangePerMember"
        parameter Types.Time LifeTime
          "Mean lifetime as 1/PopulationChangePerMember output value";
          RealIO.PopulationChangePerMemberOutput y
          "PopulationChangePerMember constant";
      equation
          y=1/LifeTime;
      end PopulationChangePerMemberConst;
    end Constants;

    package ScaleConstants
        extends Modelica.Icons.SourcesPackage;

    block Power "Constant signal of type Power per Mass"
     parameter Types.PowerPerMass k "Constant Power output value";
          RealIO.PowerOutput y "Power constant";
      RealIO.MassInput mass;
    equation
          y=k*mass;
    end Power;
    end ScaleConstants;

    package RealIO
      extends Modelica.Icons.Package;

      connector AccelerationInput = input Acceleration
        "input Acceleration as connector";
      connector AccelerationOutput = output Acceleration
        "output Acceleration as connector";
      connector AmountOfSubstanceInput = input AmountOfSubstance
        "input AmountOfSubstance as connector";
      connector AmountOfSubstanceOutput = output AmountOfSubstance
        "output AmountOfSubstance as connector";
      connector ConcentrationInput = input Concentration
        "input Concentration as connector";
      connector ConcentrationOutput = output Concentration
        "output Concentration as connector";
      connector DiffusionPermeabilityInput = input DiffusionPermeability
        "input DiffusionPermeability as connector";
      connector DiffusionPermeabilityOutput = output DiffusionPermeability
        "output DiffusionPermeability as connector";
      connector ElectricCurrentInput = input ElectricCurrent
        "input ElectricCurrent as connector";
      connector ElectricCurrentOutput = output ElectricCurrent
        "output ElectricCurrent as connector";
      connector ElectricChargeInput = input ElectricCharge
        "input ElectricCharge as connector";
      connector ElectricChargeOutput = output ElectricCharge
        "output ElectricCharge as connector";
      connector EnergyInput = input Energy "input Energy as connector";

      connector EnergyOutput = output Energy "output Energy as connector";

      connector HeatInput = input Heat "input Heat as connector";
      connector HeatOutput = output Heat "output Heat as connector";
      connector HeatFlowRateInput = input HeatFlowRate
        "input HeatFlowRate as connector";
      connector HeatFlowRateOutput = output HeatFlowRate
        "output HeatFlowRate as connector";
      connector HeightInput = input Height "input Height as connector";
      connector HeightOutput = output Height "output Height as connector";
      connector MassInput = input Mass "input Mass as connector";

      connector MassOutput = output Mass "output Mass as connector";

      connector MassFlowRateInput = input MassFlowRate
        "input MassFlowRate as connector";

      connector MassFlowRateOutput = output MassFlowRate
        "output MassFlowRate as connector";

      connector MolarFlowRateInput = input MolarFlowRate
        "input MolarFlowRate as connector";
      connector MolarFlowRateOutput = output MolarFlowRate
        "output MolarFlowRate as connector";
      connector OsmolarityInput = input Osmolarity
        "input Concentration as connector";
      connector OsmolarityOutput = output Osmolarity
        "output Concentration as connector";
      connector PressureInput = input Pressure "input Pressure as connector";

      connector PressureOutput = output Pressure "output Pressure as connector";

      connector VolumeInput = input Volume "input Volume as connector";

      connector VolumeOutput = output Volume "output Volume as connector";

      connector VolumeFlowRateInput = input VolumeFlowRate
        "input VolumeFlowRate as connector";

      connector VolumeFlowRateOutput = output VolumeFlowRate
        "output VolumeFlowRate as connector";

      connector TemperatureInput = input Temperature
        "input Temperature as connector";

      connector TemperatureOutput = output Temperature
        "output Temperature as connector";
      connector TimeInput = input Time "input Time as connector";
      connector TimeOutput = output Time "output Time as connector";

      connector ThermalConductanceInput = input ThermalConductance
        "input ThermalConductance as connector";

      connector ThermalConductanceOutput = output ThermalConductance
        "output ThermalConductance as connector";

      connector ElectricPotentialInput = input ElectricPotential
        "input ElectricPotential as connector";

      connector ElectricPotentialOutput = output ElectricPotential
        "output ElectricPotential as connector";

      connector FractionInput = input Fraction "input Fraction as connector";

      connector FractionOutput = output Fraction "output Fraction as connector";

      connector FrequencyInput = input Frequency "input Frequency as connector";

      connector FrequencyOutput = output Frequency
        "output Frequency as connector";

      connector OsmoticPermeabilityInput = input OsmoticPermeability
        "input OsmoticPermeability as connector";

      connector OsmoticPermeabilityOutput = output OsmoticPermeability
        "output OsmoticPermeability as connector";

      connector HydraulicConductanceInput = input HydraulicConductance
        "input HydraulicConductance as connector";

      connector HydraulicConductanceOutput = output HydraulicConductance
        "output HydraulicConductance as connector";

      connector HydraulicComplianceInput = input HydraulicCompliance
        "input HydraulicCompliance as connector";

      connector HydraulicComplianceOutput = output HydraulicCompliance
        "output HydraulicCompliance as connector";

      connector DensityInput =input Density "input Density as connector";
      connector DensityOutput =output Density "output Density as connector";
      connector HydraulicInertanceInput = input HydraulicInertance
        "input HydraulicInertance as connector";

      connector HydraulicInertanceOutput = output HydraulicInertance
        "output HydraulicInertance as connector";
      connector GasSolubilityInput = input GasSolubility
        "input GasSolubility as connector";

      connector GasSolubilityOutput = output GasSolubility
        "output GasSolubility as connector";

      connector SpecificEnergyInput =
                              input SpecificEnergy
        "input SpecificEnergy as connector";
      connector SpecificEnergyOutput =
                               output SpecificEnergy
        "output SpecificEnergy as connector";
      connector SpecificHeatCapacityInput =
                              input SpecificHeatCapacity
        "input SpecificHeatCapacity as connector";
      connector SpecificHeatCapacityOutput =
                               output SpecificHeatCapacity
        "output SpecificHeatCapacity as connector";

      connector pHInput =           input pH "input pH as connector";
      connector pHOutput =           output pH "output pH as connector";
      connector VolumeDensityOfChargeInput =           input
          VolumeDensityOfCharge "input VolumeDensityOfCharge as connector";
      connector VolumeDensityOfChargeOutput =           output
          VolumeDensityOfCharge "output VolumeDensityOfCharge as connector";
      connector MassConcentrationInput =
                                     input MassConcentration
        "input MassConcentration as connector";
      connector MassConcentrationOutput =
                                      output MassConcentration
        "output MassConcentration as connector";

      connector VelocityInput =      input Velocity
        "input Velocity as connector";
      connector VelocityOutput =      output Velocity
        "output Velocity as connector";

      connector PowerInput = input Power "input Power as connector";
      connector PowerOutput = output Power "output Power as connector";

      connector PositionInput = input Position "input Position as connector";
      connector PositionOutput = output Position "output Position as connector";
       connector MolarEnergyInput = input MolarEnergy
        "input MolarEnergy as connector";

      connector MolarEnergyOutput = output MolarEnergy
        "output MolarEnergy as connector";
       connector PopulationInput =  input Population
        "input Population as connector";
      connector PopulationOutput =  output Population
        "output Population as connector";

       connector PopulationChangeInput =
                                    input PopulationChange
        "input PopulationChange as connector";
      connector PopulationChangeOutput =
                                    output PopulationChange
        "output PopulationChange as connector";

      connector PopulationChangePerMemberInput =
                                    input PopulationChangePerMember
        "input PopulationChangePerMember as connector";
      connector PopulationChangePerMemberOutput =
                                    output PopulationChangePerMember
        "output PopulationChangePerMember as connector";
    end RealIO;

      expandable connector BusConnector
      "Empty control bus that is adapted to the signals connected to it"


      end BusConnector;

    partial package IO_Bus "Subsystem outputs manipulation"
      extends Modelica.Icons.VariantsPackage;

      replaceable package PhysiolibTypesRealTypes =
          Physiolibrary.Types.RealTypes
        "Redefine this package only if there are not possible to use Physiolibrary types for variables!";

      replaceable partial model Variables
        "Subsystem output busConnector variables"
        package T = PhysiolibTypesRealTypes;

        replaceable block BooleanVariable =
          Physiolibrary.Types.BooleanExtension.Parameter constrainedby
          Physiolibrary.Types.AbstractBoolean;

        BusConnector busConnector;
      end Variables;

      model InputFromFile = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.InputParameter),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.InputParameter)
        "Load values in non-SI units from file io/input.txt";

      model OutputToFile = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.OutputFinal),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.OutputFinal)
        "Store values in non-SI units to file io/output.txt";

      model OutputComparison = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.OutputComparison),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.OutputComparison)
        "Compare values in non-SI units with file io/input.txt and store results to io/comparison.txt";

      model InputFromFile_SI = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.InputParameter_SI),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.InputParameter)
        "Load values in SI units from file io/input_SI.txt";

      model OutputToFile_SI = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.OutputFinal_SI),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.OutputFinal)
        "Store values in SI units to file io/output_SI.txt";

      model OutputComparison_SI = Variables(T(
        redeclare block Variable =
              Physiolibrary.Types.RealExtension.OutputComparison_SI),
        redeclare block BooleanVariable =
              Physiolibrary.Types.BooleanExtension.OutputComparison)
        "Compare values in SI units with file io/input_SI.txt and store results to io/comparison_SI.txt";

    end IO_Bus;

    expandable connector TorsoBusConnector
      "Upper, Middle or Lower Torso properties"


    end TorsoBusConnector;

    expandable connector TissueBusConnector "Tissue properties"


    end TissueBusConnector;

    type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);
    type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);
    type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

    type Mass = Modelica.SIunits.Mass(displayUnit="g", nominal=1e-3, min=0);
    type MassFlowRate = Modelica.SIunits.MassFlowRate(displayUnit="mg/min", nominal=(1e-6)/60);
    type Density = Modelica.SIunits.Density(displayUnit="kg/l", nominal=1e3);
    type MolarMass = Modelica.SIunits.MolarMass(displayUnit="kDa", nominal=1);

    type Height = Modelica.SIunits.Height(displayUnit="cm", nominal=1e-2);
    type Position = Modelica.SIunits.Position(displayUnit="cm", nominal=1e-2);
    type Velocity = Modelica.SIunits.Velocity(displayUnit="km/h", nominal=1);
    type Acceleration = Modelica.SIunits.Acceleration(displayUnit="m/s2", nominal=1);

    type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);
    type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6, min=0);
    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

    replaceable type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l", min=0) constrainedby Real;
    replaceable type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol", min=0) constrainedby Real;
    replaceable type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min") constrainedby Real;
    replaceable type MolarEnergy = Modelica.SIunits.MolarEnergy(displayUnit="kcal/mol", nominal=4186.8) constrainedby Real
      "chemical internal energy, chemical enthalpy, Gibb's energy ..";
    type MassConcentration =
                   Modelica.SIunits.MassConcentration(displayUnit="mg/l", nominal=1e-3, min=0);

    type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mosm/l", nominal=1);

    type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
    type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1, min=0);
    type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
    type Power = Modelica.SIunits.Power(displayUnit="kcal/min", nominal=4186.8/60);
    type PowerPerMass = Real(final quantity="Power per Mass",final unit="W/kg",displayUnit="cal/(g.min)", nominal=4.1868/(0.001*60));
    type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
    type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
    type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
      "vaporization, ..";

    type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
    type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="meq", nominal=(9.64853399*10^4)/1000);
    type VolumeDensityOfCharge =
                          Modelica.SIunits.VolumeDensityOfCharge(displayUnit="meq/l", nominal=(9.64853399*10^4));
    type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="meq/min", nominal=(9.64853399*10^4/1000)/60);

  //unknown units in Standard Modelica Library 3.2
    type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

    type pH =       Real(final quantity="pH",final unit="1",final displayUnit="1", nominal=7, min=0, max=14);
    type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
    type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60, min=0);

    type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
    type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60, min=0);

    type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
    type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

    type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

    type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2, min=0)
      "Gas solubility in liquid";

    type StoichiometricNumber = Modelica.SIunits.StoichiometricNumber; // Integer(final quantity="StoichiometricNumber", min=1);

    type Population = Real (final quantity="Population", final unit="1", displayUnit="1", min=0)
      "Average number of population individuals";
    type PopulationChange = Real (final quantity="PopulationChange", final unit="1/s", displayUnit="1/d")
      "Average change of population individuals";
    type PopulationChangePerMember = Real (final quantity="PopulationChangePerMember", final unit="1/s", displayUnit="1/d")
      "Average change per population individual";

    partial block AbstractReal
      "Abstract parameter or the value at defined time (final) of the model - can be input or output parameter"

      replaceable type T=Real
       constrainedby Real "Real type with units";

      parameter String varName=
      "Stored name";
                               //getInstanceName()
      parameter String storeUnit="" "Stored units";

      parameter T k(fixed=true) = 0 "Value";

      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
        "Unit conversions";
    end AbstractReal;

    package RealTypeInputParameters
      extends Modelica.Icons.SourcesPackage;

      replaceable package Utilities = Types.FilesUtilities constrainedby
        Types.Utilities;
       block Base
         parameter String varName=
         "Stored name";
                                  //getInstanceName()
         parameter String storeUnit="" "Stored units";
       end Base;

    block Velocity "Constant signal of type Velocity"

      extends Base(storeUnit="m/s");
     parameter Types.Velocity k=Utilities.readReal(varName, storeUnit)
          "Constant Velocity output value";
          RealIO.VelocityOutput y "Velocity input parameter";
    equation
          y=k;
    end Velocity;

    block Acceleration "Constant signal of type Acceleration"

      extends Base(storeUnit="m/s2");
     parameter Types.Acceleration k=Utilities.readReal(varName, storeUnit)
          "Constant Acceleration output value";
          RealIO.AccelerationOutput y "Acceleration input parameter";
    equation
          y=k;
    end Acceleration;

    block AmountOfSubstance "Constant signal of type AmountOfSubstance"

      extends Base(storeUnit="mmol");
     parameter Types.AmountOfSubstance k=Utilities.readReal(varName, storeUnit)
          "Constant AmountOfSubstance output value";
          RealIO.AmountOfSubstanceOutput y "AmountOfSubstance input parameter";
    equation
          y=k;
    end AmountOfSubstance;

    block Concentration "Constant signal of type Concentration"

      extends Base(storeUnit="mmol/l");
     parameter Types.Concentration k=Utilities.readReal(varName, storeUnit, unitConversions)
          "Constant Concentration output value";
          RealIO.ConcentrationOutput y "Concentration input parameter";
      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
          "Unit conversions";
    equation
          y=k;
    end Concentration;

    block MassConcentration "Constant signal of type MassConcentration"

      extends Base(storeUnit="mmol/l");
     parameter Types.MassConcentration k=Utilities.readReal(varName, storeUnit)
          "Constant Concentration output value";
          RealIO.MassConcentrationOutput y "Concentration input parameter";
    equation
          y=k;
    end MassConcentration;

    block Density "Constant signal of type Density"

      extends Base(storeUnit="kg/l");
     parameter Types.Density k=Utilities.readReal(varName, storeUnit)
          "Constant Density output value";
          RealIO.DensityOutput y "Density input parameter";
    equation
          y=k;
    end Density;

    block DiffusionPermeability "Constant signal of type DiffusionPermeability"

      extends Base(storeUnit="ml/min");
     parameter Types.DiffusionPermeability k=Utilities.readReal(varName,
            storeUnit) "Constant DiffusionPermeability output value";
          RealIO.DiffusionPermeabilityOutput y
          "DiffusionPermeability input parameter";
    equation
          y=k;
    end DiffusionPermeability;

    block ElectricCharge "Constant signal of type ElectricCharge"

      extends Base(storeUnit="meq");
     parameter Types.ElectricCharge k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricCharge output value";
          RealIO.ElectricChargeOutput y "ElectricCharge input parameter";
    equation
          y=k;
    end ElectricCharge;

    block ElectricCurrent "Constant signal of type ElectricCurrent"

      extends Base(storeUnit="meq/min");
     parameter Types.ElectricCurrent k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricCurrent output value";
          RealIO.ElectricCurrentOutput y "ElectricCurrent input parameter";
    equation
          y=k;
    end ElectricCurrent;

    block ElectricPotential "Constant signal of type ElectricPotential"

      extends Base(storeUnit="mV");
     parameter Types.ElectricPotential k=Utilities.readReal(varName, storeUnit)
          "Constant ElectricPotential output value";
          RealIO.ElectricPotentialOutput y "ElectricPotential input parameter";
    equation
          y=k;
    end ElectricPotential;

      block Energy "Constant signal of type Energy"

        extends Base(storeUnit="kcal");
        parameter Types.Energy k=Utilities.readReal(varName, storeUnit)
          "Constant Energy output value";
          RealIO.EnergyOutput y "Energy input parameter";
      equation
          y=k;
      end Energy;

    block Fraction "Constant signal of type Fraction"

      extends Base(storeUnit="");
     parameter Types.Fraction k=Utilities.readReal(varName, storeUnit)
          "Constant Fraction output value";
          RealIO.FractionOutput y "Fraction input parameter";
    equation
          y=k;
    end Fraction;

    block Frequency "Constant signal of type Frequency"

      extends Base(storeUnit="1/min");
     parameter Types.Frequency k=Utilities.readReal(varName, storeUnit)
          "Constant Frequency output value";
          RealIO.FrequencyOutput y "Frequency input parameter";
    equation
          y=k;
    end Frequency;

    block GasSolubility "Constant signal of type GasSolubility"

      extends Base(storeUnit="(mmol/l)/kPa at 25degC");
     parameter Types.GasSolubility k=Utilities.readReal(varName, storeUnit)
          "Constant GasSolubility output value";
          RealIO.GasSolubilityOutput y "GasSolubility input parameter";
    equation
          y=k;
    end GasSolubility;

    block Heat "Constant signal of type Heat"

       extends Base(storeUnit="kcal");
     parameter Types.Heat k=Utilities.readReal(varName, storeUnit)
          "Constant Heat output value";
          RealIO.HeatOutput y "Heat input parameter";
    equation
          y=k;
    end Heat;

    block Height "Constant signal of type Height"

      extends Base(storeUnit="cm");
     parameter Types.Height k=Utilities.readReal(varName, storeUnit)
          "Constant Height output value";
          RealIO.HeightOutput y "Height input parameter";
    equation
          y=k;
    end Height;

    block HeatFlowRate "Constant signal of type HeatFlowRate"

      extends Base(storeUnit="kcal/min");
     parameter Types.HeatFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant HeatFlowRate output value";
          RealIO.HeatFlowRateOutput y "HeatFlowRate input parameter";
    equation
          y=k;
    end HeatFlowRate;

    block HydraulicCompliance "Constant signal of type HydraulicCompliance"

      extends Base(storeUnit="ml/mmHg");
     parameter Types.HydraulicCompliance k=Utilities.readReal(varName, storeUnit)
          "Constant HydraulicCompliance output value";
          RealIO.HydraulicComplianceOutput y
          "HydraulicCompliance input parameter";
    equation
          y=k;
    end HydraulicCompliance;

    block HydraulicConductance "Constant signal of type HydraulicConductance"

      extends Base(storeUnit="ml/(mmHg.min)");
     parameter Types.HydraulicConductance k=Utilities.readReal(varName,
            storeUnit) "Constant HydraulicConductance output value";
          RealIO.HydraulicConductanceOutput y
          "HydraulicConductance input parameter";
    equation
          y=k;
    end HydraulicConductance;

    block HydraulicInertance "Constant signal of type HydraulicInertance"

      extends Base(storeUnit="mmHg.min2/ml");
     parameter Types.HydraulicInertance k=Utilities.readReal(varName, storeUnit)
          "Constant HydraulicInertance output value";
          RealIO.HydraulicInertanceOutput y
          "HydraulicInertance input parameter";
    equation
          y=k;
    end HydraulicInertance;

    block Mass "Constant signal of type Mass"

      extends Base(storeUnit="g");
     parameter Types.Mass k=Utilities.readReal(varName, storeUnit)
          "Constant Mass output value";
          RealIO.MassOutput y "Mass input parameter";
    equation
          y=k;
    end Mass;

    block MassFlowRate "Constant signal of type MassFlowRate"

      extends Base(storeUnit="g/min");
     parameter Types.MassFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant MassFlowRate output value";
          RealIO.MassFlowRateOutput y "MassFlowRate input parameter";
    equation
          y=k;
    end MassFlowRate;

    block MolarFlowRate "Constant signal of type MolarFlowRate"

      extends Base(storeUnit="mmol/min");
     parameter Types.MolarFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant MolarFlowRate output value";
          RealIO.MolarFlowRateOutput y "MolarFlowRate input parameter";
      parameter Utilities.UnitConversions.RealTypeRecord[:] unitConversions = Utilities.UnitConversions.RealTypeDef
          "Unit conversions";
    equation
          y=k;
    end MolarFlowRate;

    block Osmolarity "Constant signal of type Osmolarity"

      extends Base(storeUnit="mosm/l");
     parameter Types.Osmolarity k=Utilities.readReal(varName, storeUnit)
          "Constant Osmolarity output value";
          RealIO.OsmolarityOutput y "Osmolarity input parameter";
    equation
          y=k;
    end Osmolarity;

    block OsmoticPermeability "Constant signal of type OsmoticPermeability"

      extends Base(storeUnit="ml/(mmHg.min)");
     parameter Types.OsmoticPermeability k=Utilities.readReal(varName, storeUnit)
          "Constant OsmoticPermeability output value";
          RealIO.OsmoticPermeabilityOutput y
          "OsmoticPermeability input parameter";
    equation
          y=k;
    end OsmoticPermeability;

    block Pressure "Constant signal of type Pressure"

      extends Base(storeUnit="mmHg");
     parameter Types.Pressure k=Utilities.readReal(varName, storeUnit)
          "Constant Pressure output value";
          RealIO.PressureOutput y "Pressure input parameter";
    equation
          y=k;
    end Pressure;

    block SpecificEnergy "Constant signal of type SpecificEnergy"

      extends Base(storeUnit="kcal/kg");
     parameter Types.SpecificEnergy k=Utilities.readReal(varName, storeUnit)
          "Constant SpecificEnergy output value";
          RealIO.SpecificEnergyOutput y "SpecificEnergy input parameter";
    equation
          y=k;
    end SpecificEnergy;

    block SpecificHeatCapacity "Constant signal of type SpecificHeatCapacity"

      extends Base(storeUnit="kcal/(kg.K)");
     parameter Types.SpecificHeatCapacity k=Utilities.readReal(varName,
            storeUnit) "Constant SpecificHeatCapacity output value";
          RealIO.SpecificHeatCapacityOutput y
          "SpecificHeatCapacity input parameter";
    equation
          y=k;
    end SpecificHeatCapacity;

    block Temperature "Constant signal of type Temperature"

      extends Base(storeUnit="degC");
     parameter Types.Temperature k=Utilities.readReal(varName, storeUnit)
          "Constant Temperature output value";
          RealIO.TemperatureOutput y "Temperature input parameter";
    equation
          y=k;
    end Temperature;

    block ThermalConductance "Constant signal of type ThermalConductance"

      extends Base(storeUnit="kcal/(min.K)");
     parameter Types.ThermalConductance k=Utilities.readReal(varName, storeUnit)
          "Constant ThermalConductance output value";
          RealIO.ThermalConductanceOutput y
          "ThermalConductance input parameter";
    equation
          y=k;
    end ThermalConductance;

    block Time "Constant signal of type Time"

      extends Base(storeUnit="min");
     parameter Types.Time k=Utilities.readReal(varName, storeUnit)
          "Constant Time output value";
          RealIO.TimeOutput y "Time input parameter";
    equation
          y=k;
    end Time;

    block VolumeFlowRate "Constant signal of type VolumeFlowRate"

      extends Base(storeUnit="ml/min");
     parameter Types.VolumeFlowRate k=Utilities.readReal(varName, storeUnit)
          "Constant VolumeFlowRate output value";
          RealIO.VolumeFlowRateOutput y "VolumeFlowRate input parameter";
    equation
          y=k;
    end VolumeFlowRate;

    block Volume "Constant signal of type Volume"

      extends Base(storeUnit="ml");
     parameter Types.Volume k=Utilities.readReal(varName, storeUnit)
          "Constant Volume output value";
          RealIO.VolumeOutput y "Volume input parameter";
    equation
          y=k;
    end Volume;

    block pH "Constant signal of type pH"

      extends Base(storeUnit="");
     parameter Types.pH k=Utilities.readReal(varName, storeUnit)
          "Constant pH output value";
          RealIO.pHOutput y "pH input parameter";
    equation
          y=k;
    end pH;

    block VolumeDensityOfCharge "Constant signal of type VolumeDensityOfCharge"

      extends Base(storeUnit="meq/l");
     parameter Types.VolumeDensityOfCharge k=Utilities.readReal(varName,
            storeUnit) "Constant VolumeDensityOfCharge output value";
          RealIO.VolumeDensityOfChargeOutput y
          "VolumeDensityOfCharge input parameter";
    equation
          y=k;
    end VolumeDensityOfCharge;

    block Power "Constant signal of type Power"

      extends Base(storeUnit="kcal/min");
     parameter Types.Power k=Utilities.readReal(varName, storeUnit)
          "Constant Power output value";
          RealIO.PowerOutput y "Power input parameter";
    equation
          y=k;
    end Power;

    block Position "Constant signal of type Position"

      extends Base(storeUnit="cm");
     parameter Types.Position k=Utilities.readReal(varName, storeUnit)
          "Constant Position output value";
          RealIO.PositionOutput y "Position input parameter";
    equation
          y=k;
    end Position;

      block MolarEnergy "Constant signal of type MolarEnergy"

        extends Base(storeUnit="kcal/mol");
        parameter Types.MolarEnergy k=Utilities.readReal(varName, storeUnit)
          "Constant MolarEnergy output value";
          RealIO.MolarEnergyOutput y "MolarEnergy input parameter";
      equation
          y=k;
      end MolarEnergy;

      block Population "Constant signal of type Population"

        extends Base(storeUnit="");
        parameter Types.Population k=Utilities.readReal(varName, storeUnit)
          "Constant Population output value";
          RealIO.PopulationOutput y "Population input parameter";
      equation
          y=k;
      end Population;

      block PopulationChange "Constant signal of type PopulationChange"

        extends Base(storeUnit="1/d");
        parameter Types.PopulationChange k=Utilities.readReal(varName, storeUnit)
          "Constant PopulationChange output value";
          RealIO.PopulationChangeOutput y "PopulationChange input parameter";
      equation
          y=k;
      end PopulationChange;

      block PopulationChangePerMember
        "Constant signal of type PopulationChangePerMember"
        extends Base(storeUnit="1/d");
        parameter Types.PopulationChangePerMember k=Utilities.readReal(varName, storeUnit)
          "Constant PopulationChangePerMember output value";
          RealIO.PopulationChangePerMemberOutput y
          "PopulationChangePerMember input parameter";
      equation
          y=k;
      end PopulationChangePerMember;
    end RealTypeInputParameters;

    package RealExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Generate constant signal in SI units from file"
            extends AbstractReal;

            replaceable package IO = Types.RealExtension.IO (
              redeclare type Type = T) "Real type with units";

            IO.Output y "Connector of Real output signal";

          equation
            y = k;
          end Parameter;

          block InputParameter "Generate constant signal from file"
            extends AbstractReal(                   k = Utilities.readReal( varName, storeUnit, unitConversions));

            replaceable package IO = Types.RealExtension.IO (
              redeclare type Type = T);
            replaceable package Utilities = Types.FilesUtilities(inputFileName="input.txt")
              constrainedby Types.Utilities;

            IO.Output y "Connector of Real output signal";

          equation
          /*  when initial() then
    Modelica.Utilities.Streams.print(" ii " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
  when terminal() then
    Modelica.Utilities.Streams.print(" it " + varName + " = " + String(y) + " SI , store as " + storeUnit);
  end when;
*/
            y = k;
          end InputParameter;

          block InputParameter_SI
        "Generate constant signal in SI units from file"
            extends AbstractReal(                   k = Utilities.readReal_SI( varName));

            replaceable package IO = Types.RealExtension.IO (
              redeclare type Type = T);
            replaceable package Utilities = Types.FilesUtilities(inputSIFileName="input_SI.txt")
              constrainedby Types.Utilities;

            IO.Output y "Connector of Real output signal";

          equation
            y = k;
          end InputParameter_SI;

          block OutputFinal "Save variable to Output"
          //  import Physiolibrary;
            extends Types.AbstractReal;
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(outputFileName="outputFinal.txt")
                                                           constrainedby
          Types.Utilities;
            IO.Input              y "Connector of Real input signal";

          equation
            when terminal() then
              //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
              Utilities.writeReal(
                varName,
                y,
                storeUnit,
                unitConversions);
            end when;
          end OutputFinal;

          block OutputFinal_SI "Save variable to Output"
          //  import Physiolibrary;
            extends Types.AbstractReal;
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(outputSIFileName="outputFinal_SI.txt")
                                                           constrainedby
          Types.Utilities;
            IO.Input              y "Connector of Real input signal";

          equation
            when terminal() then
              Utilities.writeReal_SI(
                varName,
                y);
            end when;
          end OutputFinal_SI;

          block OutputInitial "Save variable to Output"
          //  import Physiolibrary;
            extends Types.AbstractReal;
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(outputFileName="outputInitial.txt")
                                                           constrainedby
          Types.Utilities;
            IO.Input              y "Connector of Real input signal";

          equation
            when initial() then
              //Modelica.Utilities.Streams.print(" < " + varName + " = " + String(y) + " SI , store as " + storeUnit);
              Utilities.writeReal(
                varName,
                y,
                storeUnit,
                unitConversions);
            end when;
          end OutputInitial;

          block OutputInitial_SI "Save variable to Output"
           // import Physiolibrary;
            extends Types.AbstractReal;
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(outputSIFileName="outputInitial_SI.txt")
                                                           constrainedby
          Types.Utilities;
            IO.Input              y "Connector of Real input signal";

          equation
            when initial() then
              Utilities.writeReal_SI(
                varName,
                y);
            end when;
          end OutputInitial_SI;

          block OutputComparison "Save variable comparison to file"
          //  import Physiolibrary;
            extends Types.AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(comparisonFileName="comparison.txt")
                                                           constrainedby
          Types.Utilities;

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal";

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeComparison(
              varName,
              k,
              initialValue,
              y,
              storeUnit,
              unitConversions);
            end when;

          end OutputComparison;

          block OutputComparison_SI
        "Save variable comparison to file using SI units during input and output"
          //  import Physiolibrary;
            extends Types.AbstractReal(             k=Utilities.readReal_SI(varName));
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(comparisonSIFileName="comparison_SI.txt")
                                                           constrainedby
          Types.Utilities;

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal";

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeComparison_SI(
              varName,
              k,
              initialValue,
              y);
            end when;

          end OutputComparison_SI;

          block OutputInitialComparison "Save variable comparison to file"
          //  import Physiolibrary;
            extends Types.AbstractReal(             k=Utilities.readReal(varName,storeUnit,unitConversions));
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(comparisonFileName="comparisonInitial.txt")
                                                           constrainedby
          Types.Utilities;

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal";

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when initial() then
             Utilities.writeComparison(
              varName,
              k,
              initialValue,
              y,
              storeUnit,
              unitConversions);
            end when;

          end OutputInitialComparison;

          block OutputInitialComparison_SI
        "Save variable comparison to file using SI units"
           // import Physiolibrary;
            extends Types.AbstractReal(             k=Utilities.readReal_SI(varName));
            replaceable package IO = Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Types.FilesUtilities(comparisonSIFileName="comparisonInitial_SI.txt")
                                                           constrainedby
          Types.Utilities;

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal";

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when initial() then
             Utilities.writeComparison_SI(
              varName,
              k,
              initialValue,
              y);
            end when;

          end OutputInitialComparison_SI;

      package IO
        extends Modelica.Icons.BasesPackage;

        replaceable type Type=Real;
        connector Input = input Type "input connector";

        connector Output = output Type "output connector";
      end IO;
    end RealExtension;

    package RealTypes
      extends Modelica.Icons.BasesPackage;
      import Physiolibrary;

        replaceable block Variable = RealExtension.Parameter constrainedby
        AbstractReal;

        block Energy = Variable(redeclare type T=Types.Energy, storeUnit="kcal");
        block Time = Variable(redeclare type T=Types.Time, storeUnit="min");
        block Frequency = Variable(redeclare type T=Types.Frequency, storeUnit="1/min");

        block Mass = Variable(redeclare type T=Types.Mass, storeUnit="g");
        block MassFlowRate = Variable(redeclare type T =
              Types.MassFlowRate, storeUnit="g/min");
        block Density = Variable(redeclare type T=Types.Density, storeUnit="kg/l");

        block Height = Variable(redeclare type T=Types.Height, storeUnit="cm");
        block Velocity = Variable(redeclare type T=Types.Velocity, storeUnit="km/h");
        block Acceleration = Variable(redeclare type T =
              Types.Acceleration, storeUnit="m/s");

        block Pressure = Variable(redeclare type T=Types.Pressure,storeUnit="mmHg");
        block Volume = Variable(redeclare type T=Types.Volume,storeUnit="ml");
        block VolumeFlowRate = Variable(redeclare type T =
              Types.VolumeFlowRate,storeUnit="ml/min");

        block Concentration = Variable(redeclare type T =
              Types.Concentration, storeUnit="mmol/l");
        block MassConcentration = Variable (redeclare type T =
              Types.MassConcentration, storeUnit="mg/l");
        block AmountOfSubstance = Variable(redeclare type T =
              Types.AmountOfSubstance,storeUnit="mmol");
        block MolarFlowRate = Variable(redeclare type T =
              Types.MolarFlowRate,storeUnit="mmol/min");

        block Heat = Variable(redeclare type T=Types.Heat,storeUnit="kcal");
        block Temperature = Variable(redeclare type T =
            Types.Temperature,  storeUnit="degC");
        block HeatFlowRate = Variable(redeclare type T =
              Types.HeatFlowRate,storeUnit="kcal/min");
        block Power = Variable(redeclare type T =
              Types.Power,storeUnit="kcal/min");
        block ThermalConductance = Variable(redeclare type T =
              Types.ThermalConductance, storeUnit="kcal/(min.K)");
        block SpecificHeatCapacity = Variable(redeclare type T =
              Types.SpecificHeatCapacity,storeUnit="kcal/(kg.K)");
        block SpecificEnergy = Variable(redeclare type T =
              Types.SpecificEnergy,storeUnit="kcal/kg");

        block ElectricPotential = Variable(redeclare type T =
              Types.ElectricPotential,storeUnit="mV");
        block ElectricCharge = Variable(redeclare type T =
              Types.ElectricCharge,storeUnit="meq");
        block VolumeDensityOfCharge =
                               Variable(redeclare type T =
              Types.VolumeDensityOfCharge,storeUnit="meq/l");
        block ElectricCurrent = Variable(redeclare type T =
              Types.ElectricCurrent,storeUnit="meq/min");

        block Fraction = Variable(redeclare type T=Types.Fraction,storeUnit="");

        block pH =       Variable(redeclare type T=Types.pH,storeUnit="log10(mol/l)");
        block OsmoticPermeability = Variable(redeclare type T =
              Types.OsmoticPermeability,storeUnit="ml/(mmHg.min)");
        block DiffusionPermeability =         Variable(redeclare type T =
              Types.DiffusionPermeability,storeUnit="ml/min");

        block HydraulicConductance = Variable(redeclare type T =
              Types.HydraulicConductance,storeUnit="ml/(mmHg.min)");
        block HydraulicCompliance = Variable(redeclare type T =
              Types.HydraulicCompliance,storeUnit="ml/mmHg");
        block HydraulicInertance = Variable(redeclare type T =
              Types.HydraulicInertance,storeUnit="mmHg.min2/ml");

        block GasSolubility = Variable(redeclare type T =
              Types.GasSolubility,storeUnit="(mmol/l)/kPa at 25degC");

        block Osmolarity =    Variable(redeclare type T =
              Types.Osmolarity,storeUnit="mosm/l");
        block Position=Variable(redeclare type T=Types.Position, storeUnit="cm");
        block MolarEnergy =
                       Variable(redeclare type T=Types.MolarEnergy, storeUnit="kcal/mol");
        block Population =    Variable(redeclare type T =
              Types.Population,storeUnit="1");
        block PopulationChange =
                              Variable(redeclare type T =
              Types.PopulationChange,storeUnit="1/d");
        block PopulationChangePerMember =
                              Variable(redeclare type T =
              Types.PopulationChangePerMember,storeUnit="1/d");
    end RealTypes;

    partial block AbstractBoolean
      "Abstract parameter or the value at defined time of the model - can be input or output parameter"

      parameter String varName="" "Name of stored variable";
                                  //getInstanceName()
       parameter Boolean k(fixed=true)=false "Value";

    end AbstractBoolean;

    package FilesUtilities "File input/output/test"
      import Physiolibrary;
      extends Types.Utilities;
      extends Modelica.Icons.VariantsPackage;

      constant String directoryName="io";

      constant String inputFileName="input.txt"
        "File to load values with (non-)SI units";
      constant String outputFileName="output.txt"
        "File to save values with (non-)SI units";
      constant String comparisonFileName="comparison.txt"
        "File to save comparison from loaded values and simulation results with (non-)SI units";

      constant String inputSIFileName="input_SI.txt"
        "File to load values in SI units";
      constant String outputSIFileName="output_SI.txt"
        "File to save values in SI units";
      constant String comparisonSIFileName="comparison_SI.txt"
        "File to save comparison in SI units from loaded values and simulation results";

      redeclare function extends readReal
        import Modelica.Utilities.*;

      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer lineLen;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;
        String str;
        Real inputValue;
        Integer typeDef;
      algorithm
        fn:=directoryName + "/" + inputFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 lineLen := Strings.length(line);
                 nextIndex:=1;

      /*
other wariant: //Format "<variableName>=<value><unit>"
  while not found and not endOfFile loop
       iline:=iline+1;
       (line, endOfFile) :=Streams.readLine(fn, iline);
       lineLen := Strings.length(line);

       if lineLen>3 then

         nextIndex:=1; //because Coleman does not use the right identifiers, scanIdentifier can not be used :(
         str:=Strings.substring(line,nextIndex,nextIndex);
         while ((nextIndex+1)<lineLen and (not Strings.isEqual(str," ")) and (not Strings.isEqual(str,"=")) and (not Strings.isEqual(str,"\t"))) loop
            nextIndex:=nextIndex+1;
            str:=Strings.substring(line,nextIndex,nextIndex);
         end while;
         str := Strings.substring(line,1,nextIndex-1);

         if str==name then

           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex+1); //skip '=' and white-spaces before/after
*/

                 (inputValue,nextIndex) := Strings.scanReal(line, nextIndex);

                 nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
                 if nextIndex>lineLen then
                     if Strings.length(unitConversions[typeDef].DisplayUnit) > 0 then
                       Streams.error("No units detected for variable '" + name +
                                      "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " (no units)");
                 else
                     str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
                     if str <> unitConversions[typeDef].DisplayUnit then
                        Streams.error("Units '" + str + "' not expected for variable '"
                         + name + "' in file '" + fn + "'. Expected unis are '" +
                        unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " " + str);
                 end if;
                 value :=inputValue*unitConversions[typeDef].Scale + unitConversions[typeDef].Offset;
                 //Streams.print("\t\t =" + String(value) + " " + unitConversions[typeDef].Unit);
                 found := true;
                 // end if;  //Format "<variableName>=<value><unit>"

                 //Format "<variableName>\n<value><unit>"
             else
                 // wrong name, skip lines
                 iline := iline + 2;
                 // read next variable name
                 (line, endOfFile) :=Streams.readLine(fn, iline);
             end if;
           end while;

           if not found then
              Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
           end if;
         end if;

      end readReal;

      redeclare function extends readReal_SI
        import Modelica.Utilities.*;

      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;

      algorithm
        fn:=directoryName + "/" +inputSIFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 nextIndex:=1;

                 (value,nextIndex) := Strings.scanReal(line, nextIndex);
                 found := true;

               else
               // wrong name, skip lines
                 iline := iline + 2;
                 // read next variable name
                 (line, endOfFile) :=Streams.readLine(fn, iline);

               end if;
           end while;

           if not found then
              Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
           end if;
         end if;

      end readReal_SI;

      redeclare function extends readBoolean
        import Modelica.Utilities.*;

      algorithm
        value:=(readReal(name,"")>0.005);
      end readBoolean;

      redeclare function extends writeReal "Write the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        Streams.print(name + "\n" + String(((value - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale))
        + " " + unitConversions[typeDef].DisplayUnit, fn);

      end writeReal;

      redeclare function extends writeReal_SI
        "Write the value to file using SI unit"
        import Modelica.Utilities.*;

      protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputSIFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

         Streams.print(name + "\n" + String(value), fn);

      end writeReal_SI;

      redeclare function extends writeBoolean
        import Modelica.Utilities.*;
      protected
        String fn;

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

        Streams.print( name + "\n" + String(if value then 1 else 0),      fn);

      end writeBoolean;

      redeclare function extends writeComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
        Integer typeDef "Variable output units";

      algorithm
        fn:=directoryName + "/" +comparisonFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

      outputDefaultValue :=((defaultValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputInitialValue :=((initialValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputFinalValue :=((finalValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);

        Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps)
           then String(abs((outputFinalValue - outputDefaultValue)/
          outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) +
          " ; " + name + " : default=" + String(outputDefaultValue) + " " +
          unitConversions[typeDef].DisplayUnit
           + ", initial=" + String(outputInitialValue) + " " + unitConversions[
          typeDef].DisplayUnit + ", final=" + String(outputFinalValue) + " " +
          unitConversions[typeDef].DisplayUnit,
          fn);

      end writeComparison;

      redeclare function extends writeComparison_SI
        "Compare and write the result and the value to file using SI units"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;

      algorithm
        fn:=directoryName + "/" +comparisonSIFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

      outputDefaultValue := defaultValue;
      outputInitialValue := initialValue;
      outputFinalValue := finalValue;

      Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
        String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
         else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
        " : default=" + String(outputDefaultValue) + ", initial=" + String(outputInitialValue)
         + ", final=" + String(outputFinalValue), fn);

      end writeComparison_SI;

      redeclare function extends writeBooleanComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn:=directoryName + "/" +comparisonFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;
         if (defaultValue==finalValue) then

             Streams.print("0 ; "+ name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
           else
             Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0)+ ", final=" + String(if finalValue then 1 else 0), "differences.txt");
         end if;

      end writeBooleanComparison;

    end FilesUtilities;

    package BooleanExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Read constant boolean signal"
            extends Types.AbstractBoolean;

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal";

          equation
            y = k;
          end Parameter;

          block InputParameter "Read constant boolean signal"
            extends Types.AbstractBoolean(k=
              Utilities.readBoolean(varName));

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal";
            replaceable package Utilities = Types.FilesUtilities;

          equation
            y = k;
          end InputParameter;

          block OutputFinal "Save boolean value to file"
           extends Types.AbstractBoolean;

            replaceable package Utilities = Types.FilesUtilities;

            Modelica.Blocks.Interfaces.BooleanInput
                                                  y
          "Connector of Real output signal";

          equation
            when terminal() then
               Utilities.writeBoolean(varName,y);
            end when;

          end OutputFinal;

          block OutputComparison "Save variable comparison to file"
            import Physiolibrary;
            extends Types.AbstractBoolean(          k=Utilities.readBoolean(varName));
            replaceable package Utilities = Types.FilesUtilities;

            Modelica.Blocks.Interfaces.BooleanInput
                                  y "Connector of Real input signal";

      protected
            parameter Boolean initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeBooleanComparison(
              varName,
              k,
              initialValue,
              y);
            end when;

          end OutputComparison;
    end BooleanExtension;

    package Utilities "Value input/output/test support"
      extends Modelica.Icons.BasesPackage;
      replaceable function readReal "Read the real value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal;

      replaceable function readReal_SI "Read the real value in SI units of parameter from file with lines in format:
  <parameterName>\\n<value>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal_SI;

      replaceable function readBoolean "Read the boolean value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        output Boolean value "Variable value";
      //algorithm
      end readBoolean;

      replaceable function writeReal "Write the real value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
      //algorithm
      end writeReal;

      replaceable function writeReal_SI
        "Write the real value using SI unit to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
      //algorithm
      end writeReal_SI;

      replaceable function writeBoolean "Write the boolean value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean value "Variable value";
      //algorithm
      end writeBoolean;

      replaceable function writeComparison
        "Compare and write the result and the value to file"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
          "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
      //algorithm
      end writeComparison;

      replaceable function writeComparison_SI
        "Compare and write the result and the value to file using SI units"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
          "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

      //algorithm
      end writeComparison_SI;

      replaceable function writeBooleanComparison
        "Compare and write the result and the value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean defaultValue
          "Original value[in SIunits] to compare with final value";
        input Boolean initialValue "Initial variable value[in SI units]";
        input Boolean finalValue "Final variable value[in SI units]";
      //algorithm
      end writeBooleanComparison;

      package UnitConversions "Conversions non-SI units at input/output"

       function findUnit
         input String unitToFind "display unit to find in unitConversions";
         input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
            "Unit conversions";
         output Integer typeDef "index in unitConversions";
       algorithm
         typeDef:=0;
         for i in 1:size(unitConversions,1) loop
           if unitConversions[i].DisplayUnit == unitToFind then
             typeDef:=i;
             break;
           end if;
         end for;
         if typeDef==0 then
            Modelica.Utilities.Streams.print("Unit \"" + unitToFind + "\" not defined. Do not hesitate to contact me. marek@matfyz.cz\n");
         end if;
       end findUnit;

       record RealTypeRecord "The Real Type definition"
         parameter String Quantity="" "Quantity";
         parameter String Unit="1" "SI unit";
         parameter String DisplayUnit="" "Display unit";

         parameter Real Scale=1
            "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
         parameter Real Offset=0
            "Offset from display unit to SI unit such that x <d> = x*s+o <u>";

         parameter Real Min=-Modelica.Constants.inf "minimal value";
         parameter Real Max=+Modelica.Constants.inf; // Inf denotes a large value
         parameter Real Start = Offset; // Initial value
         parameter Real Nominal = Scale; // Nominal value
         parameter StateSelect StateSelection = StateSelect.default;
       end RealTypeRecord;

        constant RealTypeRecord RealTypeDef[:]={RealTypeRecord(),
            RealTypeRecord(),RealTypeRecord(
              Quantity="pH",
              Unit="log10(mol/l)",
              DisplayUnit="log10(mol/l)",
              Scale=1),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="Time",
              Unit="s",
              DisplayUnit="min",
              Scale=60),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="Hz",
              Scale=1),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="g",
              Scale=1e-3),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="mg",
              Scale=1e-6),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="mg/min",
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="g/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="kg/l",
              Scale=1e3),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="g/l",
              Scale=1),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/l",
              Scale=1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/dl",
              Scale=1e-6/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/dl",
              Scale=1e-12/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/ml",
              Scale=1e-12/1e-6),RealTypeRecord(
              Quantity="Length",
              Unit="m",
              DisplayUnit="cm",
              Scale=1e-2),RealTypeRecord(
              Quantity="Velocity",
              Unit="m/s",
              DisplayUnit="MPH",
              Scale=0.44704),RealTypeRecord(
              Quantity="Acceleration",
              Unit="m/s2",
              DisplayUnit="m/s2",
              Scale=1),RealTypeRecord(
              Quantity="Pressure",
              Unit="Pa",
              DisplayUnit="mmHg",
              Scale=101325/760),RealTypeRecord(
              Quantity="Volume",
              Unit="m3",
              DisplayUnit="ml",
              Scale=1e-6),RealTypeRecord(
              Quantity="VolumeFlowRate",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mol/l",
              Scale=1e+3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mmol/l",
              Scale=1),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="pmol/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="uU_Insulin/ml",
              Scale=6.622e-9),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="U_EPO/l",
              Scale=0.45e-9),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mmol",
              Scale=1e-3),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="osm",
              Scale=1),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mosm",
              Scale=1e-3),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="mmol/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="ml_STP/min",
              Scale=1/1362657.193569),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="K",
              Scale=1,
              Start=310.15),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="degC",
              Scale=1,
              Offset=273.15,
              Start=310.15),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="W",
              Scale=1),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="kcal/min",
              Scale=4186.8/60),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="cal/min",
              Scale=4.1868/60),RealTypeRecord(
              Quantity="ThermalConductance",
              Unit="W/K",
              DisplayUnit="kcal/(min.degC)",
              Scale=4186.8/60),RealTypeRecord(
              Quantity="SpecificHeatCapacity",
              Unit="J/(kg.K)",
              DisplayUnit="kcal/(degC.kg)",
              Scale=4186.8),RealTypeRecord(
              Quantity="SpecificEnergy",
              Unit="J/kg",
              DisplayUnit="kcal/kg",
              Scale=4186.8),RealTypeRecord(
              Quantity="ElectricPotential",
              Unit="V",
              DisplayUnit="mV",
              Scale=1e-3),RealTypeRecord(
              Quantity="ElectricCharge",
              Unit="C",
              DisplayUnit="meq",
              Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="meq/l",
              Scale=(1e-3)*(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="eq/l",
              Scale=(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="ElectricCurrent",
              Unit="A",
              DisplayUnit="meq/min",
              Scale=(1e-3)*(9.64853399*10^4)/60),RealTypeRecord(
              Quantity="Fraction",
              Unit="1",
              DisplayUnit="%",
              Scale=1e-2),RealTypeRecord(
              Quantity="OsmoticMembramePermeability",
              Unit="m6/(mol.s)",
              DisplayUnit="ml/(mOsmol.min)",
              Scale=(1e-6)/((1e-3)*60)),RealTypeRecord(
              Quantity="DiffusionMembranePermeability",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="HydraulicConductance",
              Unit="m3/(Pa.s)",
              DisplayUnit="ml/(mmHg.min)",
              Scale=(1e-6)/((101325/760)*60)),RealTypeRecord(
              Quantity="HydraulicCompliance",
              Unit="m3/Pa",
              DisplayUnit="ml/mmHg",
              Scale=(1e-6)/(101325/760)),RealTypeRecord(
              Quantity="HydraulicInertance",
              Unit="Pa.s2/m3",
              DisplayUnit="mmHg.min2/ml",
              Scale=((101325/760)*(60^2)/(1e-6))),RealTypeRecord(
              Quantity="GasSolubility",
              Unit="mol/(m3.Pa)",
              DisplayUnit="mmol/(l.mmHg)",
              Scale=(1e-3)/((1e-3)*(101325/760))),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol/m3",
              DisplayUnit="mosm/l",
              Scale=1),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol/m3",
              DisplayUnit="osm/l",
              Scale=1000),RealTypeRecord(
              Quantity="MolarEnergy",
              Unit="J/mol",
              DisplayUnit="kcal/mol",
              Scale=4186.8),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="iu/l",
              Scale=1000),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="uiu/ml",
              Scale=1),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/d",
              Scale=1/(60*60*24))}
          "All defined Real types - units, displayUnits, conversions, nominals";

         constant String[:] Prefix =    {"","m", "u", "n", "p"};
         constant Real[:]   PrefixScale={1.0, 1e-3,1e-6,1e-9,1e-12};

         constant String[:] SuffixSI= {"","/m3","/m3","/m3","/s"};
         constant String[:] Suffix =  {"","/l", "/dl","/ml","/min"};
         constant Real[:]   SuffixScale={1, 1e+3, 1e+4, 1e+6, 1/60};

        function GenerateSubstanceUnits
           input String nonSIunit "non-SI unit";
           input Real scale "1 mol = 'scale' 'nonSIunit'";
           output RealTypeRecord[size(Prefix,1)*size(Suffix,1)] units
            "generated conversions for mili-, micro-, .. amount/concentration/flow";
        protected
         constant Integer np = size(Prefix,1);
         constant Integer ns = size(Suffix,1);
        algorithm
          units:={
              RealTypeRecord(
                Unit="mol"+SuffixSI[integer(1+mod(i,ns))],
                DisplayUnit=Prefix[integer(1+div(i,ns))] + nonSIunit + Suffix[integer(1+mod(i,ns))],
                Scale=PrefixScale[integer(1+div(i,ns))]*scale*SuffixScale[integer(1+mod(i,ns))])
              for i in 0:(np*ns-1)};
        end GenerateSubstanceUnits;

      end UnitConversions;
    end Utilities;

    package ZeroUtilities "No input/output/test"
      import Physiolibrary;
      extends Types.Utilities;
      extends Modelica.Icons.VariantsPackage;

      redeclare function extends readReal
      algorithm
      end readReal;

      redeclare function extends readReal_SI
      algorithm
      end readReal_SI;

      redeclare function extends readBoolean
      algorithm
      end readBoolean;

      redeclare function extends writeReal
      algorithm
      end writeReal;

      redeclare function extends writeReal_SI
      algorithm
      end writeReal_SI;

      redeclare function extends writeBoolean
      algorithm
      end writeBoolean;

      redeclare function extends writeComparison
      algorithm
      end writeComparison;

      redeclare function extends writeComparison_SI
      algorithm
      end writeComparison_SI;

      redeclare function extends writeBooleanComparison
      algorithm
      end writeBooleanComparison;

    end ZeroUtilities;

    type SimulationType = enumeration(
        NoInit "Use start values only as a guess of state values",
        NormalInit "Initialization by start values",
        ReadInit "Initialization by function Utilities.readReal('state name')",

        InitSteadyState
          "Initialization in Steady State (initial derivations are zeros)",
        SteadyState "Steady State = Derivations are zeros during simulation")
      "Initialization or Steady state options (to determine model type before simulating)";

  end Types;

  package Blocks "Base Signal Blocks Library"
    extends Modelica.Icons.Package;
    package Math "Modelica.Math extension"
      extends Modelica.Icons.Package;
      model Integrator "Integrator with support of steady state calculation."
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=y_start, state(nominal=NominalValue));

        parameter Real k=1 "Integrator gain";

        parameter Real y_start=0 "Initial or guess value of output (= state)";
        extends Modelica.Blocks.Interfaces.SISO(u(nominal=NominalValue/k),y(nominal=NominalValue));

        parameter Real NominalValue = 1
          "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set.";
      equation
        state = y;  //der(y) = k*u
        change = k*u;

      end Integrator;

          block Add "u + parameter"

            parameter Real k(start=1) "value added to input signal";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector";
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector";

          equation
            y = k+u;
          end Add;

          block Reciprocal "1 / u"
            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = 1/u;
          end Reciprocal;

          block Power "b ^ u"

            parameter Boolean useBaseInput = false
          "=true, if exponential base input is used instead of parameter Base";

            parameter Real Base=10 "exponential base if useBaseInput=false";

            Modelica.Blocks.Interfaces.RealOutput y;
            Modelica.Blocks.Interfaces.RealInput base(start=Base) = b if useBaseInput;
            Modelica.Blocks.Interfaces.RealInput exponent;

      protected
            Real b "Current exponential base";
          equation
            if not useBaseInput then
              b = Base;
            end if;

            y = b^exponent;
          end Power;

      block Min "Pass through the smallest signal"
        extends Modelica.Blocks.Interfaces.MISO;
      equation
         y = min(u);
      end Min;

          block Log10AsEffect "min( 0, log10(u) )"

            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = if u>1 then Modelica.Math.log10(u) else 0;
          end Log10AsEffect;

          block Parts "Divide the input value by weights"
            extends Modelica.Blocks.Interfaces.SIMO;
            parameter Real w[nout]=ones(nout) "Optional: weight coefficients";
      protected
           Real coef;
           Real weight[nout];
          equation
            ones(nout)*weight = 1;
            for i in 1:nout loop
                weight[i] = w[i] * coef;
                y[i] = u * weight[i];
            end for;
          end Parts;

          block HomotopyStrongComponentBreaker
        "Break the strong component in normalized signal with independent default constant value"
            extends Modelica.Blocks.Interfaces.SISO;
            parameter Real defaultValue=1;
            parameter Real defaultSlope=0;
          equation
            y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
            //y = homotopy(u,defaultValue);
          end HomotopyStrongComponentBreaker;

          block DegradationGain
        "Output the degradation flow from HalfTime and the amount as the input signal"

            parameter Types.Time HalfTime
          "Half time to compute degradation from amount or mass";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector";
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector";

          equation
            y = (Modelica.Math.log(2)/HalfTime)*u;
          end DegradationGain;

          block FractionGain "Output the fraction of the input signal"

            parameter Types.Fraction f
          "Half time to compute degradation from amount or mass";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector";
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector";

          equation
            y = f*u;
          end FractionGain;
    end Math;

    package Interpolation "Empirical Dependence of Two Variables"
      extends Modelica.Icons.Package;
     function Spline "Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky
          input Real xVal "input value of x to calculate y value"; //vstupni hodnota

          output Real yVal "y value at xVal";
     //     output Real outExtra;
      protected
        Integer index "index of segment";
        Integer n "number of interpolating points";

     algorithm
            // Najdi interval, ve kterem se nachazi xVal

            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

              yVal := xVal * a[1,3] + a[1,4]; //pocitam primku

            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

                 yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku

            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
     end Spline;

     function SplineCoefficients "Cubic spline interpolation coefficients"

          input Real[:] x "x coordinations of interpolating points";
          input Real[:] y "y coordinations of interpolating points";
          input Real[:] slope "slopes at interpolating points";

          output Real[size(x,1)+1,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                               //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

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
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/((x2 - x1)^3);
              a[i,2]:=(-(x2^2)*slope2-2*(x2^2)*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*(x1^2)+3*y2*x1+2*slope2*(x1^2))/((x2-x1)^3);
              a[i,3]:=-(-slope1*(x2^3)-2*(x2^2)*slope2*x1-(x2^2)*slope1*x1+x2*slope2*(x1^2)+2*x2*slope1*(x1^2)+6*x2*x1*y2-6*x2*x1*y1+slope2*(x1^3))/((x2-x1)^3);
              a[i,4]:=(-slope1*(x2^3)*x1+y1*(x2^3)-slope2*(x1^2)*(x2^2)+slope1*(x1^2)*(x2^2)-3*y1*(x2^2)*x1+3*y2*(x1^2)*x2+slope2*(x1^3)*x2-y2*(x1^3))/((x2-x1)^3);
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

     end SplineCoefficients;

          model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"

               parameter Real x[:] = fill(Modelica.Constants.N_A,1)
          "x coordinations of interpolating points";
               parameter Real y[:] = fill(Modelica.Constants.N_A,1)
          "y coordinations of interpolating points";
               parameter Real slope[:] = fill(Modelica.Constants.N_A,1)
          "slopes at interpolating points";

               parameter Real[:,3] data = transpose({x,y,slope})
          "Array of interpolating points as {x,y,slope}";

              parameter Real Xscale = 1
          "conversion scale to SI unit of x values";
              parameter Real Yscale = 1
          "conversion scale to SI unit of y values";

               Modelica.Blocks.Interfaces.RealInput u;
               Modelica.Blocks.Interfaces.RealOutput val;

      protected
              parameter Real a[:,:] = SplineCoefficients( data[:, 1]*Xscale,data[:, 2]*Yscale,data[:, 3]*Yscale/Xscale)
          "cubic polynom coefficients of curve segments between interpolating points";

          equation
            val = Spline(
                  data[:, 1]*Xscale,
                  a,
                  u);

          end Curve;
    end Interpolation;

    package Factors "Multiplication Effects"
      extends Modelica.Icons.Package;
      model Normalization "effect = u/NormalValue"
       extends Icons.BaseFactorIcon;

       parameter Real NormalValue=1
          "Normal value of u, because y=(u/NormalValue)*yBase.";

       parameter Boolean enabled=true "disabled => y=yBase";

       Modelica.Blocks.Interfaces.RealInput u;

        Types.Fraction effect;
      equation
        effect = if enabled then u/NormalValue else 1;
        y=effect*yBase;
      end Normalization;

      model DamagedFraction "effect = 1 - DamagedAreaFraction"
       extends Icons.BaseFactorIcon;

       parameter Types.Fraction DamagedAreaFraction = 0;

        Types.Fraction effect;
      equation
        effect = 1-DamagedAreaFraction;
        y=yBase*effect;
      end DamagedFraction;

      model Spline "effect = spline(data,u)"
       extends Icons.BaseFactorIcon4;
       Modelica.Blocks.Interfaces.RealInput u(nominal=Xscale);

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Real[:,3] data "Array of interpolating points as {x,y,slope}";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

        Types.Fraction effect "Multiplication coeffecient for yBase to reach y";

      protected
          parameter Real a[:,:] = if enabled then Interpolation.SplineCoefficients(
                                                            data[:, 1],data[:, 2]*Yscale,data[:, 3]*Yscale) else zeros(1,1)
          "Cubic polynom coefficients of curve segments between interpolating points";

      equation
        effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1],a,if u/Xscale <= 1 then 0 else log10(u/Xscale))
         else Interpolation.Spline(data[:, 1],a,u/Xscale);

        y=effect*yBase;
      end Spline;

      model LagSpline "Adapt the input signal before interpolation"
       extends Icons.BaseFactorIcon5;
       Modelica.Blocks.Interfaces.RealInput u;

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Types.Time HalfTime(displayUnit="min"); //=3462.468;

       parameter Real initialValue = 1 "as u/Xscale";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u_delayed/scaleX <=1 then 0 else log10(u_delayed/scaleX)";

       parameter Real[:,3] data;
        Blocks.Math.Integrator integrator(k=(Modelica.Math.log(2)/
              HalfTime), y_start=initialValue*Xscale,
          NominalValue=Xscale);
        Modelica.Blocks.Math.Feedback feedback;
        Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          Yscale=Yscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled);
      equation
        effect = spline.effect;
        connect(feedback.y, integrator.u);
        connect(integrator.y, feedback.u2);
        connect(feedback.u1, u);
        connect(integrator.y, spline.u);
        connect(yBase, spline.yBase);
        connect(spline.y, y);
      end LagSpline;

      model SplineLag "Adapt the effect after interpolation"
       extends Icons.BaseFactorIcon3;
       Modelica.Blocks.Interfaces.RealInput u;

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Types.Time HalfTime(displayUnit="d");
                                                      //Tau(unit="day");

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

       parameter Real[:,3] data;
        Modelica.Blocks.Math.Product product;
        Blocks.Math.Integrator integrator(y_start=1, k=(
              Modelica.Math.log(2)/HalfTime),
          stateName=stateName);
        Modelica.Blocks.Math.Feedback feedback;
        Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled);
        Types.Constants.FractionConst fraction(k(displayUnit="1") = 1);
      equation
        //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
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

      model SplineLagOrZero "LagSpline if not Failed"
       extends Icons.BaseFactorIcon2;
       Modelica.Blocks.Interfaces.RealInput u;

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Types.Time HalfTime(displayUnit="d");
       parameter Real[:,3] data;

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3],
          Xscale=Xscale);
        Modelica.Blocks.Math.Product product;
        Blocks.Math.Integrator integrator(y_start=1, k=(
              Modelica.Math.log(2)/HalfTime),
          stateName=stateName);
        Modelica.Blocks.Math.Feedback feedback;
        Modelica.Blocks.Logical.Switch switch1;
        Modelica.Blocks.Sources.Constant      Constant1(k=0);
        Modelica.Blocks.Interfaces.BooleanInput
                                              Failed;
         Types.Fraction effect;
        Modelica.Blocks.Logical.Switch switch2;
        Types.Constants.OneConst One;
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=enabled);
      equation
        effect = integrator.y;
        connect(curve.u, u);
        connect(yBase, product.u1);
        connect(product.y, y);
        connect(feedback.y, integrator.u);
        connect(integrator.y, feedback.u2);
        connect(integrator.y, product.u2);
        connect(curve.val, switch1.u3);
        connect(Constant1.y, switch1.u1);
        connect(switch1.u2, Failed);
        connect(switch2.y, feedback.u1);
        connect(booleanConstant.y, switch2.u2);
        connect(switch2.u1, switch1.y);
        connect(One.y, switch2.u3);
      end SplineLagOrZero;
    end Factors;

  end Blocks;

  package Chemical "Please use 'Chemical' library instead!"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model SimpleReaction

         extends Modelica.Icons.Example;

        Components.Substance         A(solute_start=0.9);
        Components.ChemicalReaction          reaction(K=1,
          useNormalizedVolume=true,
          useDissociationConstantInput=false,
          useHeatPort=false);
        Components.Substance         B(solute_start=0.1);
      equation

        connect(B.q_out, reaction.products[1]);
        connect(A.q_out, reaction.substrates[1]);
      end SimpleReaction;

      model SimpleReaction2
         extends Modelica.Icons.Example;

        Components.Substance         A(solute_start=0.9);
        Components.ChemicalReaction          reaction(K=1, nP=2);
        Components.Substance         B(solute_start=0.1);
        Components.Substance         C(solute_start=0.1);
      equation

        connect(A.q_out, reaction.substrates[1]);
        connect(reaction.products[1], B.q_out);
        connect(reaction.products[2], C.q_out);
      end SimpleReaction2;

      model ExothermicReaction

         extends Modelica.Icons.Example;

        Components.Substance         A(solute_start=0.9);
        Components.ChemicalReaction
                                  reaction(K=1,
          useHeatPort=true,
          dH=-1000,
          kf=1);
        Components.Substance         B(solute_start=0.1);
        Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor;
        Thermal.Sources.UnlimitedHeat unlimitedHeat(T=310.15);
      equation

        connect(B.q_out, reaction.products[1]);
        connect(A.q_out, reaction.substrates[1]);
        connect(reaction.heatPort, heatFlowSensor.port_a);
        connect(unlimitedHeat.port, heatFlowSensor.port_b);
      end ExothermicReaction;

      model MichaelisMenten "Basic enzyme kinetics"
        import Physiolibrary;
        extends Modelica.Icons.Example;
        extends SteadyStates.Interfaces.SteadyStateSystem(
                                                   Simulation=Types.SimulationType.SteadyState);

        Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage P(Conc=0);
        Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage S(Conc=0.1);

           parameter Types.AmountOfSubstance tE=0.01 "total amount of enzyme";
           parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
          "forward rate of second reaction";
           parameter Types.Concentration Km = 0.1
          "Michaelis constant = substrate concentration at rate of half Vmax";

        Physiolibrary.Chemical.Components.Substance ES(solute_start=0, Simulation=
             Types.SimulationType.SteadyState);
        Physiolibrary.Chemical.Components.Substance E(
          solute_start=tE,
          isDependent=true,
          Simulation=Types.SimulationType.SteadyState);
            Components.ChemicalReaction
                             chemicalReaction(nS=2,
              K=2/Km,
              kf=2*k_cat/Km);
            Components.ChemicalReaction
                             chemicalReaction1(nP=2,
              K=Modelica.Constants.inf,
              kf=k_cat);

           // Real v(unit="mol/s", displayUnit="mmol/min") "test of MM equation";
      equation
            normalizedState[1]*tE = E.solute + ES.solute;

           //Michaelis-Menton: v=((E.q_out.conc + ES.q_out.conc)*k_cat)*S.concentration/(Km+S.concentration);

        connect(S.q_out, chemicalReaction.substrates[1]);
        connect(chemicalReaction1.products[1], P.q_out);
        connect(E.q_out, chemicalReaction.substrates[2]);
        connect(E.q_out, chemicalReaction1.products[2]);
        connect(chemicalReaction.products[1], ES.q_out);
        connect(ES.q_out, chemicalReaction1.substrates[1]);
      end MichaelisMenten;

      package Hemoglobin "Hemoglobin blood gases binding"
        model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
        extends Modelica.Icons.Example;

        //extends SteadyStates.Interfaces.SteadyStateSystem(
        //                                         Simulation=SimulationType.SteadyState);

          parameter Types.Temperature T=310.15 "Temperature";
        //  parameter GasSolubility alpha =  Modelica.Constants.R*298.15 * 0.0105 * 1e-3
        //    "oxygen solubility in plasma";
                                           // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

          parameter Types.Fraction L = 7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Types.Fraction c = 0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Types.Concentration KR = 0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Types.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

        //  Fraction sO2 "hemoglobin oxygen saturation";

          parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;
        //  AmountOfSubstance totalAmountOfRforms;
        //  AmountOfSubstance totalAmountOfTforms;

          Components.Substance                       T0(stateName="T0",Simulation=Types.SimulationType.SteadyState,
            solute_start=1);

          Components.Substance                       T1(stateName="T1",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       R1(stateName="R1",Simulation=Types.SimulationType.SteadyState,
            solute_start=0,
            isDependent=true);

          Components.Substance                       T2(stateName="T2",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       R2(stateName="R2",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       T3(stateName="T3",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       R3(stateName="R3",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       T4(stateName="T4",Simulation=Types.SimulationType.SteadyState,
            solute_start=0,
            isDependent=true);

          Components.Substance                       R4(stateName="R4",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.Substance                       R0(stateName="R0",Simulation=Types.SimulationType.SteadyState,
            solute_start=0);

          Components.ChemicalReaction               quaternaryForm(K=L);
          Components.ChemicalReaction                oxyR1(nP=2, K=KR/4);
          Components.ChemicalReaction                oxyT1(nP=2, K=KT/4);
          Components.ChemicalReaction                oxyR2(nP=2, K=KR/(3/2));
          Components.ChemicalReaction                oxyR3(nP=2, K=KR/(2/3));
          Components.ChemicalReaction                oxyR4(nP=2, K=KR*4);
          Components.ChemicalReaction                oxyT2(nP=2, K=KT/(3/2));
          Components.ChemicalReaction                oxyT3(nP=2, K=KT/(2/3));
          Components.ChemicalReaction                oxyT4(nP=2, K=KT*4);
          Components.ChemicalReaction               quaternaryForm1(K=c*L);
          Components.ChemicalReaction               quaternaryForm2(K=(c^2)*L);
          Components.ChemicalReaction               quaternaryForm3(K=(c^3)*L);
          Components.ChemicalReaction               quaternaryForm4(K=(c^4)*L);

          SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
            n=10, Total(displayUnit="mol") = 1,
            Simulation=Types.SimulationType.SteadyState);
          Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8);
          Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation";
          Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10));
          Components.Substance          oxygen_unbound(solute_start=0.000001*
                7.875647668393782383419689119171e-5, Simulation=Types.SimulationType.SteadyState);
          Modelica.Blocks.Sources.Clock clock(offset=10);
          Sources.UnlimitedGasStorage          O2_in_air(Simulation=Types.SimulationType.SteadyState,
            usePartialPressureInput=true,
            T=310.15);
          Components.GasSolubility          gasSolubility(
                                              useHeatPort=false,
            kH_T0=0.026029047188736,
            C=1700);
        equation
         //  sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
        //   totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
        //   totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

        //   totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

          connect(quaternaryForm.products[1],T0. q_out);
          connect(oxyR1.substrates[1],R1. q_out);
          connect(R1.q_out,oxyR2. products[1]);
          connect(oxyR2.substrates[1],R2. q_out);
          connect(oxyR3.substrates[1],R3. q_out);
          connect(oxyR3.products[1],R2. q_out);
          connect(R3.q_out,oxyR4. products[1]);
          connect(oxyR4.substrates[1],R4. q_out);
          connect(oxyT1.products[1],T0. q_out);
          connect(oxyT1.substrates[1],T1. q_out);
          connect(T1.q_out,oxyT2. products[1]);
          connect(oxyT2.substrates[1],T2. q_out);
          connect(T2.q_out,oxyT3. products[1]);
          connect(oxyT3.substrates[1],T3. q_out);
          connect(T3.q_out,oxyT4. products[1]);
          connect(oxyT4.substrates[1],T4. q_out);
          connect(R0.q_out,quaternaryForm. substrates[1]);
          connect(R0.q_out,oxyR1. products[1]);
          connect(R1.q_out,quaternaryForm1. substrates[1]);
          connect(quaternaryForm1.products[1],T1. q_out);
          connect(R2.q_out,quaternaryForm2. substrates[1]);
          connect(quaternaryForm2.products[1],T2. q_out);
          connect(R3.q_out,quaternaryForm3. substrates[1]);
          connect(quaternaryForm3.products[1],T3. q_out);
          connect(R4.q_out,quaternaryForm4. substrates[1]);
          connect(quaternaryForm4.products[1],T4. q_out);
          connect(R4.solute,hemoglobinConservationLaw. fragment[1]);
          connect(T4.solute,hemoglobinConservationLaw. fragment[2]);
          connect(R3.solute,hemoglobinConservationLaw. fragment[3]);
          connect(T3.solute,hemoglobinConservationLaw. fragment[4]);
          connect(R2.solute,hemoglobinConservationLaw. fragment[5]);
          connect(T2.solute,hemoglobinConservationLaw. fragment[6]);
          connect(R1.solute,hemoglobinConservationLaw. fragment[7]);
          connect(T1.solute,hemoglobinConservationLaw. fragment[8]);
          connect(R0.solute,hemoglobinConservationLaw. fragment[9]);
          connect(T0.solute,hemoglobinConservationLaw. fragment[10]);
          connect(R1.solute,oxygen_bound. u[1]);
          connect(T1.solute,oxygen_bound. u[2]);
          connect(R2.solute,oxygen_bound. u[3]);
          connect(T2.solute,oxygen_bound. u[4]);
          connect(R3.solute,oxygen_bound. u[5]);
          connect(T3.solute,oxygen_bound. u[6]);
          connect(R4.solute,oxygen_bound. u[7]);
          connect(T4.solute,oxygen_bound. u[8]);
          connect(oxygen_bound.y,sO2_. u1);
          connect(sO2_.u2,tHb. y);
          connect(R0.solute,tHb. u[1]);
          connect(T0.solute,tHb. u[2]);
          connect(R1.solute,tHb. u[3]);
          connect(T1.solute,tHb. u[4]);
          connect(R2.solute,tHb. u[5]);
          connect(T2.solute,tHb. u[6]);
          connect(R3.solute,tHb. u[7]);
          connect(T3.solute,tHb. u[8]);
          connect(R4.solute,tHb. u[9]);
          connect(T4.solute,tHb. u[10]);
          connect(oxyR1.products[2],oxygen_unbound. q_out);
          connect(oxyR2.products[2],oxygen_unbound. q_out);
          connect(oxyR3.products[2],oxygen_unbound. q_out);
          connect(oxyR4.products[2],oxygen_unbound. q_out);
          connect(oxygen_unbound.q_out, oxyT1.products[2]);
          connect(oxygen_unbound.q_out, oxyT2.products[2]);
          connect(oxygen_unbound.q_out, oxyT3.products[2]);
          connect(oxygen_unbound.q_out, oxyT4.products[2]);
          connect(oxygen_unbound.q_out,gasSolubility. q_in);
          connect(O2_in_air.q_out,gasSolubility. q_out);
          connect(clock.y,O2_in_air. partialPressure);
        end Allosteric_Hemoglobin_MWC;

        model Allosteric_Hemoglobin2_MWC
          "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model as Allosteric_Hemoglobin_MWC implemented by Speciation blocks"

         extends Modelica.Icons.Example;

          parameter Types.MolarEnergy dHT=10000
            "Enthalpy of heme oxygenation in T hemoglobin form";
          parameter Types.MolarEnergy dHR=20000
            "Enthalpy of heme oxygenation in R hemoglobin form";
          parameter Types.MolarEnergy dHL=-1000
            "Enthalpy of reaction T->R as hemoglobin tetramer structure change";

          parameter Types.Fraction L = 7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Types.Fraction c = 0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Types.Concentration KR = 0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Types.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Types.AmountOfSubstance totalAmountOfHemoglobin=1;

          Components.ChemicalReaction quaternaryForm(
            K=L,
            TK=310.15,
            dH=dHL);
          Components.Speciation
                             R0_in_R(NumberOfSubunits=4, useInternalHeatsInput=true);
          Components.Speciation
                             T0_in_T(NumberOfSubunits=4, useInternalHeatsInput=true);
          Components.Substance OxyRHm[4](
            each Simulation=Types.SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=4e-19,
            each dH=-dHL/4 - dHR)
            "Oxygenated subunit in R structure of hemoglobin tetramer";
          Components.ChemicalReaction oxygenation_R[4](
            each K=KR,
            each nP=2,
            each TK=310.15,
            each dH=dHR);
          Components.Substance DeoxyRHm[4](
            each Simulation=Types.SimulationType.SteadyState,
            each solute_start=4e-11,
            each dH=-dHL/4)
            "Deoxygenated subunit in R structure of hemoglobin tetramer";
          Components.Substance OxyTHm[4](
            each Simulation=Types.SimulationType.SteadyState,
            isDependent={false,true,true,true},
            each dH=-dHT,
            each solute_start=1e-14)
            "Oxygenated subunit in T structure of hemoglobin tetramer";
          Components.ChemicalReaction oxygenation_T[4](
            each K=KT,
            each nP=2,
            each dH=dHT,
            each TK=310.15);
          Components.Substance DeoxyTHm[4](
            each Simulation=Types.SimulationType.SteadyState,
            each solute_start=0.00025,
            each dH=0)
            "Deoxygenated subunit in T structure of hemoglobin tetramer";

          Components.Substance oxygen_unbound(Simulation=Types.SimulationType.SteadyState,
              solute_start=0.000001*7.875647668393782383419689119171e-5);
          Modelica.Blocks.Sources.Clock clock(offset=10);
          Modelica.Blocks.Math.Add add[4];
          Modelica.Blocks.Math.Add add1[4];
          Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=Types.SimulationType.SteadyState,
            usePartialPressureInput=true,
            isIsolatedInSteadyState=false,
            T=310.15);
          Components.GasSolubility
                                partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.026029047188736,
            T=310.15,
            C=1700);
          SteadyStates.Components.MolarConservationLaw totalHb(
            Simulation=Types.SimulationType.SteadyState,
            Total(displayUnit="mol") = totalAmountOfHemoglobin,
            n=2);
          Modelica.Blocks.Math.Sum sum1(nin=8, k=(1/4)*ones(8));
          Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation";
          Modelica.Blocks.Math.Sum internalHeat(nin=2)
            "hemoglobin enthalpy heat";
          Modelica.Blocks.Math.Add add2[
                                       4];
          Modelica.Blocks.Math.Add add3[4];
        equation

          connect(R0_in_R.specificForm, quaternaryForm.substrates[1]);
          connect(quaternaryForm.products[1], T0_in_T.specificForm);
          connect(OxyTHm.q_out, oxygenation_T.substrates[1]);
          connect(oxygenation_T.products[1], DeoxyTHm.q_out);

          connect(OxyTHm.solute, add1.u2);
          connect(add1.u1, DeoxyTHm.solute);
          connect(partialPressure1.q_out, oxygen_in_air.q_out);
          connect(partialPressure1.q_in, oxygen_unbound.q_out);
          connect(clock.y, oxygen_in_air.partialPressure);
          connect(add.y, R0_in_R.amountOfSubunit);
          connect(OxyRHm.solute, add.u2);
          connect(DeoxyRHm.solute, add.u1);
          connect(OxyRHm.q_out, oxygenation_R.substrates[1]);
          connect(DeoxyRHm.q_out, R0_in_R.specificSubunitForm);
          connect(oxygenation_R.products[1], DeoxyRHm.q_out);
          connect(oxygenation_R[1].products[2], oxygen_unbound.q_out);
          connect(oxygenation_R[2].products[2], oxygen_unbound.q_out);
          connect(oxygenation_R[3].products[2], oxygen_unbound.q_out);
          connect(oxygenation_R[4].products[2], oxygen_unbound.q_out);
          connect(oxygenation_T[1].products[2], oxygen_unbound.q_out);
          connect(oxygenation_T[2].products[2], oxygen_unbound.q_out);
         connect(oxygenation_T[3].products[2], oxygen_unbound.q_out);
              connect(oxygenation_T[4].products[2], oxygen_unbound.q_out);
          connect(T0_in_T.specificSubunitForm, DeoxyTHm.q_out);
          connect(add1.y, T0_in_T.amountOfSubunit);
          connect(R0_in_R.amount, totalHb.fragment[1]);
          connect(T0_in_T.amount, totalHb.fragment[2]);
          connect(OxyRHm.solute, sum1.u[1:4]);

          connect(OxyTHm.solute, sum1.u[5:8]);
          connect(sO2_.u1, sum1.y);
          connect(totalHb.totalAmountOfSubstance, sO2_.u2);
          connect(R0_in_R.internalHeat, internalHeat.u[1]);
          connect(T0_in_T.internalHeat, internalHeat.u[2]);
          connect(add3.y, T0_in_T.subunitInternalHeat);
          connect(add2.y, R0_in_R.subunitInternalHeat);
          connect(add3.u1, DeoxyTHm.internalHeat);
          connect(OxyTHm.internalHeat, add3.u2);
          connect(OxyRHm.internalHeat, add2.u2);
          connect(DeoxyRHm.internalHeat, add2.u1);
        end Allosteric_Hemoglobin2_MWC;

        model Hemoglobin_MKM_Specie "Part of model Hemoglobin_MKM_Adair"

        parameter Boolean loadStarts
            "Start values of state variables from data file (to help with initialization)";
        parameter Boolean storeState
            "Save state variables at the end of simulation";
        constant String dirName = Modelica.Utilities.Files.loadResource("modelica://Physiolibrary/Resources/Data/Hemoglobin_MKM")
            "Directory to load start gues values and store final simulation values";

        parameter Real[4] pKz
            "Dissociation coefficient of reaction z (Val1 amino terminal protonation)";
        parameter Real[4] pKc
            "Dissociation coefficient of reaction c (Val1 amino terminal carbamination)";
        parameter Real[4] pKh
            "Dissociation coefficient of reaction h (other Bohr protonation reactions of side chains)";

        parameter Types.MolarEnergy[4] dH_HbuANH2
            "Standard enthalpy of deprotonated and decarboxylated hemoglobin subunit";
        parameter Types.MolarEnergy[4] dHz
            "Enthalpy of reaction z (Val1 amino terminal protonation)";
        parameter Types.MolarEnergy[4] dHc
            "Enthalpy of reaction c (Val1 amino terminal carbamination)";
        parameter Types.MolarEnergy[4] dHh
            "Enthalpy of reaction h (other Bohr protonation reactions of side chains)";

        parameter Boolean isDependent=false
            "contains dependent equation (if solver is not smart enough)";

        Interfaces.ChemicalPort_a Hbtn;
            Components.Substance Hbu_A_NH3[4](
            each Simulation=Types.SimulationType.SteadyState,
            dH=dH_HbuANH2 - dHz,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06);
        Components.Substance Hbu_AH_NH3[4](
            each Simulation=Types.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2 - dHh - dHz);
        Components.Substance Hbu_A_NH2[4](
            each Simulation=Types.SimulationType.SteadyState,
            isDependent={isDependent,true,true,true},
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2);
        Components.Substance Hbu_AH_NH2[4](
            each Simulation=Types.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06,
            dH=dH_HbuANH2 - dHh);
        Components.Substance Hbu_A_NHCOO[4](
            each Simulation=Types.SimulationType.SteadyState,
            dH=dH_HbuANH2 + dHc,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            each solute_start=1e-06);
        Components.Substance Hbu_AH_NHCOO[4](
            each Simulation=Types.SimulationType.SteadyState,
            each dirName=dirName,
            each LOAD_STARTS=loadStarts,
            each SAVE_RESULTS=storeState,
            dH=dH_HbuANH2 + dHc,
            each solute_start=1e-06);
        Components.ChemicalReaction h2[4](
            each nS=1,
            each nP=2,
            K=fill(10, 4) .^ (-pKh .+ 3),
            each TK=310.15,
            dH=dHh);
        Components.ChemicalReaction z1[4](
            each nP=2,
            K=fill(10, 4) .^ (-pKz .+ 3),
            dH=dHz,
            each TK=310.15);
        Components.ChemicalReaction z2[4](
            each nP=2,
            K=fill(10, 4) .^ (-pKz .+ 3),
            each TK=310.15,
            dH=dHz);
        Components.ChemicalReaction c1[4](
            each nS=2,
            each nP=2,
            K=fill(10, 4) .^ (-pKc .+ 3),
            each TK=310.15,
            dH=dHc);
        Components.ChemicalReaction c2[4](
            each nS=2,
            each nP=2,
            K=fill(10, 4) .^ (-pKc .+ 3),
            each TK=310.15,
            dH=dHc);
        Modelica.Blocks.Math.Sum totalAmounts[4](each nin=6);
          Interfaces.ChemicalPort_a H(conc(nominal=10^(-7.2 + 3)))
            "hydrogen ions";
          Interfaces.ChemicalPort_a CO2;
          Components.Speciation Hb_tn(
            Simulation=Types.SimulationType.SteadyState,
            NumberOfSubunits=4,
            useInternalHeatsInput=true);
        Types.RealIO.AmountOfSubstanceOutput tHb_u;
        Types.RealIO.EnergyOutput internalHeat "internal heat";
        Modelica.Blocks.Math.Sum totalHeats[4](each nin=6);
        equation
        connect(Hbu_AH_NH3.q_out, z2.substrates[1]);
        connect(Hbu_A_NH3.q_out, z1.substrates[1]);
        connect(z1.products[1], Hbu_A_NH2.q_out);
        connect(z2.products[1], Hbu_AH_NH2.q_out);
        connect(h2.substrates[1], Hbu_AH_NH2.q_out);
        connect(Hbu_A_NH2.q_out, c1.substrates[1]);
        connect(Hbu_AH_NH2.q_out, c2.substrates[1]);
        connect(c1.products[1], Hbu_A_NHCOO.q_out);
        connect(c2.products[1], Hbu_AH_NHCOO.q_out);
          connect(Hbu_A_NH3.solute, totalAmounts.u[1]);
          connect(Hbu_AH_NH3.solute, totalAmounts.u[2]);
          connect(Hbu_A_NH2.solute, totalAmounts.u[3]);
          connect(Hbu_AH_NH2.solute, totalAmounts.u[4]);
          connect(Hbu_A_NHCOO.solute, totalAmounts.u[5]);
          connect(Hbu_AH_NHCOO.solute, totalAmounts.u[6]);

        connect(Hbu_A_NH2.q_out, h2.products[1]);

          connect(Hb_tn.specificForm, Hbtn);
          connect(totalAmounts.y, Hb_tn.amountOfSubunit);

          for i in 1:4 loop
            connect(z1[i].products[2], H);
          connect(z2[i].products[2], H);

          connect(c1[i].products[2], H);
          connect(c2[i].products[2], H);

            connect(H, h2[i].products[2]);

            connect(CO2, c2[i].substrates[2]);
          connect(CO2, c1[i].substrates[2]);
          end for;
          connect(Hb_tn.specificSubunitForm, Hbu_A_NH2.q_out);
          connect(tHb_u, Hb_tn.amount);

          connect(Hb_tn.internalHeat, internalHeat);

          connect(Hbu_A_NH3.internalHeat, totalHeats.u[1]);
          connect(Hbu_AH_NH3.internalHeat, totalHeats.u[2]);
          connect(Hbu_A_NH2.internalHeat, totalHeats.u[3]);
          connect(Hbu_AH_NH2.internalHeat, totalHeats.u[4]);
          connect(Hbu_A_NHCOO.internalHeat, totalHeats.u[5]);
          connect(Hbu_AH_NHCOO.internalHeat, totalHeats.u[6]);
          connect(totalHeats.y, Hb_tn.subunitInternalHeat);
        end Hemoglobin_MKM_Specie;

        model Hemoglobin_MKM_Adair "Matejak,Kulhanek,Matousek (2014)"
          extends Modelica.Icons.Example;

          constant Real pKzD=7.73,pKcD=7.54,pKhD=7.52;
          constant Real pKzO=7.25,pKcO=8.35,pKhO=6.89;
          constant Types.MolarEnergy dHzD=-51400, dHzO=7700, dHcD=59100, dHcO=-41100, dHhD=49000, dHhO=-105000, dHo=50000, dH_HbuDANH2=0;
          // dHhD=0, dHhO=-104000, dHo=12700, dH_HbuDANH2=0;                           // dHhD=48600, dHhO=-104000, dHo=50000, dH_HbuDANH2=0;

          parameter Boolean storeResults=false;
          parameter Boolean loadStarts=true;

          Components.ChemicalReaction K1(
            K=0.0121,
            nS=1,
            nP=2);
          Components.ChemicalReaction K2(
            K=0.0117,
            nS=1,
            nP=2);
          Components.ChemicalReaction K3(
            K=0.0871,
            nS=1,
            nP=2);
          Components.ChemicalReaction K4(
            K=0.000386,
            nS=1,
            nP=2);
          Hemoglobin_MKM_Specie Hb0(
            pKz=fill(pKzD, 4),
            pKc=fill(pKcD, 4),
            pKh=fill(pKhD, 4),
            isDependent=true,
            dH_HbuANH2(displayUnit="kJ/mol") = fill(dH_HbuDANH2, 4),
            dHz(displayUnit="kJ/mol") = fill(dHzD, 4),
            dHc(displayUnit="kJ/mol") = fill(dHcD, 4),
            dHh(displayUnit="kJ/mol") = fill(dHhD, 4),
            storeState=storeResults,
            loadStarts=loadStarts);
          Hemoglobin_MKM_Specie Hb1(
            pKz=cat(    1,
                        fill(pKzD, 3),
                        fill(pKzO, 1)),
            pKc=cat(    1,
                        fill(pKcD, 3),
                        fill(pKcO, 1)),
            pKh=cat(    1,
                        fill(pKhD, 3),
                        fill(pKhO, 1)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 3),
                      fill(dH_HbuDANH2 - dHo, 1)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 3),
                      fill(dHzO, 1)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 3),
                      fill(dHcO, 1)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 3),
                      fill(dHhO, 1)),
            storeState=storeResults,
            loadStarts=loadStarts);
          Hemoglobin_MKM_Specie Hb2(
            pKz=cat(    1,
                        fill(pKzD, 2),
                        fill(pKzO, 2)),
            pKc=cat(    1,
                        fill(pKcD, 2),
                        fill(pKcO, 2)),
            pKh=cat(    1,
                        fill(pKhD, 2),
                        fill(pKhO, 2)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 2),
                      fill(dH_HbuDANH2 - dHo, 2)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 2),
                      fill(dHzO, 2)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 2),
                      fill(dHcO, 2)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 2),
                      fill(dHhO, 2)),
            storeState=storeResults,
            loadStarts=loadStarts);
          Hemoglobin_MKM_Specie Hb3(
            pKz=cat(    1,
                        fill(pKzD, 1),
                        fill(pKzO, 3)),
            pKc=cat(    1,
                        fill(pKcD, 1),
                        fill(pKcO, 3)),
            pKh=cat(    1,
                        fill(pKhD, 1),
                        fill(pKhO, 3)),
            dH_HbuANH2(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dH_HbuDANH2, 1),
                      fill(dH_HbuDANH2 - dHo, 3)),
            dHz(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHzD, 1),
                      fill(dHzO, 3)),
            dHc(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHcD, 1),
                      fill(dHcO, 3)),
            dHh(displayUnit="kJ/mol") = cat(
                      1,
                      fill(dHhD, 1),
                      fill(dHhO, 3)),
            storeState=storeResults,
            loadStarts=loadStarts);
          Hemoglobin_MKM_Specie Hb4(
            pKz=fill(pKzO, 4),
            pKc=fill(pKcO, 4),
            pKh=fill(pKhO, 4),
            dH_HbuANH2(displayUnit="kJ/mol") = fill(dH_HbuDANH2 - dHo, 4),
            dHz(displayUnit="kJ/mol") = fill(dHzO, 4),
            dHc(displayUnit="kJ/mol") = fill(dHcO, 4),
            dHh(displayUnit="kJ/mol") = fill(dHhO, 4),
            storeState=storeResults,
            loadStarts=loadStarts);
          Sources.UnlimitedGasStorage CO2(
            Simulation=Types.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            PartialPressure=0);
          Sources.UnlimitedSolutionStorage pH(
            Simulation=Types.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            Conc(displayUnit="mol/l") = 10^(-7 + 3));
          SteadyStates.Components.MolarConservationLaw totalHemoglobin(
            n=5,
            Total(displayUnit="mol") = 1,
            Simulation=Types.SimulationType.SteadyState);
          Modelica.Blocks.Math.Sum sO2(nin=4, k={4/4,3/4,2/4,1/4});
          Components.Substance oxygen_unbound(Simulation=Types.SimulationType.SteadyState,
              solute_start=1e-08);
          Modelica.Blocks.Sources.Clock clock(offset=10);
          Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=Types.SimulationType.SteadyState,
            isIsolatedInSteadyState=false,
            PartialPressure(displayUnit="Pa") = 10,
            usePartialPressureInput=true,
            T=310.15);
          Components.GasSolubility partialPressure1(
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
            C=1700,
            T=310.15);
          Modelica.Blocks.Math.Sum internalHeat(nin=5);
          Modelica.Blocks.Math.Gain gain(k=4);
          Modelica.Blocks.Continuous.Der der1;
          Modelica.Blocks.Continuous.Der der2;
          Modelica.Blocks.Math.Division derInternalHeat_per_derO2;
          Components.GasSolubility partialPressure2(
            T=310.15,
            kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.60734443440384,
            C=2400);
          Components.Substance CO2_unbound(Simulation=Types.SimulationType.SteadyState,
              solute_start=0.0012);
        equation
          connect(oxygen_unbound.q_out, K2.products[1]);
          connect(oxygen_unbound.q_out, K3.products[1]);
          connect(K1.products[1], oxygen_unbound.q_out);
          connect(oxygen_unbound.q_out, K4.products[1]);

          connect(CO2_unbound.q_out, Hb0.CO2);
          connect(Hb0.H, pH.q_out);
          connect(Hb1.H, Hb0.H);
          connect(Hb3.H, Hb0.H);
          connect(Hb4.H, Hb0.H);
          connect(Hb2.H, Hb0.H);
          connect(Hb1.CO2, Hb0.CO2);
          connect(Hb2.CO2, Hb0.CO2);
          connect(Hb3.CO2, Hb0.CO2);
          connect(Hb4.CO2, Hb0.CO2);
          connect(Hb0.Hbtn, K1.products[2]);
          connect(Hb1.Hbtn, K1.substrates[1]);
          connect(Hb1.Hbtn, K2.products[2]);
          connect(Hb2.Hbtn, K2.substrates[1]);
          connect(Hb2.Hbtn, K3.products[2]);
          connect(Hb3.Hbtn, K3.substrates[1]);
          connect(Hb3.Hbtn, K4.products[2]);
          connect(Hb4.Hbtn, K4.substrates[1]);
          connect(Hb4.tHb_u, totalHemoglobin.fragment[1]);
          connect(Hb3.tHb_u, totalHemoglobin.fragment[2]);
          connect(Hb2.tHb_u, totalHemoglobin.fragment[3]);
          connect(Hb1.tHb_u, totalHemoglobin.fragment[4]);
          connect(Hb0.tHb_u, totalHemoglobin.fragment[5]);

          connect(Hb1.tHb_u, sO2.u[4]);
          connect(Hb2.tHb_u, sO2.u[3]);

          connect(Hb3.tHb_u, sO2.u[2]);
          connect(Hb4.tHb_u, sO2.u[1]);
          connect(partialPressure1.q_out,oxygen_in_air. q_out);
          connect(partialPressure1.q_in,oxygen_unbound. q_out);
          connect(Hb0.internalHeat, internalHeat.u[1]);
          connect(Hb1.internalHeat, internalHeat.u[2]);
          connect(Hb2.internalHeat, internalHeat.u[3]);
          connect(Hb3.internalHeat, internalHeat.u[4]);
          connect(Hb4.internalHeat, internalHeat.u[5]);
          connect(gain.u, sO2.y);
          connect(internalHeat.y, der1.u);
          connect(gain.y, der2.u);
          connect(clock.y, oxygen_in_air.partialPressure);
          connect(derInternalHeat_per_derO2.u2, der2.y);
          connect(derInternalHeat_per_derO2.u1, der1.y);
          connect(CO2_unbound.q_out, partialPressure2.q_in);
          connect(CO2.q_out, partialPressure2.q_out);
        end Hemoglobin_MKM_Adair;

        package Develop
          extends Modelica.Icons.UnderConstruction;

          model QuaternaryForm
            "Model of hemoglobin space-structure form (can be parametrized as relaxed or tensed)"

            parameter Boolean isDependent = false;

            parameter Types.Concentration KA = 10^(-6.89+3)
              "dissociation coefficient for acid chains of subunit";
            parameter Types.Concentration Kz = 10^(-7.25+3)
              "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
            parameter Types.Concentration Kc = 10^(-8.35+3)
              "valine 1 amino terminus dissociation coefficient of protonation to NH3+";
            parameter Types.Concentration KO2 = 0.000671946
              "oxygen dissociation coefficient of hemoglobin subunit";

            Components.Speciation Speciation(NumberOfSubunits=12);
            Components.Substance OxyHm[4](
              each solute_start=0,
              each Simulation=Types.SimulationType.SteadyState,
              isDependent={isDependent,true,true,true})
              "Oxygenated subunit of hemoglobin tetramer";
            Components.ChemicalReaction oxygenation1[4](each nP=2, each K=KO2);
            Components.Substance DeoxyHm[4](each Simulation=Types.SimulationType.SteadyState,
                each solute_start=1e-08)
              "Deoxygenated subunit of hemoglobin tetramer";

            Modelica.Blocks.Math.Add add[4];
            Interfaces.ChemicalPort_a O2;
            Interfaces.ChemicalPort_a sForm;
            Interfaces.ChemicalPort_a H "hydrogen ion (proton)";
            Components.Substance A[4](each Simulation=Types.SimulationType.SteadyState,
                each solute_start=1e-08)
              "residual acid chains of hemoglobin subunits ";
            Components.Substance HA[4](
              each solute_start=0,
              each Simulation=Types.SimulationType.SteadyState,
              each isDependent=true)
              "residual acid chains of hemoglobin subunits ";
            Components.ChemicalReaction protonation1[4](each nP=2, each K=KA);
            Modelica.Blocks.Math.Add add1[
                                         4];
            Components.Substance NH2[4](each Simulation=Types.SimulationType.SteadyState,
                each solute_start=1e-08)
              "Val1 terminal of hemoglobin subunits ";
            Components.Substance NH3[4](
              each solute_start=0,
              each Simulation=Types.SimulationType.SteadyState,
              each isDependent=true) "Val1 terminal of hemoglobin subunits ";
            Components.ChemicalReaction protonation2[4](each nP=2, each K=Kz);
            Modelica.Blocks.Math.Add3 add2[
                                         4];
            Interfaces.ChemicalPort_a CO2;
            Components.ChemicalReaction carboxylation[4](
              each nP=2,
              each nS=2,
              each K=Kc)
              "Carboxylation of Valin1 amino terminus of hemogloni subunit";
            Components.Substance NHCOO[4](each Simulation=Types.SimulationType.SteadyState,
                each solute_start=1e-08)
              "Val1 terminal of hemoglobin subunits ";
            Types.RealIO.AmountOfSubstanceOutput tAmount(start=1e-08);
            Types.RealIO.AmountOfSubstanceOutput protonation;
            Modelica.Blocks.Math.Sum add3(k=cat(
                  1,
                  -ones(4),
                  ones(8)), nin=12);
            Modelica.Blocks.Math.Sum add4(nin=4);
            Types.RealIO.AmountOfSubstanceOutput oxygenation;
          equation

            connect(OxyHm.solute, add.u2);
            connect(DeoxyHm.solute, add.u1);
            connect(OxyHm.q_out, oxygenation1.substrates[1]);
            connect(oxygenation1.products[1], DeoxyHm.q_out);
            connect(Speciation.specificForm, sForm);
            connect(oxygenation1[1].products[2], O2);
            connect(oxygenation1[2].products[2], O2);
            connect(oxygenation1[3].products[2], O2);
            connect(oxygenation1[4].products[2], O2);
            connect(HA.q_out, protonation1.substrates[1]);
            connect(protonation1.products[1], A.q_out);
            connect(H, protonation1[1].products[2]);
            connect(protonation1[2].products[2], H);
            connect(protonation1[3].products[2], H);
            connect(protonation1[4].products[2], H);
            connect(HA.solute, add1.u2);
            connect(A.solute, add1.u1);
            connect(DeoxyHm.q_out, Speciation.specificSubunitForm[1:4]);

            connect(A.q_out, Speciation.specificSubunitForm[5:8]);
            connect(add.y, Speciation.amountOfSubunit[1:4]);

            connect(add1.y, Speciation.amountOfSubunit[5:8]);
            connect(NH3.q_out, protonation2.substrates[1]);
            connect(protonation2.products[1], NH2.q_out);
            connect(H, protonation2[1].products[2]);
            connect(protonation2[2].products[2], H);
            connect(protonation2[3].products[2], H);
            connect(protonation2[4].products[2], H);
            connect(add2.y, Speciation.amountOfSubunit[9:12]);
            connect(NH2.q_out, Speciation.specificSubunitForm[9:12]);
            connect(NH2.q_out, carboxylation.substrates[1]);
            connect(carboxylation.products[1], NHCOO.q_out);
            connect(carboxylation[1].products[2], H);
            connect(carboxylation[1].substrates[2], CO2);
            connect(carboxylation[2].products[2], H);
            connect(carboxylation[2].substrates[2], CO2);
            connect(carboxylation[3].products[2], H);
            connect(carboxylation[3].substrates[2], CO2);
            connect(carboxylation[4].products[2], H);
            connect(carboxylation[4].substrates[2], CO2);
            connect(NH3.solute, add2.u3);
            connect(NH2.solute, add2.u2);
            connect(NHCOO.solute, add2.u1);
            connect(Speciation.amount, tAmount);
            connect(HA.solute, add3.u[9:12]);
            connect(NH3.solute, add3.u[5:8]);
            connect(NHCOO.solute, add3.u[1:4]);
            connect(add3.y, protonation);
            connect(OxyHm.solute, add4.u);
            connect(add4.y, oxygenation);
          end QuaternaryForm;

          model Hemoglobin2 "Hemoglobin model"

           extends SteadyStates.Interfaces.SteadyStateSystem(
                                                    Simulation=Types.SimulationType.SteadyState);

          //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

            parameter Types.Fraction L = 7.0529*10^6
              "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
            parameter Types.Fraction Ln = 26884.8
              "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                           //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
            parameter Types.Fraction c = 0.00431555
              "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
            parameter Types.Concentration KR = 0.000671946
              "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                        //*7.875647668393782383419689119171e-5
                                                                      //10.500001495896 7.8756465463794e-05

            parameter Types.Concentration KT=KR/c
              "oxygen dissociation on tensed(T) hemoglobin subunit";

            parameter Types.AmountOfSubstance totalAmountOfHemoglobin=0.001;

            Components.ChemicalReaction quaternaryForm(K=Ln);

            QuaternaryForm R(
              KO2=KR,
              KA=10^(-6.89 + 3),
              Kz=10^(-7.25 + 3),
              Kc=10^(-8.35 + 3),
              isDependent=true);
            QuaternaryForm T(
              KO2=KT,
              KA=10^(-7.52 + 3),
              Kz=10^(-7.73 + 3),
              Kc=10^(-7.54 + 3));
            SteadyStates.Components.MolarConservationLaw totalHb(
              n=2,
              Total=totalAmountOfHemoglobin,
              Simulation=Types.SimulationType.SteadyState);
            Interfaces.ChemicalPort_a H "H+ (proton)";
            Interfaces.ChemicalPort_a CO2 "carbon dioxide";
            Interfaces.ChemicalPort_a O2 "oxygen";
            Types.RealIO.FractionOutput          protonation;
            Modelica.Blocks.Math.Add add(k1=1/4, k2=1/4);
            Modelica.Blocks.Math.Division division;
            Modelica.Blocks.Math.Add add1(
                                         k1=1/4, k2=1/4);
            Modelica.Blocks.Math.Division division1;
            Types.RealIO.FractionOutput sO2;
          equation

            connect(R.CO2, CO2);
            connect(CO2, T.CO2);

            connect(R.O2, O2);
            connect(R.H, H);
            connect(R.sForm, quaternaryForm.substrates[1]);
            connect(T.O2, O2);
            connect(T.H, H);
            connect(T.sForm, quaternaryForm.products[1]);
            connect(R.tAmount, totalHb.fragment[1]);
            connect(T.tAmount, totalHb.fragment[2]);
            connect(T.protonation, add.u1);
            connect(R.protonation, add.u2);
            connect(division.u2, totalHb.totalAmountOfSubstance);
            connect(division.u1, add.y);
            connect(protonation, division.y);
            connect(division1.u1, add1.y);
            connect(R.oxygenation, add1.u2);
            connect(T.oxygenation, add1.u1);
            connect(totalHb.totalAmountOfSubstance, division1.u2);
            connect(division1.y, sO2);
          end Hemoglobin2;

          model Hemoglobin_oxygenation "Hemoglobin oxygenation experiment"

            import Physiolibrary.Types.*;

           extends Modelica.Icons.Example;

            Components.Substance oxygen_unbound(Simulation=SimulationType.SteadyState,
                solute_start=0.000001*7.875647668393782383419689119171e-5);
            Modelica.Blocks.Sources.Clock clock(offset=1e-06);
            Sources.UnlimitedGasStorage oxygen_in_air(
              Simulation=Types.SimulationType.SteadyState,
              usePartialPressureInput=true,
              T=310.15,
              isIsolatedInSteadyState=false);
            Components.GasSolubility partialPressure1(
              kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736,
              T=310.15,
              C=1700);
            Sources.UnlimitedSolutionStorage pH(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=Types.SimulationType.SteadyState,
              Conc=10^(-7.2464 + 3),
              isIsolatedInSteadyState=false);
            Sources.UnlimitedGasStorage CO2_gas(Simulation=Types.SimulationType.SteadyState,
                PartialPressure=5332.8954966);
            Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit=
                    "(mmol/l)/kPa at 25degC") = 0.81805576878885);
            Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
                isDependent=true);
            Hemoglobin2 hemoglobin;
          equation

            connect(partialPressure1.q_out, oxygen_in_air.q_out);
            connect(partialPressure1.q_in, oxygen_unbound.q_out);
            connect(clock.y, oxygen_in_air.partialPressure);
            connect(gasSolubility.q_in,CO2_liquid. q_out);
            connect(CO2_gas.q_out,gasSolubility. q_out);
            connect(hemoglobin.CO2, CO2_liquid.q_out);
            connect(hemoglobin.H, pH.q_out);
            connect(hemoglobin.O2, oxygen_unbound.q_out);
          end Hemoglobin_oxygenation;

          model Hemoglobin_titration "Hemoglobin titration experiment"

            import Physiolibrary.Types.*;

           extends Modelica.Icons.Example;

           extends SteadyStates.Interfaces.SteadyStateSystem(
                                                    Simulation=SimulationType.SteadyState);

          //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

            parameter Fraction L = 7.0529*10^6
              "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
            parameter Fraction Ln = 26884.8
              "quaternaly form ratio for specific stripped species of hemoglobin tetramer";
                                           //L*0.00381188                                                                     //"=L*(fnT/fnR)^4 for pH=7.2464 and CO2=0";
            parameter Fraction c = 0.00431555
              "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
            parameter Concentration KR = 0.000671946
              "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                        //*7.875647668393782383419689119171e-5
                                                                      //10.500001495896 7.8756465463794e-05

            parameter Concentration KT=KR/c
              "oxygen dissociation on tensed(T) hemoglobin subunit";

            parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

            Components.Substance oxygen_unbound(Simulation=SimulationType.SteadyState,
                solute_start=0.000001*7.875647668393782383419689119171e-5);
            Modelica.Blocks.Sources.Clock clock(offset=6.7);
            Sources.UnlimitedGasStorage oxygen_in_air(
              Simulation=Types.SimulationType.SteadyState,
              usePartialPressureInput=false,
              PartialPressure=0,
              T=310.15,
              isIsolatedInSteadyState=false);
            Components.GasSolubility partialPressure1(
              kH_T0(displayUnit="(mmol/l)/kPa at 25degC") = 0.024913516594933,
              T=310.15,
              C=1700);
            Sources.UnlimitedSolutionStorage pH(
              q_out(conc(nominal=10^(-7.4 + 3))),
              isIsolatedInSteadyState=false,
              Simulation=Types.SimulationType.SteadyState,
              Conc=10^(-7.2464 + 3),
              useConcentrationInput=true);
            Sources.UnlimitedGasStorage CO2_gas(
              Simulation=Types.SimulationType.SteadyState,
              usePartialPressureInput=false,
              PartialPressure=0);
            Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit=
                    "(mmol/l)/kPa at 25degC") = 0.81805576878885);
            Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
                isDependent=true);
            Hemoglobin2 deoxyhemoglobin;
            Types.RealIO.FractionOutput protonation
              "allosteric-dependent protonation";
            Blocks.Math.Power pow;
            Modelica.Blocks.Math.Gain gain(k=-1);
            Modelica.Blocks.Math.Gain toMolPerM3(k=1000)
              "from mol/liter to mmol/liter (=mol/m3)";
          equation

            connect(partialPressure1.q_out, oxygen_in_air.q_out);
            connect(partialPressure1.q_in, oxygen_unbound.q_out);
            connect(gasSolubility.q_in,CO2_liquid. q_out);
            connect(CO2_gas.q_out,gasSolubility. q_out);
            connect(deoxyhemoglobin.CO2, CO2_liquid.q_out);
            connect(clock.y, gain.u);
            connect(gain.y, pow.exponent);
            connect(pH.concentration, toMolPerM3.y);
            connect(toMolPerM3.u, pow.y);
            connect(deoxyhemoglobin.H, pH.q_out);
            connect(deoxyhemoglobin.O2, oxygen_unbound.q_out);
            connect(deoxyhemoglobin.protonation, protonation);
          end Hemoglobin_titration;

          model Hemoglobin_titration_shifts
            "Hemoglobin titration shift caused by full deoxygenation (Bohr protons binding)"
            extends Modelica.Icons.Example;

            Hemoglobin_titration hemoglobin_titration;
            Hemoglobin_titration hemoglobin_titration1(CO2_gas(PartialPressure(
                    displayUnit="kPa") = 1470));
            Hemoglobin_titration hemoglobin_titration2(CO2_gas(PartialPressure(
                    displayUnit="kPa") = 4530));
            Hemoglobin_titration hemoglobin_titration3(CO2_gas(PartialPressure(
                    displayUnit="kPa") = 10670));
            Hemoglobin_titration hemoglobin_titration4(CO2_gas(PartialPressure(
                    displayUnit="kPa") = 26660));
            Hemoglobin_titration hemoglobin_titration5(oxygen_in_air(
                  PartialPressure=19998.35811225));
            Hemoglobin_titration hemoglobin_titration6(oxygen_in_air(
                  PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                    displayUnit="kPa") = 1470));
            Hemoglobin_titration hemoglobin_titration7(oxygen_in_air(
                  PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                    displayUnit="kPa") = 4530));
            Hemoglobin_titration hemoglobin_titration8(oxygen_in_air(
                  PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                    displayUnit="kPa") = 10670));
            Hemoglobin_titration hemoglobin_titration9(oxygen_in_air(
                  PartialPressure=19998.35811225), CO2_gas(PartialPressure(
                    displayUnit="kPa") = 26660));
            Modelica.Blocks.Math.Feedback dH;
            Modelica.Blocks.Math.Feedback dH1;
            Modelica.Blocks.Math.Feedback dH2;
            Modelica.Blocks.Math.Feedback dH3;
            Modelica.Blocks.Math.Feedback dH4;
          equation
            connect(hemoglobin_titration.protonation, dH.u1);
            connect(dH.u2, hemoglobin_titration5.protonation);
            connect(hemoglobin_titration1.protonation, dH1.u1);
            connect(dH1.u2, hemoglobin_titration6.protonation);
            connect(dH2.u2, hemoglobin_titration7.protonation);
            connect(hemoglobin_titration2.protonation, dH2.u1);
            connect(hemoglobin_titration3.protonation, dH3.u1);
            connect(dH3.u2, hemoglobin_titration8.protonation);
            connect(hemoglobin_titration4.protonation, dH4.u1);
            connect(dH4.u2, hemoglobin_titration9.protonation);
          end Hemoglobin_titration_shifts;
        end Develop;

      end Hemoglobin;

      package AcidBase
        model WaterSelfIonization
          "2 H2O  <->  OH-   +   H3O+ (It is better to solve this model using Euler solver, because there is only time dependence/no integration needed/)"
            extends Modelica.Icons.Example;
          Components.Substance H3O(
            q_out(conc(nominal=10^(-7 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7 + 3));
          SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
            Simulation=Types.SimulationType.SteadyState,
            NumberOfParticles=2,
            Total=0,
            Charges={1,-1},
            useTotalInput=true) "strong ion difference of solution";
          Components.Substance OH(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7 + 3),
            isDependent=true);
          Components.Substance H2O(
            q_out(conc(nominal=5.55e+4)),
            Simulation=Types.SimulationType.SteadyState,
            solute_start(displayUnit="mol") = 1/0.018,
            isDependent=true);
          Components.ChemicalReaction waterDissociation(nP=2,
            s={2},
            K=(1e-8)*((18e-6)^2));
          SteadyStates.Components.MolarConservationLaw tH2O(
            Simulation=Types.SimulationType.SteadyState,
            n=3,
            Total(displayUnit="mol") = 1/0.018) "total water concentration";
          Modelica.Blocks.Sources.Clock SID(offset=-1e-6)
            "strong ions difference with respect to albumin charge shift";
          Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,  y(unit="C"))
            "from elementary charge to electric charge, which is needed in system";
        equation
          connect(H2O.q_out, waterDissociation.substrates[1]);
          connect(waterDissociation.products[2], H3O.q_out);
          connect(waterDissociation.products[1], OH.q_out);
          connect(tH2O.fragment[1], H2O.solute);
          connect(OH.solute, tH2O.fragment[2]);
          connect(H3O.solute, tH2O.fragment[3]);

          connect(SID.y,toColoumn. u);
          connect(toColoumn.y, electroneutrality.total);
          connect(H3O.solute, electroneutrality.fragment[1]);
          connect(OH.solute, electroneutrality.fragment[2]);
        end WaterSelfIonization;

        model CarbonDioxideInWater "CO2 as alone acid-base buffer"
            extends Modelica.Icons.Example;
          Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState);
          Components.ChemicalReaction HendersonHasselbalch(
            nP=2,
            K=10^(-6.103 + 3),
            nS=1,
            dH(displayUnit="kJ/mol") = 7300);
          Sources.UnlimitedGasStorage CO2_gas(
              Simulation=Types.SimulationType.SteadyState,
              PartialPressure=5332.8954966);
          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7 + 3));
          Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.81805576878885);
          Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
              isDependent=true);
          SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
            Simulation=Types.SimulationType.SteadyState,
            useTotalInput=true,
            NumberOfParticles=3,
            Charges={-1,-2,1},
            Total=2894.560197) "strong ion difference of solution";
          Components.Substance CO3(
            Simulation=Types.SimulationType.SteadyState,
            isDependent=true,
            solute_start=1e-08);
          Components.ChemicalReaction c2(
            nP=2,
            K=10^(-10.33 + 3),
            nS=1,
            dH(displayUnit="kJ/mol") = 14900);
          Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F, y(unit="C"))
            "from elementary charge to to electric charge, which is needed in system";
          Modelica.Blocks.Sources.Clock SID(offset=-0.01)
            "strong ions difference with respect to albumin charge shift";
        equation
          connect(HendersonHasselbalch.products[1], HCO3.q_out);
          connect(H3O.q_out, HendersonHasselbalch.products[2]);
          connect(CO2_liquid.q_out, HendersonHasselbalch.substrates[1]);
          connect(gasSolubility.q_in, CO2_liquid.q_out);
          connect(CO2_gas.q_out, gasSolubility.q_out);
          connect(HCO3.solute, electroneutrality.fragment[1]);
          connect(CO3.solute, electroneutrality.fragment[2]);
          connect(H3O.solute, electroneutrality.fragment[3]);
          connect(H3O.q_out, c2.products[2]);
          connect(HCO3.q_out, c2.substrates[1]);
          connect(c2.products[1], CO3.q_out);
          connect(SID.y,toColoumn. u);
          connect(electroneutrality.total, toColoumn.y);
        end CarbonDioxideInWater;

        model AlbuminTitration "Figge-Fencl model (22. Dec. 2007)"
          extends Modelica.Icons.Example;

          Components.Substance H3O(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=true) "hydrogen ions activity";

          SteadyStates.Components.MolarConservationLaw
            molarConservationLaw[n](
            each n=2,
            each Simulation=Types.SimulationType.SteadyState,
            each Total=0.00066);
          SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
            Simulation=Types.SimulationType.SteadyState,
            NumberOfParticles=n,
            Charges=ones(n),
            useTotalInput=true,
            Total=6425.92363734) "strong ion difference of solution";
          Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,y(unit="C"))
            "from elementary charge to to electric charge, which is needed in system";
          Modelica.Blocks.Sources.Clock SID(offset=-0.0832)
            "strong ions difference with respect to albumin charge shift";

          parameter Integer n=218
            "Number of weak acid group in albumin molecule";
          parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
            "acid dissociation constants";

          Components.Substance A[n](
            each Simulation=Types.SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=0.00033) "deprotonated acid groups";
          Components.ChemicalReaction react[n](each nP=2, K=fill(10.0, n) .^ (-
                pKAs .+ 3));

          Components.Substance HA[n](each Simulation=Types.SimulationType.SteadyState,
              each solute_start=0.00033) "protonated acid groups";

        equation
          connect(react.products[1], A.q_out);
          for i in 1:n loop
            connect(react[i].products[2], H3O.q_out);
          end for;
          connect(HA.q_out, react.substrates[1]);
          connect(A.solute, molarConservationLaw.fragment[1]);
          connect(HA.solute, molarConservationLaw.fragment[2]);
          connect(SID.y,toColoumn. u);
          connect(HA.solute, electroneutrality.fragment);
          connect(toColoumn.y, electroneutrality.total);
        end AlbuminTitration;

        model Phosphate
            extends Modelica.Icons.Example;

          parameter Types.Concentration totalPO4=0.00115
            "Total phosphate concentration";

          Modelica.Blocks.Math.Log10 minusPh "value of minus pH";

          Modelica.Blocks.Sources.Clock SID(offset=0)
            "strong ions difference with respect to albumin charge shift";

          Components.Substance H(
            q_out(conc(nominal=10^(-7.4 + 3))),
            Simulation=Types.SimulationType.SteadyState,
            solute_start=10^(-7.4 + 3),
            isDependent=true) "hydrogen ions activity";

          Components.Substance H3PO4(
            Simulation=Types.SimulationType.SteadyState,
            isDependent=true,
            solute_start=1e-08);
          Components.Substance H2PO4(Simulation=Types.SimulationType.SteadyState,
              solute_start=0.0005);
          Components.Substance HPO4(Simulation=Types.SimulationType.SteadyState,
              solute_start=0.0006);
          Components.Substance PO4(Simulation=Types.SimulationType.SteadyState,
              solute_start=1e-08);

          Components.ChemicalReaction chemicalReaction(nP=2, K=10^(-1.915 + 3));
          Components.ChemicalReaction chemicalReaction1(nP=2, K=10^(-6.66 + 3));
          Components.ChemicalReaction chemicalReaction2(nP=2, K=10^(-11.78 + 3));
          SteadyStates.Components.MolarConservationLaw tP04(
            each Simulation=Types.SimulationType.SteadyState,
            each n=4,
            each Total=totalPO4*1);

          SteadyStates.Components.ElementaryChargeConservationLaw
            electroneutrality(
            Simulation=Types.SimulationType.SteadyState,
            Total(displayUnit="meq") = 3502.41783837,
            useTotalInput=true,
            NumberOfParticles=3,
            Charges={-1,-2,-3});

          Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=Modelica.Constants.F,y(unit="C"))
            "from elementary charge to Coloumn";

        equation
          connect(H3PO4.q_out, chemicalReaction.substrates[1]);
          connect(chemicalReaction.products[1], H2PO4.q_out);
          connect(H2PO4.q_out, chemicalReaction1.substrates[1]);
          connect(chemicalReaction1.products[1], HPO4.q_out);
          connect(HPO4.q_out, chemicalReaction2.substrates[1]);
          connect(chemicalReaction2.products[1], PO4.q_out);
          connect(chemicalReaction.products[2], H.q_out);
          connect(chemicalReaction1.products[2], H.q_out);
          connect(chemicalReaction2.products[2], H.q_out);
          connect(H3PO4.solute, tP04.fragment[1]);
          connect(H2PO4.solute, tP04.fragment[2]);
          connect(HPO4.solute, tP04.fragment[3]);
          connect(PO4.solute, tP04.fragment[4]);
          connect(H.solute, minusPh.u);
          connect(SID.y, toColoumn.u);
          connect(toColoumn.y, electroneutrality.total);
          connect(H2PO4.solute, electroneutrality.fragment[1]);
          connect(HPO4.solute, electroneutrality.fragment[2]);
          connect(PO4.solute, electroneutrality.fragment[3]);
        end Phosphate;

        class Develop
          extends Modelica.Icons.UnderConstruction;
          model PlasmaAcidBase

            Components.Substance H3O(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=Types.SimulationType.SteadyState,
              solute_start=10^(-7.4 + 3),
              isDependent=true) "hydrogen ions activity";

            SteadyStates.Components.MolarConservationLaw tAlb[n](
              each n=2,
              each Simulation=Types.SimulationType.SteadyState,
              each Total=0.00066);
            SteadyStates.Components.ElementaryChargeConservationLaw electroneutrality(
              Simulation=Types.SimulationType.SteadyState,
              useTotalInput=true,
              Charges=cat(
                  1,
                  {-1,-1,-2,-1},
                  ones(n)),
              NumberOfParticles=m + n,
              Total=6425.92363734) "strong ion difference of solution";
            Modelica.Blocks.Math.Gain toColoumn(k(unit="C/s")=-Modelica.Constants.F,y(unit="C"))
              "from elementary charge to to electric charge, which is needed in system";
            Modelica.Blocks.Sources.Clock SID_less_Cl(offset=-0.0832)
              "strong ions difference without chloride with respect to albumin charge shift";

            constant Integer m=4
              "number of particle types in electroneutrality equation";

            parameter Boolean isDependent[3] = {false,false,false};

            parameter Types.AmountOfSubstance totalPO4=0.00115
              "Total phosphate concentration";
            parameter Types.AmountOfSubstance totalAlb=0.00066
              "Total albumin concentration";

            parameter Integer n=218
              "Number of weak acid group in albumin molecule";
            parameter Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
              "acid dissociation constants";

            Components.Substance A[n](
              each Simulation=Types.SimulationType.SteadyState,
              each isDependent=true,
              each solute_start=0.00033) "deprotonated acid groups";
            Components.ChemicalReaction react[n](each nP=2, K=fill(10.0, n) .^
                  (-pKAs .+ 3));

            Components.Substance HA[n](each Simulation=Types.SimulationType.SteadyState,
                each solute_start=0.00033) "protonated acid groups";

            Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[1]);
            Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[2]);
            Interfaces.ChemicalPort_a substances[3]
              "{free dissolved CO2, bicarbonate, chloride}";
            Components.Substance                        H2PO4(Simulation=Types.SimulationType.SteadyState,
                solute_start=0.0005);
            Components.ChemicalReaction phosphateAcidification(nP=2, K=10^(-6.66 + 3));
            Components.Substance                        HPO4(Simulation=Types.SimulationType.SteadyState,
              isDependent=true,
              solute_start=0.0006);
            SteadyStates.Components.MolarConservationLaw               tP04(
              each Simulation=Types.SimulationType.SteadyState,
              each n=2,
              each Total=totalPO4);
            Components.Substance Cl(Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[3]) "chloride anion";
          equation
            connect(react.products[1], A.q_out);
            for i in 1:n loop
              connect(react[i].products[2], H3O.q_out);
            end for;
            connect(HA.q_out, react.substrates[1]);
            connect(A.solute, tAlb.fragment[1]);
            connect(HA.solute, tAlb.fragment[2]);
            connect(toColoumn.y, electroneutrality.total);
            connect(substances[1], CO2_liquid.q_out);
            connect(HCO3.q_out, substances[2]);
            connect(H2PO4.q_out, phosphateAcidification.substrates[1]);
            connect(phosphateAcidification.products[1], HPO4.q_out);
            connect(H2PO4.solute, tP04.fragment[1]);
            connect(HPO4.solute, tP04.fragment[2]);
            connect(phosphateAcidification.products[2], H3O.q_out);
            connect(HCO3.solute, electroneutrality.fragment[1]);
            connect(H2PO4.solute, electroneutrality.fragment[2]);
            connect(HPO4.solute, electroneutrality.fragment[3]);
            connect(Cl.q_out, substances[3]);
            connect(HA.solute, electroneutrality.fragment[(m+1):(n+m)]);
            connect(SID_less_Cl.y, toColoumn.u);
            connect(Cl.solute, electroneutrality.fragment[4]);
          end PlasmaAcidBase;

          model ErythrocyteAcidBase
            parameter Boolean isDependent[4] = {false,false,false,false};

            Components.Substance H3O(
              q_out(conc(nominal=10^(-7.4 + 3))),
              Simulation=Types.SimulationType.SteadyState,
              solute_start=10^(-7.4 + 3),
              isDependent=isDependent[4]) "hydrogen ions activity";
            Components.ChemicalReaction HendersonHasselbalch(
              nP=2,
              dH=15.13,
              K=10^(-6.103 + 3),
              nS=1);
            Components.Substance CO2_liquid(Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[1]);
            Components.Substance HCO3(                  Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[2]);
            Interfaces.ChemicalPort_a substances[3]
              "{free dissolved CO2, bicarbonate, chloride}";
            Components.Substance Cl(Simulation=Types.SimulationType.SteadyState,
                isDependent=isDependent[3]) "chloride anion";
          equation
            connect(HendersonHasselbalch.products[1],HCO3. q_out);
            connect(H3O.q_out,HendersonHasselbalch. products[2]);
            connect(CO2_liquid.q_out,HendersonHasselbalch. substrates[1]);
            connect(substances[1], CO2_liquid.q_out);
            connect(HCO3.q_out, substances[2]);
            connect(Cl.q_out, substances[3]);
          end ErythrocyteAcidBase;

          model BloodAcidBase
            PlasmaAcidBase plasmaAcidBase;
            Develop.ErythrocyteAcidBase erythrocyteAcidBase;
            Components.Membrane membrane(NumberOfParticles=3);
          equation
            connect(plasmaAcidBase.substances, membrane.particlesInside);
            connect(membrane.particlesOutside, erythrocyteAcidBase.substances);
          end BloodAcidBase;
        end Develop;
      end AcidBase;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model Substance "Substance accumulation in solution"
        extends Icons.Substance;
        extends Interfaces.ConditionalVolume;

        extends SteadyStates.Interfaces.SteadyState(
        state(nominal=NominalSolute),
        change(nominal=NominalSolute/60),
        state_start=solute_start,
        storeUnit="mmol");

        parameter Types.AmountOfSubstance solute_start(nominal=NominalSolute) = 1e-8
          "Initial solute amount in compartment";

        Types.RealIO.AmountOfSubstanceOutput solute(nominal=
            NominalSolute) "Current amount of solute";

        parameter Types.AmountOfSubstance NominalSolute = 0.001
          "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller.";

        Interfaces.ChemicalPort_b q_out(conc(start=solute_start/NormalVolume))
          "Concentration and molar flow from/to compartment";

        parameter Types.MolarEnergy dH=0 "Standard Enthalpy Change";

        Types.RealIO.EnergyOutput internalHeat
          "Internal heat energy = enthalpy*amountOfSubstance";
      equation
        q_out.conc = solute/volume;

        state = solute; // der(solute)=q_out.q
        change = q_out.q;

        internalHeat = dH*solute;

      end Substance;

      model ChemicalReaction "Chemical Reaction"
        import Physiolibrary;

        Real KaT "Dissociation constant at current temperature";
        Types.MolarFlowRate rr "Reaction molar flow rate";

        extends Physiolibrary.Chemical.Interfaces.ConditionalVolume;

        parameter Boolean useDissociationConstantInput = false
          "=true, if external dissociation ratio is used";

        parameter Boolean useForwardRateInput = false
          "=true, if external forward rate is used";

        Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
          "Dissociation coefficient [SI-unit]";

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b products[nP]
          "Products";

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a substrates[nS]
          "Substrates";

        parameter Real K = 1
          "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false";

        parameter Real kf = 10^8 "Forward reaction rate coefficient [SI unit]";
        //  annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

        parameter Integer nS=1 "Number of substrates types";
        parameter Integer nP=1 "Number of products types";

        parameter Types.StoichiometricNumber s[nS]=ones(nS)
          "Stoichiometric reaction coefficient for substrates";
        parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
          "Activity coefficients of substrates";

        parameter Types.StoichiometricNumber p[nP]=ones(nP)
          "Stoichiometric reaction coefficients for products";
         parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
          "Activity coefficients of products";

       extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;

        parameter Types.Temperature TK=298.15 "Base temperature";

        parameter Types.MolarEnergy dH=0
          "Standard Enthalpy Change (negative=exothermic)";

        parameter Types.Fraction solventFraction=1
          "Free solvent fraction in liquid (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

        Real KBase "dissociation constant at TK";

        Real forwardRate;
      protected
        parameter Types.Fraction fsp=solventFraction^(sum(s)+sum(p));
        parameter Types.Fraction fs=solventFraction^(sum(s));
        parameter Types.Fraction fp=solventFraction^(sum(p));

      public
        Modelica.Blocks.Interfaces.RealInput forwardRateCoefficient(start=kf)=forwardRate if
                                                                                      useForwardRateInput
          "Reaction forward rate coefficient [SI-unit]";
      equation
        if not useDissociationConstantInput then
          KBase = K;
        end if;
        if not useForwardRateInput then
          forwardRate = kf;
        end if;

        KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation
        //this Hoff's equation is valid in gases reactions with the same number of substrates and products and plus-minus in liquid solutions.
        //for gaseous reaction with dn!=0 (stoichoimetry difference, i.e. the stoichiometru number of products minus the stoichiometry number of reactants) is the Van't Hoff's energy (dE) different from enthalphy of reaction (DH): dE=dH-dn*R*T (Ref: D. M. Golden, "Standard states for thermochemical and activation parameters," Journal of Chemical Education, vol. 48, p. 235, 1971/04/01 1971.)

        rr*fsp = forwardRate*volume*(product((as.*substrates.conc).^s)*fp - (1/KaT)*product((ap.*products.conc).^p)*fs);  //Elementary first-order rate kinetics - the main equation

        lossHeat = -dH*rr; //dH<0 => Exothermic => lossHeat>0, Endothermic otherwise

        rr*s = substrates.q;
        rr*p = -products.q;

      end ChemicalReaction;

      model GasSolubility "Henry's law of gas solubility in liquid."
         //q_in is dissolved in liquid and q_out is in gaseous solution"

        extends Icons.GasSolubility;
        extends Interfaces.ConditionalHeatPort;

        parameter Types.DiffusionPermeability solubilityRateCoef=0.01
          "The rate constant of incoming gas to solution (default 10 liter per second)";

        Types.GasSolubility kH
          "Henry's law coefficient such as liquid-gas concentration ratio";

        parameter Types.GasSolubility kH_T0
          "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.011, aCO2=0.245, ..)";
        parameter Types.Temperature T0=298.15 "Base temperature for kH_T0";
        parameter Types.Temperature C(displayUnit="K")
          "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)";

        parameter Types.Fraction solventFraction=1
          "Free solvent fraction in liquid (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

        Interfaces.ChemicalPort_b q_out "Gaseous solution";

        Interfaces.ChemicalPort_a q_in "Dissolved in liquid solution";
      equation
        q_in.q + q_out.q = 0;

        kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

        // equilibrium:  liquid.conc = kH * gas.conc;
        q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc/solventFraction); //negative because of outflow

        lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

      end GasSolubility;

      model Diffusion "Solute diffusion"
        extends Icons.Diffusion;
        extends Interfaces.OnePort;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used";

        parameter Types.DiffusionPermeability Conductance=0
          "Diffusion conductance if useConductanceInput=false";

      protected
        Types.DiffusionPermeability c;
      public
        Types.RealIO.DiffusionPermeabilityInput conductance = c if useConductanceInput;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

         q_in.q = c * (q_in.conc - q_out.conc);

      end Diffusion;

      model Membrane
        "Donnan's equilibrium of electrolytes usable for glomerular membrane, open/leak membrane channels, pores, ..."
        extends Icons.Membrane;
        extends Interfaces.ConditionalHeatPort;

        parameter Integer NumberOfParticles = 1
          "Number of penetrating particle types";
        parameter Integer Charges[NumberOfParticles] = zeros(NumberOfParticles)
          "Elementary charges of particles";
        parameter Types.DiffusionPermeability Permeabilities[NumberOfParticles] = zeros(NumberOfParticles)
          "Permeabilities of particles through membrane chanel";

        parameter Boolean usePermeabilityInput = false
          "=true, if external permeability value is used";

        Interfaces.ChemicalPort_a particlesInside[NumberOfParticles]
          "inner side of membrane, solution";
        Interfaces.ChemicalPort_b particlesOutside[NumberOfParticles]
          "outer side of membrane, solution";

        Types.RealIO.DiffusionPermeabilityInput permeability[NumberOfParticles] = p if usePermeabilityInput;

        Types.GasSolubility kH[NumberOfParticles]
          "Concentration ratio at equilibrium";

        parameter Types.GasSolubility kH_T0[NumberOfParticles] = ones( NumberOfParticles)
          "Equilibrated concentration ratio at temperature T0 - can be estimated by Henry's law coefficient ratios (kH1/kH2)";
        parameter Types.Temperature T0=298.15 "Base temperature for kH_T0";
        parameter Types.Temperature C[NumberOfParticles](displayUnit="K") = zeros(NumberOfParticles)
          "Specific constant difference (C1-C2) for Van't Hoff's change of kH";

        parameter Types.Fraction solventFractionInside=1
          "Free solvent fraction inside (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";
        parameter Types.Fraction solventFractionOutside=1
          "Free solvent fraction outside (i.e. 'mol/mol' ratio between current solution and pure solvent in one liter; e.g. in plasma=0.96, in RBC=0.717)";

      protected
         Real KAdjustment
          "=(Cations-AnionLessProteins)/(Cations+AnionLessProteins)";
         Types.DiffusionPermeability p[NumberOfParticles];

      equation
        if not usePermeabilityInput then
          p=Permeabilities;
        end if;

         //no accumulation of particles:
         particlesInside.q + particlesOutside.q = zeros(NumberOfParticles); //nothing lost inside

         //electroneutrality:
         if abs(Charges.*Charges*p)<=Modelica.Constants.eps then
           KAdjustment=0; //no penetrating electrolytes => KAdjustment and electroneutrality of flux is not needed
         else
           Charges*particlesInside.q = 0; //electroneutrality of flux through membrane
         end if;

         //diffusion, penetration, particle movement:
         for i in 1:NumberOfParticles loop
           if Charges[i]==0 then //normal diffusion
             particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - kH[i]*particlesOutside[i].conc/solventFractionOutside);
           elseif Charges[i]>0 then //cation goes to Donnan's equilibrium
             particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1+KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
           else //anion goes to Donnan's equilibrium
             particlesInside[i].q = p[i] * (particlesInside[i].conc/solventFractionInside - (1-KAdjustment)*kH[i]*particlesOutside[i].conc/solventFractionOutside);
           end if;
         end for;

         //different solubilities:
         kH = kH_T0 .* Modelica.Math.exp(C * (1/T_heatPort - 1/T0));
         lossHeat = Modelica.Constants.R* C*particlesOutside.q; //negative = heat are comsumed when change from liquid to gas

      end Membrane;

      model Speciation
        "Chemical species definition by independent binding sides of macromolecule"
        extends Icons.Speciation;

        extends SteadyStates.Interfaces.SteadyStateSystem(
                                                 Simulation=Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunits-1);
        extends Interfaces.ConditionalVolume;

        parameter Integer NumberOfSubunits=1
          "Number of independent subunits occurring in molecule";

        Interfaces.ChemicalPort_a specificForm
          "Specific form composed with subunits form of subunitSpiecies";
        Interfaces.ChemicalPort_a specificSubunitForm[NumberOfSubunits]
          "Specific form of subunits of specific molecule form in connector called spieces";
      protected
        Real fractions[NumberOfSubunits];
      public
        Types.RealIO.AmountOfSubstanceInput amountOfSubunit[NumberOfSubunits]
          "Total amount of the subunits in all forms";
        Types.RealIO.AmountOfSubstanceOutput amount
          "Total amount of macromolecules in this system";                                   //(start=1e-8)
        Types.RealIO.EnergyOutput internalHeat
          "Relative internal heat of all chemical forms in this system";

      //system internal heat
        parameter Boolean useInternalHeatsInput = false
          "=true, if subunitInternalHeat inputs are used instead of parameter SubunitEnthalpies";

        parameter Types.MolarEnergy SubunitEnthalpies[NumberOfSubunits]=zeros(NumberOfSubunits)
          "Enthalpy changes of substances (can relative to one chosen specific form of chemical substance in the system) if useEnthalpiesInput=false";

        Types.RealIO.EnergyInput subunitInternalHeat[NumberOfSubunits](each start=0)=internalHeatOfSubunit if useInternalHeatsInput;

         Types.Energy internalHeatOfSubunit[NumberOfSubunits]
          "Internal heat of subunits";
      equation

        amount = amountOfSubunit[1];

        fractions = if (amount < Modelica.Constants.eps) then zeros(NumberOfSubunits)
                    else specificSubunitForm.conc ./ (amountOfSubunit/volume);

        specificForm.conc = (amount/volume)*product(fractions); //chemical speciation

        for i in 2:NumberOfSubunits loop
                   normalizedState[i-1]*amount = amountOfSubunit[i];
        end for;

      //molar flow:
        specificSubunitForm.q = -specificForm.q * ones(NumberOfSubunits);

      //heat:
         if not useInternalHeatsInput then
          internalHeatOfSubunit = SubunitEnthalpies.*amountOfSubunit;
        end if;
        internalHeat=sum(internalHeatOfSubunit);

      end Speciation;

      model Degradation "Degradation of solute"
        extends Interfaces.ConditionalVolume;

        Interfaces.ChemicalPort_a q_in "Degraded solute outflow";

        parameter Types.Time HalfTime
          "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation nor clearence nor degradation exist.";

      protected
        Types.VolumeFlowRate Clearance;
      equation
        Clearance = volume*Modelica.Math.log(2)/HalfTime;
        q_in.q = Clearance*q_in.conc;

      end Degradation;

      model Clearance "Clearance with or without solvent outflow"

        parameter Types.VolumeFlowRate Clearance=0
          "Clearance of solute if useSolutionFlowInput=false";

        parameter Real K(unit="1")=1
          "Coefficient such that Clearance = K*solutionFlow";

        extends Hydraulic.Interfaces.ConditionalSolutionFlow(SolutionFlow=
              Clearance/K);

        Interfaces.ChemicalPort_a q_in "solute outflow";

        Types.VolumeFlowRate clearance;
      equation

        clearance = q*K;

        q_in.q = clearance*q_in.conc;

      //  assert(clearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

      end Clearance;

      model Stream "Flow of whole solution"
        extends Interfaces.OnePort;
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

      equation
        q_in.q = if
                   (q>0) then q*q_in.conc else q*q_out.conc;

      end Stream;

      model SolutePump "Prescribed solute flow"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalSoluteFlow;

      equation
        q_in.q = q;

      end SolutePump;

      model Dilution "Adding/removing of the solvent to/from running solution"
        extends Interfaces.OnePort;
        extends Icons.Dilution;

        parameter Boolean useDilutionInput = false
          "=true, if dilition input is used";

        parameter Types.Fraction Dilution=1
          "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false";

        Types.RealIO.FractionInput dilution(start=Dilution)= d if useDilutionInput
          "Fraction of final undilutes solution";
      protected
        Types.Fraction d;
      equation
        if not useDilutionInput then
          d=Dilution;
        end if;
        q_out.conc = d * q_in.conc;

      end Dilution;

      model Reabsorption "Reabsorption as input fraction"
         extends Icons.Reabsorption;

        parameter Boolean useEffect = false
          "=true, if reabsorption fraction is BaseReabsorption^(1/Effect)";

        parameter Boolean useMaxReabInput = false
          "=true, if external maximum of reabsorption molar flow is used";

        parameter Boolean useBaseReabsorption = false
          "=false, if BaseReabsorption=1";

        parameter Types.MolarFlowRate MaxReabsorption = Modelica.Constants.inf
          "Maximal reabsorption molar flow if useMaxReabInput=false";

        Interfaces.ChemicalPort_a Inflow "Tubular inflow";
        Interfaces.ChemicalPort_b Outflow "Tubular outflow";

        Interfaces.ChemicalPort_b Reabsorption "Reabsorption from tubules";
        Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
          "Base fraction of molar inflow for reabsorption flow";

        Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
          "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)";
        Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
          "Maximal allowed reabsorption molar flow rate";
        Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
          "Actual reabsorbed fraction from solute inflow rate";

        Types.Fraction reabFract,baseReabFract,e;
        Types.MolarFlowRate mr;
      equation
        Inflow.conc = Outflow.conc;
        0 = Inflow.q + Outflow.q + Reabsorption.q;

        Reabsorption.q=-min(mr,reabFract*Inflow.q);

        reabFract = baseReabFract^(1/e);

        if not useBaseReabsorption then
          baseReabFract=1;
        end if;

        if not useMaxReabInput then
          mr=MaxReabsorption;
        end if;

        if not useEffect then
          e=1;
        end if;

      end Reabsorption;

    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;

      model MolarFlowMeasure "Measure of molar flow"
        extends Interfaces.OnePort;
        //extends Icons.MolarFlowMeasure;
        extends Modelica.Icons.RotationalSensor;

       Types.RealIO.MolarFlowRateOutput molarFlowRate;
      equation
        q_in.conc = q_out.conc;

        molarFlowRate = q_in.q;

      end MolarFlowMeasure;

      model ConcentrationMeasure "Measure of molar concentration"
        extends Modelica.Icons.RotationalSensor;

        Interfaces.ChemicalPort_a q_in "For measure only";
        Types.RealIO.ConcentrationOutput concentration "Concentration";
      equation

        concentration =         q_in.conc;

        q_in.q = 0;
      end ConcentrationMeasure;

      model IncrementalFlowConcentrationMeasure
        "Incremental flow concentration meassure in circulation after absorption/secretion source (i.e. portal vein concentration)"
        extends Modelica.Icons.RotationalSensor;

        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

       Types.RealIO.ConcentrationOutput concentration
          "Concentration after absorption source";

        Types.RealIO.MolarFlowRateInput addition;
        Interfaces.ChemicalPort_a q_in;
      equation
        concentration = if (q>0) then q_in.conc + addition/q else q_in.conc;
        q_in.q=0;

      end IncrementalFlowConcentrationMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedSolutePump "Molar pump of solute to system"
        extends Interfaces.ConditionalSoluteFlow;

        Interfaces.ChemicalPort_b q_out "Outflow";

      equation
        q_out.q = - q;

      end UnlimitedSolutePump;

      model UnlimitedSolutionStorage "Constant concentration source"

        Interfaces.ChemicalPort_b q_out
          "constant concentration with any possible flow";

        parameter Boolean useConcentrationInput = false
          "=true, if fixed concentration is from input instead of parameter";

         parameter Types.Concentration Conc = 0
          "Fixed concentration if useConcentrationInput=false";

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added.";

         Types.RealIO.ConcentrationInput concentration(start=Conc)=c if useConcentrationInput;

      protected
        Types.Concentration c "Current concentration";

      initial equation
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
         if not useConcentrationInput then
           c=Conc;
         end if;

        q_out.conc = c;

        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
          q_out.q = 0;
        end if;

      end UnlimitedSolutionStorage;

      model UnlimitedGasStorage "Constant ideal gas source"
        extends Interfaces.ConditionalHeatPort;
        Interfaces.ChemicalPort_b q_out
          "constant gas concentration with any possible flow";

        parameter Boolean usePartialPressureInput = false
          "=true, if fixed partial pressure is from input instead of parameter";

         parameter Types.Pressure PartialPressure = 0
          "Fixed partial pressure if usePartialPressureInput=false";

        Types.RealIO.PressureInput partialPressure(start=PartialPressure) = p if usePartialPressureInput
          "Partial pressure of Gas = air pressure * gas fraction";

       parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added.";

      protected
        Types.Pressure p "Current partial pressure";

      initial equation
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
        if not usePartialPressureInput then
          p=PartialPressure;
        end if;

        q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
           q_out.q = 0;
        end if;

        lossHeat=0; //only read temperature from heat port

      end UnlimitedGasStorage;

      model UnlimitedSolutePumpOut "Molar pump of solute out of system"
        extends Interfaces.ConditionalSoluteFlow;

        Interfaces.ChemicalPort_a q_in "Inflow";

      equation
        q_in.q = q;

      end UnlimitedSolutePumpOut;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector ChemicalPort "Concentration and Solute flow"
        Types.Concentration conc "Solute concentration";
        flow Types.MolarFlowRate q "Solute flow";
      end ChemicalPort;

      connector ChemicalPort_a
        "Concentration and expected positive Solute inflow"
        extends ChemicalPort;


      end ChemicalPort_a;

      connector ChemicalPort_b
        "Concentration and expected negative Solute outflow"
        extends ChemicalPort;


      end ChemicalPort_b;

      partial model OnePort
        "Partial transfer of solute between two ports without its accumulation"

        ChemicalPort_b            q_out;
        ChemicalPort_a            q_in;
      equation
        q_in.q + q_out.q = 0;
      end OnePort;

      partial model ConditionalHeatPort
        "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

        parameter Boolean useHeatPort = false "=true, if HeatPort is enabled";
        parameter Types.Temperature T=310.15
          "Fixed device temperature if useHeatPort = false";

        Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort;

        Types.Temperature T_heatPort "Temperature of HeatPort";
        Types.HeatFlowRate lossHeat "Loss heat leaving component via HeatPort";
      equation
        if not useHeatPort then
           T_heatPort = T;
        end if;

      end ConditionalHeatPort;

      partial model ConditionalVolume
        "Chemical processes can be modeled with or without(normalized to 1 liter) variable solution volume"

        constant Types.Volume NormalVolume=0.001 "1 liter";

        parameter Boolean useNormalizedVolume = true
          "Normalized volume of solution is 1 liter";

        Types.Volume volume "Solution volume"; //annotation(HideResult=useNormalizedVolume);

        Types.RealIO.VolumeInput solutionVolume=volume if not useNormalizedVolume
          "Volume of solution";
      equation
        if useNormalizedVolume then
          volume = NormalVolume;
        end if;

      end ConditionalVolume;

      partial model ConditionalSoluteFlow
        "Input of solute molar flow vs. parametric solute molar flow"

        parameter Boolean useSoluteFlowInput = false
          "=true, if solute flow input is used instead of parameter SoluteFlow";

        parameter Types.MolarFlowRate SoluteFlow=0
          "Volumetric flow of solute if useSoluteFlowInput=false";

        Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput;

        Types.MolarFlowRate q "Current solute flow";
      equation
        if not useSoluteFlowInput then
          q = SoluteFlow;
        end if;

      end ConditionalSoluteFlow;

      record SubstanceDefinition
        "Invariant properties of substance (molar weight, enthalpy, entropy, ...)"

       parameter String fullName=getInstanceName()
          "Full physiological name of substance";
       parameter String shortName=getInstanceName()
          "Short physiological name of substance";

       parameter Types.MolarMass mw "Molar weight in kg/mol or kDa";
       parameter Types.MolarEnergy dH=0 "Enthalpy";
       parameter Types.MolarEnergy dS=0 "Entropy";

       parameter Types.AmountOfSubstance molpIU=1
          "Pharmacological international unit conversion: mols per IU (or 1 if unknown)";
       parameter Types.AmountOfSubstance molpGU=1
          "Goldblatt unit conversion: mols per GU (or 1 if unknown)";

       parameter String storeUnit="mmol/l"
          "Default substance unit in files or databaseses";

       parameter Types.Utilities.UnitConversions.RealTypeRecord[:] unitConversions = cat(1,
          Types.Utilities.UnitConversions.GenerateSubstanceUnits("g",1e-3/mw),
          Types.Utilities.UnitConversions.GenerateSubstanceUnits("IU",molpIU),
          Types.Utilities.UnitConversions.GenerateSubstanceUnits("GU",molpGU));

      end SubstanceDefinition;
    end Interfaces;

  end Chemical;

  package Osmotic "Please use 'Chemical' library instead!"
   extends Modelica.Icons.Package;

    package Examples
      "Examples that demonstrate usage of the Osmotic flow components"
    extends Modelica.Icons.ExamplesPackage;

      model Cell
      extends Modelica.Icons.Example;

        Physiolibrary.Osmotic.Components.OsmoticCell cells(volume_start(
              displayUnit="l") = 0.001, ImpermeableSolutes={0.285});
        Physiolibrary.Osmotic.Components.OsmoticCell interstitium(volume_start(
              displayUnit="l") = 0.001, ImpermeableSolutes={0.28});
        Physiolibrary.Osmotic.Components.Membrane membrane(cond=
              1.2501026264094e-10);
        Physiolibrary.Osmotic.Components.OsmoticCell cells1(volume_start(
              displayUnit="l") = 0.001, ImpermeableSolutes={0.285});
        Physiolibrary.Osmotic.Components.OsmoticCell interstitium1(volume_start(
              displayUnit="l") = 0.001, ImpermeableSolutes={0.29});
        Physiolibrary.Osmotic.Components.Membrane membrane1(cond=
              1.2501026264094e-10);
      equation
        connect(cells.q_in[1], membrane.q_in);
        connect(membrane.q_out, interstitium.q_in[1]);
        connect(cells1.q_in[1], membrane1.q_in);
        connect(membrane1.q_out, interstitium1.q_in[1]);
      end Cell;

      model CerebrospinalFluid
      extends Modelica.Icons.Example;

        Physiolibrary.Osmotic.Components.OsmoticCell CSF_osmotic(volume_start(
              displayUnit="ml") = 0.00015, ImpermeableSolutes={(0.286*0.15)})
          "cerebro-spinal fluid";
        Physiolibrary.Osmotic.Components.Membrane choroid_plexus(
            useHydraulicPressureInputs=true, cond(displayUnit="ml/(mmHg.day)")=
            1.9966916949595e-12) "choroid plexus";
        Physiolibrary.Hydraulic.Components.ElasticVessel CSF_hydraulic(
          volume_start=0.00015,
          ZeroPressureVolume=0.000145,
          Compliance=2.250184727537e-09) "cerebro-spinal fluid";
        Physiolibrary.Hydraulic.Components.Pump choroid_plexus_hydraulic(
            useSolutionFlowInput=true);
        Physiolibrary.Osmotic.Sensors.FlowMeasure flowMeasure;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
        Physiolibrary.Osmotic.Sources.UnlimitedSolution ECF_osmotic(Osm=285)
          "extracellular (extracerebrospinal) fluid osmolarity";
        Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins(P=0);
        Physiolibrary.Osmotic.Components.Membrane arachnoid_villi(
            useHydraulicPressureInputs=true, cond(displayUnit="ml/(mmHg.day)")=
            1.1285648710641e-11) "choroid plexus";
        Physiolibrary.Hydraulic.Components.Pump arachnoid_villi_hydraulic(
            useSolutionFlowInput=true);
        Physiolibrary.Osmotic.Sensors.FlowMeasure flowMeasure1;
        Physiolibrary.Hydraulic.Sources.UnlimitedVolume arteries(P=12665.626804425);
        Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
              displayUnit="ml/(mmHg.min)") = 3.7503078792283e-11);
        Physiolibrary.Hydraulic.Components.ElasticVessel choroidPlexusCapilaries(
            volume_start=1.4e-05, Compliance=3.7503078792283e-09);
        Physiolibrary.Hydraulic.Components.Conductor conductor1(Conductance=8.750718384866e-11);
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure2;
      equation
        connect(CSF_hydraulic.q_in, pressureMeasure.q_in);
        connect(CSF_hydraulic.q_in, choroid_plexus_hydraulic.q_out);
        connect(flowMeasure.q_in, ECF_osmotic.port);
        connect(CSF_osmotic.q_in[1], arachnoid_villi.q_in);
        connect(CSF_hydraulic.q_in, arachnoid_villi_hydraulic.q_in);
        connect(arachnoid_villi_hydraulic.q_out, veins.y);
        connect(arachnoid_villi.q_out, flowMeasure1.q_in);
        connect(flowMeasure1.q_out, ECF_osmotic.port);
        connect(conductor.q_out, choroidPlexusCapilaries.q_in);
        connect(choroidPlexusCapilaries.q_in, conductor1.q_in);
        connect(veins.y, conductor1.q_out);
        connect(arteries.y, conductor.q_in);
        connect(choroid_plexus_hydraulic.q_in, choroidPlexusCapilaries.q_in);
        connect(pressureMeasure1.q_in, veins.y);
        connect(choroidPlexusCapilaries.q_in, pressureMeasure2.q_in);
        connect(CSF_osmotic.q_in[1], choroid_plexus.q_out);
        connect(choroid_plexus.q_in, flowMeasure.q_out);
        connect(pressureMeasure2.pressure, choroid_plexus.hydraulicPressureIn);
        connect(pressureMeasure1.pressure, arachnoid_villi.hydraulicPressureOut);
        connect(pressureMeasure.pressure, arachnoid_villi.hydraulicPressureIn);
        connect(pressureMeasure.pressure, choroid_plexus.hydraulicPressureOut);
        connect(flowMeasure1.volumeFlowRate, arachnoid_villi_hydraulic.solutionFlow);
        connect(flowMeasure.volumeFlowRate, choroid_plexus_hydraulic.solutionFlow);
      end CerebrospinalFluid;

    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model OsmoticCell "Solvent container"
        extends Icons.OsmoticCell;
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=volume_start, storeUnit=
            "mOsm/l");

        parameter Integer NumberOfMembraneTypes=1
          "Membrane type is determined by membrane permeabilities for substances.";

        Interfaces.OsmoticPort_a
                            q_in[NumberOfMembraneTypes]
          "Flux to/from osmotic compartment";
        parameter Types.Volume volume_start = 0.001
          "Initial volume of compartment";

        parameter Boolean useImpermeableSolutesInput = false
          "=true, if impermeable substance amount as an input";

        parameter Types.AmountOfSubstance ImpermeableSolutes[NumberOfMembraneTypes]=zeros(NumberOfMembraneTypes)
          "Amount of impermeable substance if useImpermeableSolutesInput=false";

        Types.RealIO.AmountOfSubstanceInput impermeableSolutes[NumberOfMembraneTypes](start=ImpermeableSolutes)= is if useImpermeableSolutesInput
          "Amount of impermeable solutes in compartment";
        Types.RealIO.VolumeOutput volume "Actual volume of compartment";
      protected
        Types.AmountOfSubstance is[NumberOfMembraneTypes]
          "Current amount of impermeable solutes";
      equation
        if not useImpermeableSolutesInput then
          is=ImpermeableSolutes;
        end if;

        q_in.o = is / volume;

        change = ones(NumberOfMembraneTypes) * q_in.q;    //der(volume)=q_in.q
        state = volume;

        //  assert(volume>=-Modelica.Constants.eps,"Collapsed cells by osmotic pressure are not supported!");

      end OsmoticCell;

      model Membrane "Solvent diffusion through semipermeable membrane"
       extends Interfaces.OnePort;
       extends Icons.Membrane; //Icons.Resistor;

       parameter Boolean useConductanceInput = false
          "=true, if membrane permeability input is used";

       parameter Types.OsmoticPermeability cond=1e-15
          "Membrane permeability for solvent if useConductanceInput = false";

        parameter Boolean useHydraulicPressureInputs = false
          "=true, if hydraulic pressure inputs is used";

        parameter Types.Pressure HydraulicPressureIn=0
          "Hydraulic pressure inside if useHydraulicPressureInputs=false";
        parameter Types.Pressure HydraulicPressureOut=0
          "Hydraulic pressure outside if useHydraulicPressureInputs=false";

        Types.RealIO.PressureInput hydraulicPressureIn(start=HydraulicPressureIn)=pi if useHydraulicPressureInputs;
        Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs;

        parameter Boolean useTemperatureInputs = false
          "=true, if temperature on both sides is used";

        parameter Types.Temperature T=310.15
          "Temperature on both membrane sides if  useTemperatureInputs=false";

        Types.RealIO.TemperatureInput temperatureIn(start=T)=ti if useTemperatureInputs;
        Types.RealIO.TemperatureInput temperatureOut(start=T)=to if useTemperatureInputs;

        Types.OsmoticPermeability perm;

        Types.Pressure opi "osmotic pressure at q_in", opo
          "osmotic pressure at q_out";
      protected
        Types.Pressure pi,po;
        Types.Temperature ti,to;

      public
        Types.RealIO.OsmoticPermeabilityInput conduction=perm if useConductanceInput;
      equation
        if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          ti=T;
          to=T;
        end if;
        if not useConductanceInput then
          cond=perm;
        end if;

        q_in.q = perm * ( (-po + q_out.o*(Modelica.Constants.R*to)) - (-pi + q_in.o*(Modelica.Constants.R*ti)));

        opi = q_in.o*(Modelica.Constants.R*ti);
        opo = q_out.o*(Modelica.Constants.R*to);
      end Membrane;

      model SolventFlux "Prescripted solvent flow"
        extends Interfaces.OnePort;
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

      equation
        q_in.q = q;

      end SolventFlux;

      model IdealOverflowFiltration
        "Semipermeable membrane filtration (e.g. flux through capillary membrane) of overflowing solution (e.g. blood microcirculation)"
        extends Icons.FlowFiltration;
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;
                                                            // "E.g. volumetric inflow to capilary net";

        Interfaces.OsmoticPort_a port_a
          "Inflowing ospomarity and positive filtrate flow rate (e.g. blood osmolarity and flux through capillary membrane from blood to interstitium)";
        Interfaces.OsmoticPort_b filtrate
          "Outer osmolarity and negative filtrate flow rate (e.g. interstitium osmolarity and flux through capillary membrane from interstitium to blood)";

         parameter Boolean useHydraulicPressureInputs = false
          "=true, if hydraulic pressure inputs is used";

        parameter Types.Pressure HydraulicPressureIn=0
          "Hydraulic pressure inside of leaving overflow (e.g. blood pressure after capillary net) if useHydraulicPressureInputs=false";
        parameter Types.Pressure HydraulicPressureOut=0
          "Hydraulic pressure outside (e.g. interstitium hydraulic pressure) if useHydraulicPressureInputs=false";

        Types.RealIO.PressureInput hydraulicPressureIn(start=HydraulicPressureIn)=pi if useHydraulicPressureInputs;
        Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs;

        parameter Boolean useTemperatureInputs = false
          "=true, if temperature on both sides is used";

        parameter Types.Temperature T=310.15
          "Temperature on both membrane sides if  useTemperatureInputs=false";

        Types.RealIO.TemperatureInput temperature(start=T)=t if useTemperatureInputs;

      protected
        Types.Pressure pi,po;
        Types.Temperature t;

        Types.Osmolarity osmolarityO;

      equation
       if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          t=T;
        end if;

        port_a.q+filtrate.q=0; //flux through membrane

        pi - osmolarityO*Modelica.Constants.R*T = po - filtrate.o*Modelica.Constants.R*T; // venous and interstitium pressure is equilibrated

        port_a.o*q = osmolarityO*(q-port_a.q); //definition of venous osmolarity

      //  port_a.o*q = (q-port_a.q)*filtrate.o; //equilibration without hydraulic part

      end IdealOverflowFiltration;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolibrary;
        extends Icons.Reabsorption;

        Interfaces.OsmoticPort_a
                             Inflow;
        Interfaces.OsmoticPort_b
                             Outflow;
        Interfaces.OsmoticPort_b
                             Reabsorption;

        Types.RealIO.FractionInput FractReab;

        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted";

        parameter Types.VolumeFlowRate OutflowMin = 0
          "Minimal outflow if useExternalOutflowMin=false";

        Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin;

      protected
         Types.VolumeFlowRate om;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;

        Inflow.o = Outflow.o;
        0 = Inflow.q + Outflow.q + Reabsorption.q;

       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");

        Reabsorption.q = -max(0,FractReab*(Inflow.q-om));
      end Reabsorption;
    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Measurement of flux through semipermeable membrane"
        extends Interfaces.OnePort;
        extends Modelica.Icons.RotationalSensor;
        //extends Icons.FlowMeasure;

        Types.RealIO.VolumeFlowRateOutput volumeFlowRate
          "Flux through membrane";
      equation
        q_out.o = q_in.o;

        volumeFlowRate = q_in.q;

      end FlowMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model SolventInflux "Prescribed solvent inflow"
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

        Interfaces.OsmoticPort_b
                            q_out;

      equation
        q_out.q = - q;

      end SolventInflux;

      model SolventOutflux "Prescribed solvent outflow"
       extends Hydraulic.Interfaces.ConditionalSolutionFlow;
        Interfaces.OsmoticPort_a
                            q_in;
      equation
        q_in.q = q;

      end SolventOutflux;

      model UnlimitedSolution "Prescribed osmolarity"

        parameter Boolean useOsmolarityInput = false
          "=true, if fixed osmolarity at port is from input instead of parameter";

         parameter Types.Osmolarity Osm = 0
          "Fixed osmolarity at port if useOsmolarityInput=false";

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state";

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added.";

        Interfaces.OsmoticPort_b    port;

      protected
        Types.Osmolarity o "Current osmolarity";
      public
        Types.RealIO.TemperatureInput osmolarity(start=Osmolarity)=o if
                                                                 useOsmolarityInput;

      initial equation
        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.InitSteadyState) then
          port.q = 0;
        end if;

      equation
        if not useOsmolarityInput then
          o=Osm;
        end if;

        port.o = o;

        if isIsolatedInSteadyState and (Simulation==Types.SimulationType.SteadyState) then
            port.q = 0;
        end if;

      end UnlimitedSolution;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

       connector OsmoticPort
        "Flux through semipermeable membrane by osmotic pressure gradient"
        Types.Concentration o
          "Osmolarity is the molar concentration of the impermeable solutes";
        flow Types.VolumeFlowRate q
          "The flux of the permeable solvent (!not the impermeable solutes!)";
       end OsmoticPort;

      connector OsmoticPort_a "Influx"
        extends OsmoticPort;


      end OsmoticPort_a;

      connector OsmoticPort_b "Outflux"
        extends OsmoticPort;


      end OsmoticPort_b;

      partial model OnePort "Osmotic one port"

       OsmoticPort_a       q_in "Forward flux through membrane";
        OsmoticPort_b       q_out "Backward flux through membrane";
      equation
        q_in.q + q_out.q = 0;
      end OnePort;

    end Interfaces;
  end Osmotic;
end Physiolibrary;

package Modelica "Modelica Standard Library - Version 3.2.1 (Build 2)"
extends Modelica.Icons.Package;

  package Blocks
  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Package;

    package Continuous
    "Library of continuous control blocks with internal states"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.Package;

      block TransferFunction "Linear transfer function"
        import Modelica.Blocks.Types.Init;
        extends Interfaces.SISO;

        parameter Real b[:]={1}
        "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
        parameter Real a[:]={1}
        "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
        parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)";
        parameter Real x_start[size(a, 1) - 1]=zeros(nx)
        "Initial or guess values of states";
        parameter Real y_start=0
        "Initial value of output (derivatives of y are zero upto nx-1-th derivative)";
        output Real x[size(a, 1) - 1](start=x_start)
        "State of transfer function from controller canonical form";
    protected
        parameter Integer na=size(a, 1)
        "Size of Denominator of transfer function.";
        parameter Integer nb=size(b, 1)
        "Size of Numerator of transfer function.";
        parameter Integer nx=size(a, 1) - 1;
        parameter Real bb[:] = vector([zeros(max(0,na-nb),1);b]);
        parameter Real d = bb[1]/a[1];
        parameter Real a_end = if a[end] > 100*Modelica.Constants.eps*sqrt(a*a) then a[end] else 1.0;
        Real x_scaled[size(x,1)] "Scaled vector x";

      initial equation
        if initType == Init.SteadyState then
          der(x_scaled) = zeros(nx);
        elseif initType == Init.InitialState then
          x_scaled = x_start*a_end;
        elseif initType == Init.InitialOutput then
          y = y_start;
          der(x_scaled[2:nx]) = zeros(nx-1);
        end if;
      equation
        assert(size(b,1) <= size(a,1), "Transfer function is not proper");
        if nx == 0 then
           y = d*u;
        else
           der(x_scaled[1])    = (-a[2:na]*x_scaled + a_end*u)/a[1];
           der(x_scaled[2:nx]) = x_scaled[1:nx-1];
           y = ((bb[2:na] - d*a[2:na])*x_scaled)/a_end + d*u;
           x = x_scaled/a_end;
        end if;
      end TransferFunction;

      block Der "Derivative of input (= analytic differentiations)"
          extends Interfaces.SISO;

      equation
        y = der(u);
      end Der;
    end Continuous;

    package Interfaces
    "Library of connectors and partial models for input/output blocks"
      import Modelica.SIunits;
      extends Modelica.Icons.InterfacesPackage;

      connector RealInput = input Real "'input Real' as connector";

      connector RealOutput = output Real "'output Real' as connector";

      connector BooleanInput = input Boolean "'input Boolean' as connector";

      connector BooleanOutput = output Boolean "'output Boolean' as connector";

      partial block SO "Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealOutput y "Connector of Real output signal";

      end SO;

      partial block SISO "Single Input Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealInput u "Connector of Real input signal";
        RealOutput y "Connector of Real output signal";
      end SISO;

      partial block SI2SO
      "2 Single Input / 1 Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealInput u1 "Connector of Real input signal 1";
        RealInput u2 "Connector of Real input signal 2";
        RealOutput y "Connector of Real output signal";


      end SI2SO;

      partial block SIMO
      "Single Input Multiple Output continuous control block"
        extends Modelica.Blocks.Icons.Block;
        parameter Integer nout=1 "Number of outputs";
        RealInput u "Connector of Real input signal";
        RealOutput y[nout] "Connector of Real output signals";

      end SIMO;

      partial block MISO
      "Multiple Input Single Output continuous control block"

        extends Modelica.Blocks.Icons.Block;
        parameter Integer nin=1 "Number of inputs";
        RealInput u[nin] "Connector of Real input signals";
        RealOutput y "Connector of Real output signal";
      end MISO;

      partial block partialBooleanSource
      "Partial source block (has 1 output Boolean signal and an appropriate default icon)"
        extends Modelica.Blocks.Icons.PartialBooleanBlock;

        Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal";


      end partialBooleanSource;

      partial block partialBooleanThresholdComparison
      "Partial block to compare the Real input u with a threshold and provide the result as 1 Boolean output signal"

        parameter Real threshold=0 "Comparison with respect to threshold";

        Blocks.Interfaces.RealInput u "Connector of Boolean input signal";
        Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal";


      end partialBooleanThresholdComparison;
    end Interfaces;

    package Logical
    "Library of components with Boolean input and output signals"
      extends Modelica.Icons.Package;

      block GreaterThreshold
      "Output y is true, if input u is greater than threshold"
        extends Blocks.Interfaces.partialBooleanThresholdComparison;
      equation
        y = u > threshold;
      end GreaterThreshold;

      block Switch "Switch between two Real signals"
        extends Modelica.Blocks.Icons.PartialBooleanBlock;
        Blocks.Interfaces.RealInput u1 "Connector of first Real input signal";
        Blocks.Interfaces.BooleanInput u2 "Connector of Boolean input signal";
        Blocks.Interfaces.RealInput u3 "Connector of second Real input signal";
        Blocks.Interfaces.RealOutput y "Connector of Real output signal";

      equation
        y = if u2 then u1 else u3;
      end Switch;
    end Logical;

    package Math
    "Library of Real mathematical functions as input/output blocks"
      import Modelica.SIunits;
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Package;

          block Gain "Output the product of a gain value with the input signal"

            parameter Real k(start=1, unit="1")
        "Gain value multiplied with input signal";
    public
            Interfaces.RealInput u "Input signal connector";
            Interfaces.RealOutput y "Output signal connector";

          equation
            y = k*u;
          end Gain;

          block Sum "Output the sum of the elements of the input vector"
            extends Interfaces.MISO;
            parameter Real k[nin]=ones(nin) "Optional: sum coefficients";
          equation
            y = k*u;
          end Sum;

          block Feedback
      "Output difference between commanded and feedback input"

            Interfaces.RealInput u1;
            Interfaces.RealInput u2;
            Interfaces.RealOutput y;

          equation
            y = u1 - u2;
          end Feedback;

          block Add "Output the sum of the two inputs"
            extends Interfaces.SI2SO;

            parameter Real k1=+1 "Gain of upper input";
            parameter Real k2=+1 "Gain of lower input";

          equation
            y = k1*u1 + k2*u2;
          end Add;

          block Add3 "Output the sum of the three inputs"
            extends Modelica.Blocks.Icons.Block;

            parameter Real k1=+1 "Gain of upper input";
            parameter Real k2=+1 "Gain of middle input";
            parameter Real k3=+1 "Gain of lower input";
            Interfaces.RealInput u1 "Connector 1 of Real input signals";
            Interfaces.RealInput u2 "Connector 2 of Real input signals";
            Interfaces.RealInput u3 "Connector 3 of Real input signals";
            Interfaces.RealOutput y "Connector of Real output signals";

          equation
            y = k1*u1 + k2*u2 + k3*u3;
          end Add3;

          block Product "Output product of the two inputs"
            extends Interfaces.SI2SO;

          equation
            y = u1*u2;
          end Product;

          block Division "Output first input divided by second input"
            extends Interfaces.SI2SO;

          equation
            y = u1/u2;
          end Division;

          block Log10
      "Output the base 10 logarithm of the input (input > 0 required)"

            extends Interfaces.SISO;
          equation
            y = Modelica.Math.log10(u);
          end Log10;
    end Math;

    package Nonlinear
    "Library of discontinuous or non-differentiable algebraic control blocks"
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Package;

          block DeadZone "Provide a region of zero output"
            parameter Real uMax(start=1) "Upper limits of dead zones";
            parameter Real uMin=-uMax "Lower limits of dead zones";
            parameter Boolean deadZoneAtInit = true
        "= false, if dead zone is ignored during initialization (i.e., y=u)";
            extends Interfaces.SISO;

          equation
            assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) +
                                 ") < uMin (=" + String(uMin) + ")");

            if initial() and not deadZoneAtInit then
               y = u;
            else
               y = smooth(0,if u > uMax then u - uMax else if u < uMin then u - uMin else 0);
            end if;
          end DeadZone;
    end Nonlinear;

    package Sources
    "Library of signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.SourcesPackage;

      block Clock "Generate actual time signal"
        parameter Modelica.SIunits.Time offset=0 "Offset of output signal";
        parameter Modelica.SIunits.Time startTime=0
        "Output = offset for time < startTime";
        extends Interfaces.SO;

      equation
        y = offset + (if time < startTime then 0 else time - startTime);
      end Clock;

      block Constant "Generate constant signal of type Real"
        parameter Real k(start=1) "Constant output value";
        extends Interfaces.SO;

      equation
        y = k;
      end Constant;

      block Sine "Generate sine signal"
        parameter Real amplitude=1 "Amplitude of sine wave";
        parameter SIunits.Frequency freqHz(start=1) "Frequency of sine wave";
        parameter SIunits.Angle phase=0 "Phase of sine wave";
        parameter Real offset=0 "Offset of output signal";
        parameter SIunits.Time startTime=0
        "Output = offset for time < startTime";
        extends Interfaces.SO;
    protected
        constant Real pi=Modelica.Constants.pi;

      equation
        y = offset + (if time < startTime then 0 else amplitude*Modelica.Math.sin(2
          *pi*freqHz*(time - startTime) + phase));
      end Sine;

      block Pulse "Generate pulse signal of type Real"
        parameter Real amplitude=1 "Amplitude of pulse";
        parameter Real width(
          final min=Modelica.Constants.small,
          final max=100) = 50 "Width of pulse in % of period";
        parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
            start=1) "Time for one period";
        parameter Integer nperiod=-1
        "Number of periods (< 0 means infinite number of periods)";
        parameter Real offset=0 "Offset of output signals";
        parameter Modelica.SIunits.Time startTime=0
        "Output = offset for time < startTime";
        extends Modelica.Blocks.Interfaces.SO;
    protected
        Modelica.SIunits.Time T_width=period*width/100;
        Modelica.SIunits.Time T_start "Start time of current period";
        Integer count "Period count";
      initial algorithm
        count := integer((time - startTime)/period);
        T_start := startTime + count*period;
      equation
        when integer((time - startTime)/period) > pre(count) then
          count = pre(count) + 1;
          T_start = time;
        end when;
        y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
          count >= nperiod)) then 0 else if time < T_start + T_width then amplitude
           else 0);
      end Pulse;

      block BooleanConstant "Generate constant signal of type Boolean"
        parameter Boolean k=true "Constant output value";
        extends Interfaces.partialBooleanSource;

      equation
        y = k;
      end BooleanConstant;
    end Sources;

    package Types
    "Library of constants and types with choices, especially to build menus"
      extends Modelica.Icons.TypesPackage;

      type Init = enumeration(
        NoInit
          "No initialization (start values are used as guess values with fixed=false)",

        SteadyState
          "Steady state initialization (derivatives of states are zero)",
        InitialState "Initialization with initial states",
        InitialOutput
          "Initialization with initial outputs (and steady state of the states if possible)")
      "Enumeration defining initialization of a block";
    end Types;

    package Icons "Icons for Blocks"
        extends Modelica.Icons.IconsPackage;

        partial block Block "Basic graphical layout of input/output block"


        end Block;

      partial block PartialBooleanBlock
      "Basic graphical layout of logical block"

      end PartialBooleanBlock;
    end Icons;
  end Blocks;

  package Mechanics
  "Library of 1-dim. and 3-dim. mechanical components (multi-body, rotational, translational)"
  extends Modelica.Icons.Package;

    package MultiBody "Library to model 3-dimensional mechanical systems"
      extends Modelica.Icons.Package;
    import SI = Modelica.SIunits;
    import Cv = Modelica.SIunits.Conversions;
    import C = Modelica.Constants;

      package Frames "Functions to transform rotational frame quantities"
        extends Modelica.Icons.Package;

        record Orientation
        "Orientation object defining rotation from a frame 1 into a frame 2"

          extends Modelica.Icons.Record;
          Real T[3, 3] "Transformation matrix from world frame to local frame";
          SI.AngularVelocity w[3]
          "Absolute angular velocity of local frame, resolved in local frame";

          encapsulated function equalityConstraint
          "Return the constraint residues to express that two frames have the same orientation"

            import Modelica;
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Frames.Orientation R1
            "Orientation object to rotate frame 0 into frame 1";
            input Frames.Orientation R2
            "Orientation object to rotate frame 0 into frame 2";
            output Real residue[3]
            "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
          algorithm
            residue := {
               Modelica.Math.atan2(cross(R1.T[1, :], R1.T[2, :])*R2.T[2, :],R1.T[1,:]*R2.T[1,:]),
               Modelica.Math.atan2(-cross(R1.T[1, :],R1.T[2, :])*R2.T[1, :],R1.T[2,:]*R2.T[2,:]),
               Modelica.Math.atan2(R1.T[2, :]*R2.T[1, :],R1.T[3,:]*R2.T[3,:])};
          end equalityConstraint;

        end Orientation;

        function nullRotation
        "Return orientation object that does not rotate a frame"
          extends Modelica.Icons.Function;
          output Orientation R
          "Orientation object such that frame 1 and frame 2 are identical";
        algorithm
          R := Orientation(T=identity(3),w= zeros(3));
        end nullRotation;
      end Frames;

      package Interfaces
      "Connectors and partial models for 3-dim. mechanical components"
        extends Modelica.Icons.InterfacesPackage;

        partial function partialSurfaceCharacteristic
          extends Modelica.Icons.Function;
           input Integer nu "Number of points in u-Dimension";
           input Integer nv "Number of points in v-Dimension";
           input Boolean multiColoredSurface=false
          "= true: Color is defined for each surface point";
           output Modelica.SIunits.Position X[nu,nv]
          "[nu,nv] positions of points in x-Direction resolved in surface frame";
           output Modelica.SIunits.Position Y[nu,nv]
          "[nu,nv] positions of points in y-Direction resolved in surface frame";
           output Modelica.SIunits.Position Z[nu,nv]
          "[nu,nv] positions of points in z-Direction resolved in surface frame";
           output Real C[if multiColoredSurface then nu else 0,
                         if multiColoredSurface then nv else 0,3]
          "[nu,nv,3] Color array, defining the color for each surface point";
        end partialSurfaceCharacteristic;
      end Interfaces;

      package Types
      "Constants and types with choices, especially to build menus"
        extends Modelica.Icons.TypesPackage;

        type SpecularCoefficient = Modelica.Icons.TypeReal(min=0)
        "Reflection of ambient light (= 0: light is completely absorbed)";

        type ShapeType = Modelica.Icons.TypeString
        "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, <external shape>)";

        type ShapeExtra = Modelica.Icons.TypeReal
        "Type of the additional data that can be defined for an elementary ShapeType";
      end Types;
    end MultiBody;
  end Mechanics;

  package Thermal
  "Library of thermal system components to model heat transfer and simple thermo-fluid pipe flow"
    extends Modelica.Icons.Package;

    package HeatTransfer
    "Library of 1-dimensional heat transfer with lumped elements"
      extends Modelica.Icons.Package;

      package Components "Lumped thermal components"
      extends Modelica.Icons.Package;

        model ThermalConductor
        "Lumped thermal element transporting heat without storing it"
          extends Interfaces.Element1D;
          parameter Modelica.SIunits.ThermalConductance G
          "Constant thermal conductance of material";

        equation
          Q_flow = G*dT;
        end ThermalConductor;
      end Components;

      package Sensors "Thermal sensors"
        extends Modelica.Icons.SensorsPackage;

        model HeatFlowSensor "Heat flow rate sensor"
          extends Modelica.Icons.RotationalSensor;
          Modelica.Blocks.Interfaces.RealOutput Q_flow(unit="W")
          "Heat flow from port_a to port_b as output signal";
          Interfaces.HeatPort_a port_a;
          Interfaces.HeatPort_b port_b;
        equation
          port_a.T = port_b.T;
          port_a.Q_flow + port_b.Q_flow = 0;
          Q_flow = port_a.Q_flow;
        end HeatFlowSensor;
      end Sensors;

      package Sources "Thermal sources"
      extends Modelica.Icons.SourcesPackage;

        model PrescribedTemperature
        "Variable temperature boundary condition in Kelvin"

          Interfaces.HeatPort_b port;
          Modelica.Blocks.Interfaces.RealInput T(unit="K");
        equation
          port.T = T;
        end PrescribedTemperature;

        model FixedHeatFlow "Fixed heat flow boundary condition"
          parameter Modelica.SIunits.HeatFlowRate Q_flow
          "Fixed heat flow rate at port";
          parameter Modelica.SIunits.Temperature T_ref=293.15
          "Reference temperature";
          parameter Modelica.SIunits.LinearTemperatureCoefficient alpha=0
          "Temperature coefficient of heat flow rate";
          Interfaces.HeatPort_b port;
        equation
          port.Q_flow = -Q_flow*(1 + alpha*(port.T - T_ref));
        end FixedHeatFlow;
      end Sources;

      package Interfaces "Connectors and partial models"
        extends Modelica.Icons.InterfacesPackage;

        partial connector HeatPort "Thermal port for 1-dim. heat transfer"
          Modelica.SIunits.Temperature T "Port temperature";
          flow Modelica.SIunits.HeatFlowRate Q_flow
          "Heat flow rate (positive if flowing from outside into the component)";
        end HeatPort;

        connector HeatPort_a
        "Thermal port for 1-dim. heat transfer (filled rectangular icon)"

          extends HeatPort;

        end HeatPort_a;

        connector HeatPort_b
        "Thermal port for 1-dim. heat transfer (unfilled rectangular icon)"

          extends HeatPort;

        end HeatPort_b;

        partial model Element1D
        "Partial heat transfer element with two HeatPort connectors that does not store energy"

          Modelica.SIunits.HeatFlowRate Q_flow
          "Heat flow rate from port_a -> port_b";
          Modelica.SIunits.TemperatureDifference dT "port_a.T - port_b.T";
      public
          HeatPort_a port_a;
          HeatPort_b port_b;
        equation
          dT = port_a.T - port_b.T;
          port_a.Q_flow = Q_flow;
          port_b.Q_flow = -Q_flow;
        end Element1D;
      end Interfaces;
    end HeatTransfer;
  end Thermal;

  package Math
  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Package;

  package Icons "Icons for Math"
    extends Modelica.Icons.IconsPackage;

    partial function AxisLeft
    "Basic icon for mathematical function with y-axis on left side"

    end AxisLeft;

    partial function AxisCenter
    "Basic icon for mathematical function with y-axis in the center"

    end AxisCenter;
  end Icons;

  function sin "Sine"
    extends Modelica.Math.Icons.AxisLeft;
    input Modelica.SIunits.Angle u;
    output Real y;

  external "builtin" y=  sin(u);
  end sin;

  function asin "Inverse sine (-1 <= u <= 1)"
    extends Modelica.Math.Icons.AxisCenter;
    input Real u;
    output SI.Angle y;

  external "builtin" y=  asin(u);
  end asin;

  function atan2 "Four quadrant inverse tangent"
    extends Modelica.Math.Icons.AxisCenter;
    input Real u1;
    input Real u2;
    output SI.Angle y;

  external "builtin" y=  atan2(u1, u2);
  end atan2;

  function exp "Exponential, base e"
    extends Modelica.Math.Icons.AxisCenter;
    input Real u;
    output Real y;

  external "builtin" y=  exp(u);
  end exp;

  function log "Natural (base e) logarithm (u shall be > 0)"
    extends Modelica.Math.Icons.AxisLeft;
    input Real u;
    output Real y;

  external "builtin" y=  log(u);
  end log;

  function log10 "Base 10 logarithm (u shall be > 0)"
    extends Modelica.Math.Icons.AxisLeft;
    input Real u;
    output Real y;

  external "builtin" y=  log10(u);
  end log10;
  end Math;

  package Utilities
  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
    extends Modelica.Icons.Package;

    package Files "Functions to work with files and directories"
      extends Modelica.Icons.Package;

    function createDirectory
      "Create directory (if directory already exists, ignore call)"
      extends Modelica.Icons.Function;
      input String directoryName
        "Name of directory to be created (if present, ignore call)";
    //..............................................................
    protected
      function existDirectory
        "Inquire whether directory exists; if present and not a directory, trigger an error"
         extends Modelica.Icons.Function;
         input String directoryName;
         output Boolean exists "true if directory exists";
      protected
         Types.FileType fileType = Modelica.Utilities.Internal.FileSystem.stat(
                                                 directoryName);
      algorithm
         if fileType == Types.FileType.RegularFile or
            fileType == Types.FileType.SpecialFile then
            Streams.error("Directory \"" + directoryName + "\" cannot be created\n" +
                          "because this is an existing file.");
         elseif fileType == Types.FileType.Directory then
            exists :=true;
         else
            exists :=false;
         end if;
      end existDirectory;

      function assertCorrectIndex
        "Print error, if index to last essential character in directory is wrong"
         extends Modelica.Icons.Function;
         input Integer index "Index must be > 0";
         input String directoryName "Directory name for error message";
      algorithm
         if index < 1 then
            Streams.error("It is not possible to create the directory\n" +
                          "\"" + directoryName + "\"\n" +
                          "because this directory name is not valid");
         end if;
      end assertCorrectIndex;

    //..............................................................
      String fullName;
      Integer index;
      Integer oldIndex;
      Integer lastIndex;
      Boolean found;
      Boolean finished;
      Integer nDirectories = 0
        "Number of directories that need to be generated";
    algorithm
      // Ignore call, if directory exists
      if not existDirectory(directoryName) then
         fullName := Files.fullPathName(directoryName);

         // Remove a trailing "/"
            index :=Strings.length(fullName);
            if Strings.substring(fullName,index,index) == "/" then
               index :=index - 1;
               assertCorrectIndex(index,fullName);
            end if;
            lastIndex := index;
            fullName := Strings.substring(fullName,1,index);

         // Search upper directories until a directory is found that exists
         // ??? check the following while loop later, if also cases such as
         //  "c:/", "c:", "//name" are handled correctly ???
            found := false;
            while not found loop
               oldIndex := index;
               index := Strings.findLast(fullName,"/",startIndex=index);
               if index == 0 then
                  index := oldIndex;
                  found := true;
               else
                  index := index - 1;
                  assertCorrectIndex(index, fullName);
                  found := existDirectory(Strings.substring(fullName,1,index));
               end if;
            end while;
            index := oldIndex;

         // Create directories
            finished := false;
            while not finished loop
               Modelica.Utilities.Internal.FileSystem.mkdir(
                              Strings.substring(fullName,1,index));
               if index >= lastIndex then
                  finished := true;
               elseif index < lastIndex then
                  index := Strings.find(fullName, "/", startIndex=index+2);
                  if index == 0 then
                     index :=lastIndex;
                  end if;
               end if;
            end while;
      end if;

    end createDirectory;

    function exist "Inquire whether file or directory exists"
      extends Modelica.Icons.Function;
      input String name "Name of file or directory";
      output Boolean result "= true, if file or directory exists";
    algorithm
      result := Modelica.Utilities.Internal.FileSystem.stat(
                              name) > Types.FileType.NoFile;

    end exist;

    function fullPathName "Get full path name of file or directory name"
      extends Modelica.Icons.Function;
      input String name "Absolute or relative file or directory name";
      output String fullName "Full path of 'name'";
    external "C" fullName = ModelicaInternal_fullPathName(name);

    end fullPathName;

      function loadResource
      "Return the absolute path name of a URI or local file name"
         extends
        Modelica.Utilities.Internal.PartialModelicaServices.ExternalReferences.PartialLoadResource;
         extends ModelicaServices.ExternalReferences.loadResource;
      end loadResource;
    end Files;

    package Streams "Read from files and write to files"
      extends Modelica.Icons.Package;

      function print "Print string to terminal or file"
        extends Modelica.Icons.Function;
        input String string="" "String to be printed";
        input String fileName=""
        "File where to print (empty string is the terminal)";
      external "C" ModelicaInternal_print(string, fileName);
      end print;

      function readLine
      "Reads a line of text from a file and returns it in a string"
        extends Modelica.Icons.Function;
        input String fileName "Name of the file that shall be read";
        input Integer lineNumber(min=1) "Number of line to read";
        output String string "Line of text";
        output Boolean endOfFile
        "If true, end-of-file was reached when trying to read line";
       external "C" string = ModelicaInternal_readLine(fileName,lineNumber,endOfFile);
      end readLine;

      function error "Print error message and cancel all actions"
        extends Modelica.Icons.Function;
        input String string "String to be printed to error message window";
        external "C" ModelicaError(string);
      end error;
    end Streams;

    package Strings "Operations on strings"
      extends Modelica.Icons.Package;

      function length "Returns length of string"
        extends Modelica.Icons.Function;
        input String string;
        output Integer result "Number of characters of string";
      external "C" result = ModelicaStrings_length(string);
      end length;

      function substring "Returns a substring defined by start and end index"

        extends Modelica.Icons.Function;
        input String string "String from which a substring is inquired";
        input Integer startIndex(min=1)
        "Character position of substring begin (index=1 is first character in string)";
        input Integer endIndex(min=1) "Character position of substring end";
        output String result
        "String containing substring string[startIndex:endIndex]";
      external "C" result =
                          ModelicaStrings_substring(string,startIndex,endIndex);
      end substring;

      function repeat "Repeat a string n times"
        extends Modelica.Icons.Function;
        input Integer n(min=0) = 1 "Number of occurrences";
        input String string=" " "String that is repeated";
        output String repeatedString "String containing n concatenated strings";
      algorithm
        repeatedString :="";
        for i in 1:n loop
           repeatedString := repeatedString + string;
        end for;
      end repeat;

      function compare "Compare two strings lexicographically"
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive=true
        "= false, if case of letters is ignored";
        output Modelica.Utilities.Types.Compare result "Result of comparison";
      external "C" result = ModelicaStrings_compare(string1, string2, caseSensitive);
      end compare;

      function isEqual "Determine whether two strings are identical"
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the comparison";
        output Boolean identical "True, if string1 is identical to string2";
      algorithm
        identical :=compare(string1, string2, caseSensitive) == Types.Compare.Equal;
      end isEqual;

      function find "Find first occurrence of a string within another string"
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min=1)=1 "Start search at index startIndex";
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
         output Integer index
        "Index of the beginning of the first occurrence of 'searchString' within 'string', or zero if not present";
    protected
        Integer lengthSearchString = length(searchString);
        Integer len = lengthSearchString-1;
        Integer i = startIndex;
        Integer i_max = length(string) - lengthSearchString + 1;
      algorithm
        index := 0;
        while i <= i_max loop
           if isEqual(substring(string,i,i+len),
                      searchString, caseSensitive) then
              index := i;
              i := i_max + 1;
           else
              i := i+1;
           end if;
        end while;
      end find;

      function findLast
      "Find last occurrence of a string within another string"
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min=0)=0
        "Start search at index startIndex. If startIndex = 0, start at length(string)";
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
        output Integer index
        "Index of the beginning of the last occurrence of 'searchString' within 'string', or zero if not present";
    protected
        Integer lenString = length(string);
        Integer lenSearchString = length(searchString);
        Integer iMax=lenString - lenSearchString + 1;
        Integer i;
      algorithm
        i := if startIndex == 0 or startIndex > iMax then iMax else startIndex;
        index := 0;
        while i >= 1 loop
           if isEqual(substring(string,i,i+lenSearchString-1),
                      searchString, caseSensitive) then
              index := i;
              i := 0;
           else
              i := i-1;
           end if;
        end while;
      end findLast;

      function scanReal
      "Scan for the next Real number and trigger an assert if not present"
        extends Modelica.Icons.Function;
        input String string "String to be scanned";
        input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
        input Boolean unsigned=false
        "= true, if Real token shall not start with a sign";
        input String message=""
        "Message used in error message if scan is not successful";
        output Real number "Value of real number";
        output Integer nextIndex "index of character after the found number";
      algorithm
        (nextIndex, number) :=Advanced.scanReal(string, startIndex, unsigned);
        if nextIndex == startIndex then
           nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
           if unsigned then
              syntaxError(string, nextIndex, "Expected a Real number without a sign " + message);
           else
              syntaxError(string, nextIndex, "Expected a Real number " + message);
           end if;
        end if;
      end scanReal;

      function syntaxError
      "Print an error message, a string and the index at which scanning detected an error"
        extends Modelica.Icons.Function;
        input String string "String that has an error at position index";
        input Integer index
        "Index of string at which scanning detected an error";
        input String message="" "String printed at end of error message";

    protected
        Integer maxIndex = 40;
        Integer maxLenString = 60;
        Integer lenString = length(string);
        String errString;
        Integer index2 = if index < 1 then 1 else if index > lenString then lenString else index;
      algorithm
      // if "string" is too long, skip part of the string when printing it
         if index2 <= maxIndex then
           errString := string;
         else
           errString := "... " + substring(string, index2-maxIndex, lenString);
           index2 := maxIndex + 5; // To mark right position
         end if;

         if length(errString) > maxLenString then
            errString := substring(errString, 1, maxLenString) + " ...";
         end if;

      // Print error message
         Streams.error("Syntax error at character " + String(index) + " of\n" +
                       errString + "\n" +
                       repeat(index2-1, " ") + "*" + "\n" +
                       message);
      end syntaxError;

      package Advanced "Advanced scanning functions"
      extends Modelica.Icons.Package;

        function scanReal "Scans a signed real number"
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min=1)=1 "Index where scanning starts";
          input Boolean unsigned=false
          "= true, if number shall not start with '+' or '-'";
          output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
          output Real number "Value of Real number";
          external "C" ModelicaStrings_scanReal(string, startIndex, unsigned, nextIndex, number);
        end scanReal;

        function skipWhiteSpace "Scans white space"
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min=1)=1;
          output Integer nextIndex;
          external "C" nextIndex = ModelicaStrings_skipWhiteSpace(string, startIndex);
        end skipWhiteSpace;
      end Advanced;
    end Strings;

    package Types "Type definitions used in package Modelica.Utilities"
      extends Modelica.Icons.TypesPackage;

      type Compare = enumeration(
        Less "String 1 is lexicographically less than string 2",
        Equal "String 1 is identical to string 2",
        Greater "String 1 is lexicographically greater than string 2")
      "Enumeration defining comparison of two strings";

      type FileType = enumeration(
        NoFile "No file exists",
        RegularFile "Regular file",
        Directory "Directory",
        SpecialFile "Special file (pipe, FIFO, device, etc.)")
      "Enumeration defining the type of a file";
    end Types;

    package Internal
    "Internal components that a user should usually not directly utilize"
      extends Modelica.Icons.InternalPackage;

    partial package PartialModelicaServices
      "Interfaces of components requiring a tool specific implementation"
        extends Modelica.Icons.InternalPackage;
      package Animation "Models and functions for 3-dim. animation"
        extends Modelica.Icons.Package;
      partial model PartialShape
          "Interface for 3D animation of elementary shapes"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Frames;
            import Modelica.Mechanics.MultiBody.Types;

        parameter Types.ShapeType shapeType="box"
            "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, <external shape>)";
        input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame";
        input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame";
        input SI.Position r_shape[3]={0,0,0}
            "Position vector from origin of object frame to shape origin, resolved in object frame";
        input Real lengthDirection[3](each final unit="1")={1,0,0}
            "Vector in length direction, resolved in object frame";
        input Real widthDirection[3](each final unit="1")={0,1,0}
            "Vector in width direction, resolved in object frame";
        input SI.Length length=0 "Length of visual object";
        input SI.Length width=0 "Width of visual object";
        input SI.Length height=0 "Height of visual object";
        input Types.ShapeExtra extra=0.0
            "Additional size data for some of the shape types";
        input Real color[3]={255,0,0} "Color of shape";
        input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)";

      end PartialShape;

        model PartialSurface "Interface for 3D animation of surfaces"

            import Modelica.Mechanics.MultiBody.Frames;
            import Modelica.Mechanics.MultiBody.Types;

          input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the surface frame";
          input Modelica.SIunits.Position r_0[3]={0,0,0}
            "Position vector from origin of world frame to origin of surface frame, resolved in world frame";

          parameter Integer nu=2 "Number of points in u-Dimension";
          parameter Integer nv=2 "Number of points in v-Dimension";
          replaceable function surfaceCharacteristic =
             Modelica.Mechanics.MultiBody.Interfaces.partialSurfaceCharacteristic
            "Function defining the surface characteristic";

          parameter Boolean wireframe=false
            "= true: 3D model will be displayed without faces";
          parameter Boolean multiColoredSurface=false
            "= true: Color is defined for each surface point";
          input Real color[3]={255,0,0} "Color of surface";
          input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)";
          input Real transparency=0
            "Transparency of shape: 0 (= opaque) ... 1 (= fully transparent)";
        end PartialSurface;
      end Animation;

      package ExternalReferences "Functions to access external resources"
        extends Modelica.Icons.InternalPackage;
        partial function PartialLoadResource
          "Interface for tool specific function to return the absolute path name of a URI or local file name"
          extends Modelica.Icons.Function;
          input String uri "URI or local file name";
          output String fileReference "Absolute path name of file";
        end PartialLoadResource;
      end ExternalReferences;
    end PartialModelicaServices;

    package FileSystem
      "Internal package with external functions as interface to the file system"
     extends Modelica.Icons.InternalPackage;

      function mkdir "Make directory (POSIX: 'mkdir')"
        extends Modelica.Icons.Function;
        input String directoryName "Make a new directory";
      external "C" ModelicaInternal_mkdir(directoryName);
      end mkdir;

      function stat "Inquire file information (POSIX function 'stat')"
        extends Modelica.Icons.Function;
        input String name "Name of file, directory, pipe etc.";
        output Types.FileType fileType "Type of file";
      external "C" fileType = ModelicaInternal_stat(name);
      end stat;
    end FileSystem;
    end Internal;
  end Utilities;

  package Constants
  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Package;

    final constant Real pi=2*Modelica.Math.asin(1.0);

    final constant Real eps=ModelicaServices.Machine.eps
    "Biggest number such that 1.0 + eps = 1.0";

    final constant Real small=ModelicaServices.Machine.small
    "Smallest number such that small and -small are representable on the machine";

    final constant Real inf=ModelicaServices.Machine.inf
    "Biggest Real number such that inf and -inf are representable on the machine";

    final constant SI.FaradayConstant F = 9.64853399e4
    "Faraday constant, C/mol";

    final constant Real R(final unit="J/(mol.K)") = 8.314472
    "Molar gas constant";

    final constant Real N_A(final unit="1/mol") = 6.0221415e23
    "Avogadro constant";
  end Constants;

  package Icons "Library of icons"

    partial class Information "Icon for general information packages"

    end Information;
    extends Icons.Package;

    partial class Contact "Icon for contact information"

    end Contact;

    partial class ReleaseNotes "Icon for release notes in documentation"


    end ReleaseNotes;

    partial package ExamplesPackage
    "Icon for packages containing runnable examples"
      extends Modelica.Icons.Package;
    end ExamplesPackage;

    partial model Example "Icon for runnable examples"

    end Example;

    partial package Package "Icon for standard packages"

    end Package;

    partial package BasesPackage "Icon for packages containing base classes"
      extends Modelica.Icons.Package;
    end BasesPackage;

    partial package VariantsPackage "Icon for package containing variants"
      extends Modelica.Icons.Package;
    end VariantsPackage;

    partial package InterfacesPackage "Icon for packages containing interfaces"
      extends Modelica.Icons.Package;
    end InterfacesPackage;

    partial package SourcesPackage "Icon for packages containing sources"
      extends Modelica.Icons.Package;
    end SourcesPackage;

    partial package SensorsPackage "Icon for packages containing sensors"
      extends Modelica.Icons.Package;
    end SensorsPackage;

    partial package UtilitiesPackage "Icon for utility packages"
      extends Modelica.Icons.Package;
    end UtilitiesPackage;

    partial package TypesPackage
    "Icon for packages containing type definitions"
      extends Modelica.Icons.Package;
    end TypesPackage;

    partial package IconsPackage "Icon for packages containing icons"
      extends Modelica.Icons.Package;
    end IconsPackage;

    partial package InternalPackage
    "Icon for an internal package (indicating that the package should not be directly utilized by user)"

    end InternalPackage;

    partial class RotationalSensor
    "Icon representing a round measurement device"

    end RotationalSensor;

    partial function Function "Icon for functions"

    end Function;

    partial record Record "Icon for records"

    end Record;

    type TypeReal "Icon for Real types"
        extends Real;
    end TypeReal;

    type TypeString "Icon for String types"
        extends String;
    end TypeString;

    partial class UnderConstruction
    "Icon for classes that are still under construction"

    end UnderConstruction;

    partial class ObsoleteModel
    "Icon for classes that are obsolete and will be removed in later versions"

    end ObsoleteModel;
  end Icons;

  package SIunits
  "Library of type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Package;

    package Conversions
    "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Package;

      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Package;
      end NonSIunits;
    end Conversions;

    type Angle = Real (
        final quantity="Angle",
        final unit="rad",
        displayUnit="deg");

    type Length = Real (final quantity="Length", final unit="m");

    type Position = Length;

    type Height = Length(min=0);

    type Volume = Real (final quantity="Volume", final unit="m3");

    type Time = Real (final quantity="Time", final unit="s");

    type AngularVelocity = Real (
        final quantity="AngularVelocity",
        final unit="rad/s");

    type Velocity = Real (final quantity="Velocity", final unit="m/s");

    type Acceleration = Real (final quantity="Acceleration", final unit="m/s2");

    type Frequency = Real (final quantity="Frequency", final unit="Hz");

    type Mass = Real (
        quantity="Mass",
        final unit="kg",
        min=0);

    type Density = Real (
        final quantity="Density",
        final unit="kg/m3",
        displayUnit="g/cm3",
        min=0.0);

    type Pressure = Real (
        final quantity="Pressure",
        final unit="Pa",
        displayUnit="bar");

    type Energy = Real (final quantity="Energy", final unit="J");

    type Power = Real (final quantity="Power", final unit="W");

    type MassFlowRate = Real (quantity="MassFlowRate", final unit="kg/s");

    type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit=
            "m3/s");

    type ThermodynamicTemperature = Real (
        final quantity="ThermodynamicTemperature",
        final unit="K",
        min = 0.0,
        start = 288.15,
        nominal = 300,
        displayUnit="degC")
    "Absolute temperature (use type TemperatureDifference for relative temperatures)";

    type Temperature = ThermodynamicTemperature;

    type TemperatureDifference = Real (
        final quantity="ThermodynamicTemperature",
        final unit="K");

    type LinearTemperatureCoefficient = Real(final quantity = "LinearTemperatureCoefficient", final unit="1/K");

    type Heat = Real (final quantity="Energy", final unit="J");

    type HeatFlowRate = Real (final quantity="Power", final unit="W");

    type ThermalConductance = Real (final quantity="ThermalConductance", final unit=
               "W/K");

    type SpecificHeatCapacity = Real (final quantity="SpecificHeatCapacity",
          final unit="J/(kg.K)");

    type SpecificEnergy = Real (final quantity="SpecificEnergy",
                                final unit="J/kg");

    type ElectricCurrent = Real (final quantity="ElectricCurrent", final unit="A");

    type ElectricCharge = Real (final quantity="ElectricCharge", final unit="C");

    type VolumeDensityOfCharge = Real (
        final quantity="VolumeDensityOfCharge",
        final unit="C/m3",
        min=0);

    type ElectricPotential = Real (final quantity="ElectricPotential", final unit=
           "V");

    type AmountOfSubstance = Real (
        final quantity="AmountOfSubstance",
        final unit="mol",
        min=0);

    type MolarMass = Real (final quantity="MolarMass", final unit="kg/mol",min=0);

    type MolarEnergy = Real (final quantity="MolarEnergy", final unit="J/mol", nominal=2e4);

    type MolarFlowRate = Real (final quantity="MolarFlowRate", final unit=
            "mol/s");

    type MassConcentration = Real (final quantity="MassConcentration", final unit=
           "kg/m3");

    type Concentration = Real (final quantity="Concentration", final unit=
            "mol/m3");

    type ActivityCoefficient = Real (final quantity="ActivityCoefficient", final unit=
               "1");

    type StoichiometricNumber = Real (final quantity="StoichiometricNumber",
          final unit="1");

    type FaradayConstant = Real (final quantity="FaradayConstant", final unit=
            "C/mol");
  end SIunits;
end Modelica;

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

    partial model Heart "Abstract heart circulation submodel"

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow;

    end Heart;

    partial model Systemic "Abstract systemic circulation submodel"
      extends Physiolibrary.Icons.SystemicCirculation;
      //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out;
    end Systemic;

    partial model Pulmonary "Abstract pulmonary circulation submodel"
      extends Physiolibrary.Icons.PulmonaryCirculation;
      //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out;
    end Pulmonary;
  end Interfaces;

  package Controlled
    extends Modelica.Icons.InterfacesPackage;

    partial model System
    "Interface for cardiovascular system controlled by short-term(baroreflex), long-term(blood volume) and pathologies(stenosis)"
      extends Cardiovascular.System(
        redeclare replaceable Pulmonary pulmonaryCirculation constrainedby
        Controlled.Pulmonary,
        redeclare replaceable Heart heart constrainedby Controlled.Heart,
        redeclare replaceable Systemic systemicCirculation constrainedby
        Controlled.Systemic);

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

    model Pulmonary "Abstract controlled pulmonary circulation submodel"
      extends Cardiovascular.Interfaces.Pulmonary;
      Physiolibrary.Types.BusConnector busConnector;
    end Pulmonary;

    partial model Heart "Abstract controlled heart circulation submodel"
      extends Cardiovascular.Interfaces.Heart;
      Physiolibrary.Types.BusConnector busConnector;
    end Heart;

    model Systemic "Abstract controlled systemic circulation submodel"
      extends Cardiovascular.Interfaces.Systemic;
      Physiolibrary.Types.BusConnector busConnector;
    end Systemic;

    partial model LongTermControl
    "Abstract submodel of long-term volume control"

      Physiolibrary.Types.BusConnector busConnector;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a;
      Model.Control.BloodVolume.VolumeRefill2 volumeRefill;
    equation
      connect(volumeRefill.busConnector, busConnector);
      connect(volumeRefill.port_b, port_a);
    end LongTermControl;

    partial model ShortTermControl
    "Abstract submodel of short-term CVS parameters values"

      Physiolibrary.Types.BusConnector busConnector;

    end ShortTermControl;

    model ScenarioControl "Abstract submodel of possible scenarios"

      Physiolibrary.Types.BusConnector busConnector;
    end ScenarioControl;
  end Controlled;

  package Model
    extends Modelica.Icons.ExamplesPackage;

    package Meurs
        extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsMeurs_shallow

        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(useV0Input = false,                                   useComplianceInput = false,
          volume_start=0.000106,
          ZeroPressureVolume=5e-05,
          Compliance=3.2185142219537e-08,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.Conductor PulmonaryArteriesResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 6.818059724437e-08);
        Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(useV0Input = false,                                                                                          useComplianceInput = false,
          volume_start=0.000518,
          ZeroPressureVolume=0.00035,
          Compliance=1.6486353437088e-07,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06);
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftAtrium(useComplianceInput = true, useV0Input = false,
          volume_start=9.31e-05,
          ZeroPressureVolume=3e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel LeftVentricle(useComplianceInput = true, useV0Input = false,
          volume_start=0.000144,
          ZeroPressureVolume=6e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve(_Gon(displayUnit = "ml/(mmHg.s)") = 9.3757696980707e-07, _Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false);
        Parts.AtrialElastance atrialElastance(EMIN=15998686.4898,
            EMAX=37330268.4762);
        Parts.VentricularElastance ventricularElastance(EMIN=
              11999014.86735, EMAX=533289549.66);
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve(_Gon(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06, useLimitationInputs = false, _Goff(displayUnit = "ml/(mmHg.s)") = 0);
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(useV0Input = false,                                                                                          useComplianceInput = false,
          useExternalPressureInput=true,
          volume_start=0.000204,
          ZeroPressureVolume=0.00014,
          Compliance=5.2429304151611e-09,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(volume_start(displayUnit = "ml") = 0.000526, useV0Input = false, useExternalPressureInput = false,                               useComplianceInput = false,
          ZeroPressureVolume=0.00037,
          Compliance=1.3493607749463e-08);
        Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905,
            volumeFlow_start(displayUnit="ml/min") = 2.1666666666667e-05);
        Physiolibrary.Hydraulic.Components.Conductor ArteryResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 1.2526028316622e-07);
        Physiolibrary.Hydraulic.Components.Conductor SystemicArterioralConductance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 9.3757696980707e-09);
        Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-08);
        Physiolibrary.Hydraulic.Components.ElasticVessel PeripheralVessels(useV0Input = false, useExternalPressureInput = false, useComplianceInput = false,
          volume_start=0.000283,
          ZeroPressureVolume=0.000185,
          Compliance=2.8652352197304e-08);
        Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 8.3256834918868e-08);
        Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(useConductanceInput = false, Conductance(displayUnit = "ml/(mmHg.s)") = 2.4999552322936e-06);
        Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(useV0Input = false,                                   useComplianceInput = false,
          useExternalPressureInput=true,
          volume_start=0.00148,
          ZeroPressureVolume=0.00119,
          Compliance=4.1178380513927e-07,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(useV0Input = false, useExternalPressureInput = false,                                                     useComplianceInput = false,
          volume_start=0.00153,
          ZeroPressureVolume=0.001,
          Compliance=4.4403645290063e-07);
        Physiolibrary.Hydraulic.Components.ElasticVessel RightAtrium(useComplianceInput = true, useV0Input = false,
          volume_start=0.000135,
          ZeroPressureVolume=3e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(useComplianceInput = true, useV0Input = false,
          volume_start=0.000131,
          ZeroPressureVolume=4e-05,
          useExternalPressureInput=true,
          ExternalPressure=-533.28954966);
        Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve1(                                                         _Goff(displayUnit = "ml/(mmHg.s)") = 0, useLimitationInputs = false,
          _Gon(displayUnit="ml/(mmHg.s)") = 2.4999552322936e-06);
        Parts.AtrialElastance atrialElastance1(EMIN=6666119.37075,
            EMAX=19998358.11225);
        Parts.VentricularElastance ventricularElastance1(EMIN=
              7599376.082655, EMAX=65327969.83335);
        Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve1(_Gon(displayUnit = "ml/(mmHg.s)") = 2.497705047566e-06, _Goff = 0, useLimitationInputs = false);
        replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2);
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=-533.28954966);
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
      end HemodynamicsMeurs_shallow;

      model HemodynamicsMeurs
        extends Cardiovascular.System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);
      end HemodynamicsMeurs;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;

        model Pulmonary
          extends Cardiovascular.Interfaces.Pulmonary;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PulmonaryArteries(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000106,
            ZeroPressureVolume=5e-05,
            ExternalPressure=-533.28954966,
            Elastance=31064116.267695);
          Physiolibrary.Hydraulic.Components.Resistor PulmonaryArteriesResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 14665462.61565);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PulmonaryVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000518,
            ZeroPressureVolume=0.00035,
            ExternalPressure=-533.28954966,
            Elastance=6066168.6273825);
          Physiolibrary.Hydraulic.Components.Resistor PulmonaryVeinResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245);
        equation
          connect(q_in, PulmonaryArteries.q_in);
          connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in);
          connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in);
          connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in);
          connect(PulmonaryVeinResistance.q_out, q_out);
        end Pulmonary;

        model Systemic
          extends Cardiovascular.Interfaces.Systemic;
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance IntraThoracicArteries(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000204,
            ZeroPressureVolume=0.00014,
            ExternalPressure=-533.28954966,
            Elastance=190651014.00345);
          Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905,
              volumeFlow_start(displayUnit="ml/min") = 2.1666666666667e-05);
          Physiolibrary.Hydraulic.Components.Resistor  ArteryResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 7999343.2449);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance ExtrathoracicArteries(
            volume_start(displayUnit="ml") = 0.000526,
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            ZeroPressureVolume=0.00037,
            Elastance=74127247.40274);
          Physiolibrary.Hydraulic.Components.Resistor  SystemicArterioralResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 106657909.932);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance PeripheralVessels(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.000283,
            ZeroPressureVolume=0.000185,
            Elastance=34930465.50273);
          Physiolibrary.Hydraulic.Components.Resistor  SmallVenuleResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 26664477.483);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance ExtrathoracicVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00153,
            ZeroPressureVolume=0.001,
            Elastance=2253148.3473135);
          Physiolibrary.Hydraulic.Components.Resistor  VeinsResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 11999014.86735);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance IntraThoracicVeins(
            useV0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            volume_start=0.00148,
            ZeroPressureVolume=0.00119,
            ExternalPressure=-533.28954966,
            Elastance=2426467.450953);
          Physiolibrary.Hydraulic.Components.Resistor  CentralVenousResistance(
              useConductanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") = 399967.162245);
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
          Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false,
            volume_start=0.000135,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance atrioVentricleValve1(
            _Goff=0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false,
            volume_start=0.000131,
            ZeroPressureVolume=4e-05,
            ExternalPressure=-533.28954966);
          Physiolibrary.Hydraulic.Components.IdealValveResistance ventricleArteryValve1(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          VentricularElastance ventricularElastance1(EMIN=7599376.082655, EMAX=
                65327969.83335);
          AtrialElastance atrialElastance1(EMIN=6666119.37075, EMAX=
                19998358.11225);
          replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2);
          Physiolibrary.Hydraulic.Components.ElasticVessel leftAtrium(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false,
            volume_start=9.31e-05,
            ZeroPressureVolume=3e-05,
            ExternalPressure=-533.28954966);
          AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=
                37330268.4762);
          Physiolibrary.Hydraulic.Components.IdealValveResistance atrioVentricleValve(
            useLimitationInputs=false,
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245);
          Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(useComplianceInput = true, useV0Input = false, useExternalPressureInput = false,
            volume_start=0.000144,
            ZeroPressureVolume=6e-05,
            ExternalPressure=-533.28954966);
          VentricularElastance ventricularElastance(EMIN=11999014.86735, EMAX=
                533289549.66);
          Physiolibrary.Hydraulic.Components.IdealValveResistance ventricleArteryValve(
            _Goff(displayUnit="ml/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/ml") = 1066579.09932);
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
          parameter Physiolibrary.Types.HydraulicElastance EMIN
          "Diastolic elastance";
        parameter Boolean useEs_extInput = false
          "=true, if external elastance/compliance value is used";
          parameter Physiolibrary.Types.HydraulicElastance EMAX
          "Maximum systolic elastance";
        Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Ees)=1/es_int if useEs_extInput;
      protected
           Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int=EMAX;
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
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct
          "ventricular elasticity";
          Modelica.Blocks.Interfaces.RealOutput Et0
          "normalized ventricular elasticity (0..1)";
          Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time";
          Physiolibrary.Types.HydraulicElastance Et;
          parameter Physiolibrary.Types.HydraulicElastance EMIN
          "Diastolic elastance ";
          constant Real Kn = 0.57923032735652;
          //Kn is always = 0.5792303273565197
          //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
          //Equation to calculate normalized elastance ET0 was:
          //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
        parameter Boolean useEs_extInput = false
          "=true, if external elastance/compliance value is used";
          parameter Physiolibrary.Types.HydraulicElastance EMAX
          "Maximum systolic elastance";
        Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/EMAX)=1/es_int if useEs_extInput;
      protected
           Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int=EMAX;
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
          discrete Physiolibrary.Types.Time Tas, T0, Tvs;
          parameter Physiolibrary.Types.Time Tav(displayUnit = "s") = 0.01
          "atrioventricular delay";
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
        extends Cardiovascular.Controlled.System(
          redeclare replaceable ControlledParts.PulmonaryControl
            pulmonaryCirculation,
          redeclare replaceable ControlledParts.HeartControl heart,
          redeclare replaceable ControlledParts.SystemicControl
            systemicCirculation,
          redeclare replaceable ControlledParts.Baroreflex
            shortTermControl,
          redeclare replaceable Cardiovascular.Model.Control.BloodVolumeControl
            longTermControl);
      /*    redeclare CardiovascularDevel.Model.Meurs.Variants.Parts.Stenosis
      stenosisControl(aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
             1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml") = 1066579.09932),
        AVBackFlowConductance(k=1.2501026264094e-15)),*/

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
          connect(add.y, busConnector.pulmonaryBloodVolume);
        end PulmonaryControl;

        model SystemicControl
          extends Parts.Systemic(
            SmallVenuleResistance(useConductanceInput=true),
            IntraThoracicArteries(
              useV0Input=false,
              useExternalPressureInput=false,
              useComplianceInput=false),
            IntraThoracicVeins(useComplianceInput=true));
          extends Controlled.Systemic;
          Modelica.Blocks.Math.Sum sum1(nin=5);
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement;
        equation
          connect(IntraThoracicVeins.volume, sum1.u[1]);
          connect(sum1.y, busConnector.systemicBloodVolume);
          connect(aortaPressureMeasurement.q_in, inertia.q_in);
          connect(ExtrathoracicVeins.volume, sum1.u[2]);
          connect(PeripheralVessels.volume, sum1.u[3]);
          connect(ExtrathoracicArteries.volume, sum1.u[4]);
          connect(IntraThoracicArteries.volume, sum1.u[5]);
          connect(SmallVenuleResistance.cond, busConnector.peripheralconductance);
          connect(IntraThoracicVeins.compliance, busConnector.venacavacompliance);
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure);
        end SystemicControl;

        model HeartControl
          extends Parts.Heart(
            ventricularElastance1(useEs_extInput=true),
            ventricularElastance(useEs_extInput=true),
            redeclare Types.Constants.FrequencyControl HeartRate,
            ventricleArteryValve(useLimitationInputs=false));
          extends Controlled.Heart;
          Modelica.Blocks.Math.Sum sum1(nin=4);
        equation
          connect(rightAtrium.volume, sum1.u[1]);
          connect(rightVentricle.volume, sum1.u[2]);
          connect(leftVentricle.volume, sum1.u[3]);
          connect(leftAtrium.volume, sum1.u[4]);
          connect(sum1.y, busConnector.heartBloodVolume);
          connect(ventricularElastance1.Es_ext, busConnector.rvcompliance);
          connect(ventricularElastance.Es_ext, busConnector.lvcompliance);
          connect(HeartRate.c, busConnector.heartrate);
        end HeartControl;

        model Baroreflex
          extends Model.Control.Baroreflex(baroreceptor(
              activationDelay=1,
              PAOmedia=12974.201470097,
              HR0Param=1.2,
              EV0right=65327969.83335,
              EV0left=533289549.66,
              EV0venacava=4.1215883592719e-07,
              RS0=26664477.483));
        end Baroreflex;

        model AorticValveStenosisScenario
          extends Model.Scenario.StenosisControl(venacavastenosis(
                InitialElastance=2426467.450953, FinalElastance=2426467.450953),
            aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
                1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml")=
                1066579.09932),
            mitralvalvestenosis(InitialResistance=399967.162245,
                FinalResistance=399967.162245));

        end AorticValveStenosisScenario;

        model AorticValveHeartControl
          extends HeartControl(ventricleArteryValve(useLimitationInputs=true));
        equation
          connect(ventricleArteryValve.Gon, busConnector.avoutflowresistance);
          connect(ventricleArteryValve.Goff, busConnector.avbackflowconductance);
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve
        extends HemodynamicsMeursBVControl(redeclare
          ControlledParts.AorticValveStenosisScenario   scenarioControl(
              aorticstenosis(FinalResistance(displayUnit="(mmHg.s)/ml")=
                10665790.9932)), redeclare
          ControlledParts.AorticValveHeartControl   heart);
      end StenosisAorticValve;

      model Bleeding
        extends HemodynamicsMeursBVControl(redeclare
          Scenario.BleedingTransfusionScenario   scenarioControl(
            BloodTrans=0,
            Tbd=300,
            BloodLoss=0.0005,
            Tts=1200,
            Ttd=600), longTermControl(redeclare
            Control.BloodVolume.PlasmaBleeding   plasma(hemorrhage(
                  useSolutionFlowInput=true)), redeclare
            Control.BloodVolume.RBCBleeding   redBloodCells));
      end Bleeding;
    end Meurs;

    package Burkhoff
        extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsBurkhoff_shallow
        //Cardiovascular.Hydraulic.Components.Resistor
        //Cardiovascular.Hydraulic.Components.IdealValveNorm
        import Physiolibrary.Hydraulic.Components.*;
        ElasticVessel Cvs(
          volume_start=0.002701,
          ZeroPressureVolume=0.00223,
          Compliance=5.2504310309196e-07);
      Resistor Ras(Resistance=
              99991790.56125);
        ElasticVessel Cas(
          volume_start=0.000834,
          ZeroPressureVolume=0.0007,
          Compliance=1.2751046789376e-08);
        Resistor Rcs(Resistance=
              3199737.29796);
        ElasticVessel Caprox(
          volume_start=3.8e-05,
          ZeroPressureVolume=3e-05,
          Compliance=7.5006157584566e-10,
          useExternalPressureInput=true);
        Resistor Rcprox(Resistance=
              2666447.7483);
        IdealValveResistance AOV(_Ron=
              266644.77483);
        Parts.ElasticVesselWithSVandP LV(
          useComplianceInput=true,
          volume_start=0.000125,
          ZeroPressureVolume=5e-06,
          useExternalPressureInput=true);
        IdealValveResistance MV(_Ron=
              333305.9685375);
        Parts.ElasticVesselWithSVandP LA(
          useComplianceInput=true,
          useExternalPressureInput=true,
          volume_start=8.1e-05,
          ZeroPressureVolume=5e-06);
        Resistor Rvp(Resistance=
              1999835.811225);
        Resistor Rvs(Resistance=
              2666447.7483);
        Parts.ElasticVesselWithSVandP RA(
          useComplianceInput=true,
          useExternalPressureInput=true,
          volume_start=7.3e-05,
          ZeroPressureVolume=5e-06);
        IdealValveResistance TV(_Ron(
              displayUnit="(mmHg.s)/ml") = 333305.9685375);
        Parts.ElasticVesselWithSVandP RV(
          useComplianceInput=true,
          ExternalPressure=0,
          volume_start=0.000112,
          ZeroPressureVolume=5e-06,
          useExternalPressureInput=true);
        IdealValveResistance PV(_Ron=
              266644.77483);
        Resistor Rcsp(Resistance=
              2666447.7483);
        ElasticVessel Cap(
          volume_start=0.000802,
          ZeroPressureVolume=0.0006,
          Compliance=1.5001231516913e-07,
          useExternalPressureInput=true);
        Resistor Rcp(Resistance=
              2666447.7483);
        ElasticVessel Cvp(
          volume_start=0.000154,
          ZeroPressureVolume=0.0001,
          Compliance=5.2504310309196e-08,
          useExternalPressureInput=true);
        ElasticVessel Capprox(
          volume_start=3e-05,
          ZeroPressureVolume=2e-05,
          Compliance=7.5006157584566e-09,
          useExternalPressureInput=true);
        Resistor Rap(Resistance=
              2666447.7483);
        Parts.AtrialElastance RAElastance(
          Tmax(displayUnit="ms") = 0.125,
          Tau(displayUnit="ms") = 0.02,
          Beta(displayUnit="mmHg") = 39.9967162245,
          Alpha=40000,
          Ees=26664477.483);
        Parts.VentricularElastance RVElastance(
          Tmax(displayUnit="ms") = 0.2,
          Tau(displayUnit="ms") = 0.03,
          Beta(displayUnit="mmHg") = 45.3296117211,
          Alpha=24000,
          Ees=50662507.2177);
        Parts.AtrialElastance LAElastance(
          Tmax(displayUnit="ms") = 0.125,
          Tau(displayUnit="ms") = 0.02,
          Beta(displayUnit="mmHg") = 39.9967162245,
          Alpha=40000,
          Ees=33330596.85375);
        Parts.VentricularElastance LVElastance(
          Tmax(displayUnit="ms") = 0.2,
          Tau(displayUnit="ms") = 0.03,
          AVDelay(displayUnit="s"),
          Beta(displayUnit="mmHg") = 45.3296117211,
          Alpha=24000,
          Ees=205316476.6191);
        Physiolibrary.Types.Constants.FrequencyConst heartRate(k=
              1.3333333333333);
        Modelica.Blocks.Math.Gain RAVGain(k=0.02);
        Modelica.Blocks.Math.Add3 add;
        Modelica.Blocks.Math.Gain LAVGain(k=0.02);
        Modelica.Blocks.Math.Add3 add1;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1;
        Modelica.Blocks.Math.Add add2;
        Modelica.Blocks.Math.Add add3;
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=0);
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
        extends Cardiovascular.System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare replaceable Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);
      end HemodynamicsBurkhoff;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;

        model Pulmonary
          extends Cardiovascular.Interfaces.Pulmonary;
          import Physiolibrary.Hydraulic.Components.*;
        Resistor Rcsp(Resistance(
                displayUnit="(mmHg.s)/ml") = 2666447.7483);
        ElasticVessel      Capprox(
            volume_start=3e-05,
            ZeroPressureVolume=2e-05,
            Compliance=7.5006157584566e-09);
        Resistor Rcp(Resistance(
                displayUnit="(mmHg.s)/ml") = 2666447.7483);
        ElasticVessel      Cap(
            volume_start=0.000802,
            ZeroPressureVolume=0.0006,
            Compliance=1.5001231516913e-07);
        Resistor Rap(Resistance(
                displayUnit="(mmHg.s)/ml") = 2666447.7483);
        ElasticVessel      Cvp(
            volume_start=0.000154,
            ZeroPressureVolume=0.0001,
            Compliance=5.2504310309196e-08);
        Resistor Rvp(Resistance(
                displayUnit="(mmHg.s)/ml") = 1999835.811225);
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
            import Physiolibrary.Hydraulic.Components.*;
        Resistor Rcprox(Resistance(
                displayUnit="(mmHg.s)/ml") = 2666447.7483);
        ElasticVessel Caprox(
            volume_start=3.8e-05,
            ZeroPressureVolume=3e-05,
            Compliance=7.5006157584566e-10);
        Resistor Rcs(Resistance(
                displayUnit="(mmHg.s)/ml") = 3199737.29796);
          Physiolibrary.Hydraulic.Components.ElasticVessel Cas(
            volume_start=0.000834,
            ZeroPressureVolume=0.0007,
            Compliance=1.2751046789376e-08);
        Resistor Ras(Resistance(
                displayUnit="(mmHg.s)/ml") = 99991790.56125);
        ElasticVessel Cvs(
            volume_start=0.002701,
            ZeroPressureVolume=0.00223,
            useComplianceInput=false,
            Compliance=5.2504310309196e-07);
        Resistor Rvs(Resistance(
                displayUnit="(mmHg.s)/ml") = 2666447.7483);
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

        model Heart "heart with modified elastance"
          extends Cardiovascular.Interfaces.Heart;
        Parts.ElasticVesselWithSVandP LA(
            useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=8.1e-05,
            ZeroPressureVolume=5e-06);
        Parts.AtrialElastance atrialElastance1(
            Tmax(displayUnit="ms") = 0.125,
            Tau(displayUnit="ms") = 0.02,
            Alpha=40000,
            Beta(displayUnit="mmHg") = 39.9967162245,
            Ees=33330596.85375);
          Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06);
        Parts.VentricularElastance ventricularElastance1(
            Tmax(displayUnit="ms") = 0.2,
            Tau(displayUnit="ms") = 0.03,
            Alpha=24000,
            Beta(displayUnit="mmHg") = 45.3296117211,
            Ees=205316476.6191);
        Parts.ElasticVesselWithSVandP LV(
            useComplianceInput=true,
            volume_start=0.000125,
            ZeroPressureVolume=5e-06,
            useExternalPressureInput=true);
          Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06);
          Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06);
        Parts.ElasticVesselWithSVandP RV(
            useComplianceInput=true,
            ExternalPressure=0,
            useExternalPressureInput=true,
            volume_start=0.000112,
            ZeroPressureVolume=5e-06);
        Parts.VentricularElastance ventricularElastance(
            Tmax(displayUnit="ms") = 0.2,
            Tau(displayUnit="ms") = 0.03,
            Alpha=24000,
            Beta(displayUnit="mmHg") = 45.3296117211,
            Ees=50662507.2177);
          Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06);
        Parts.AtrialElastance atrialElastance(
            Tmax(displayUnit="ms") = 0.125,
            Tau(displayUnit="ms") = 0.02,
            Alpha=40000,
            Beta(displayUnit="mmHg") = 39.9967162245,
            Ees=26664477.483);
        Parts.ElasticVesselWithSVandP RA(
            useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=7.3e-05,
            ZeroPressureVolume=5e-06);
          replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                       heartRate(k=
                1.3333333333333);
          Control.BloodFlowMeasurement bloodFlowMeasurement;
          Modelica.Blocks.Math.Add add;
          Modelica.Blocks.Math.Add add1;
          Modelica.Blocks.Math.Gain RAVGain(k=0.02);
          Modelica.Blocks.Math.Gain LAVGain(k=0.02);
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

        model ElasticVesselWithSVandP
        "elastic vessel computes aditionally stressed volume and pressure"
          extends Physiolibrary.Hydraulic.Components.ElasticVessel;
          Physiolibrary.Types.RealIO.VolumeOutput StressedVolume;
        equation
          StressedVolume = volume - zpv;
        end ElasticVesselWithSVandP;

        partial model HeartElastance
        "Elastance of heart atria and ventricules by Burkhoff"
          import Physiolibrary.Types.*;
          RealIO.VolumeInput Vs "Stressed volume";
          parameter Real Alpha( final unit="1/m3")
          "coefficient of end diastolic pressure-volume curve";
          parameter Pressure Beta
          "coefficient of end diastolic pressure-volume curve";
          parameter Boolean useEs_extInput = false
          "=true, if external elastance/compliance value is used";
          parameter HydraulicElastance Ees
          "coefficient of end-systolic elastance";
          HydraulicElastance Et "Elastance";
          Time Tsyst;
          //need to define in extended model
          parameter Time Tmax "duration of systole ";
          parameter Time Tau "time constant of myocardial relaxation ";
          Real Et0
          "Relative elastance value (Elastance/End-Systolic Elastance)";
          RealIO.PressureOutput Pt "peak isovolumic pressure";
          RealIO.HydraulicComplianceOutput Ct;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Ees)=1/mes if useEs_extInput;
      protected
         HydraulicElastance mes;
        equation
          if not useEs_extInput then
            mes = Ees;
          end if;
          if Tsyst <= 3 / 2 * Tmax then
            Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * Tsyst - Modelica.Constants.pi / 2) + 1);
          else
            Et0 = 0.5 * exp(-(Tsyst - 3 * Tmax / 2) / Tau);
          end if;
          //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
          //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;
          Et = Modelica.Constants.eps + Et0 * mes;
          Pt = (1 - Et0) * Beta * (exp(Alpha * Vs) - 1);
          Ct = 1 / Et;
        end HeartElastance;

        model VentricularElastance
          extends HeartIntervals;
          //produces tvsyst and tasyst
          extends HeartElastance;
          //consumes tsyst from above
        equation
          Tsyst = Tvsyst;
        end VentricularElastance;

        model HeartIntervals
          discrete Physiolibrary.Types.Time HP(start = 0)
          "heart period - duration of cardiac cycle";
          Boolean b(start = false);
          Physiolibrary.Types.RealIO.FrequencyInput HR;
          Physiolibrary.Types.Time Tasyst
          "time elapsed from the beginning of atrial systole";
          Physiolibrary.Types.Time Tvsyst
          "time elapsed from the beginning of ventricular systole";
          parameter Physiolibrary.Types.Time AVDelay(displayUnit = "s")= 0.160
          "AV interval";
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
        extends Controlled.System(
          redeclare replaceable ControlledParts.PulmonaryControl
            pulmonaryCirculation,
          redeclare replaceable ControlledParts.HeartControl
            heart(MV(useLimitationInputs=false), AOV(useLimitationInputs=false)),
          redeclare replaceable ControlledParts.SystemicControl
            systemicCirculation(Ras(useConductanceInput=false)),
          redeclare Model.Control.Baroreflex shortTermControl(
              baroreceptor(
              PAOmedia=11585.715466364,
              EV0right=50662507.2177,
              EV0left=205316476.6191,
              EV0venacava=5.2504310309196e-07,
              activationDelay=10)),
          redeclare replaceable Model.Control.BloodVolumeControl
            longTermControl);
      /*    redeclare Control.StenosisControl simulationControl(venacavastenosis(
          InitialElastance=1906510.1400345, FinalElastance=
            1906510.1400345),                                aorticstenosis(
          InitialResistance(displayUnit="(mmHg.s)/ml") = 266644.77483,
          FinalResistance(displayUnit="(mmHg.s)/ml") = 266644.77483),
      mitralvalvestenosis(InitialResistance=333305.9685375, FinalResistance=333305.9685375)));*/
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
          connect(add3_1.y, busConnector.pulmonaryBloodVolume);
        end PulmonaryControl;

        model SystemicControl
          extends Controlled.Systemic;
          extends Parts.Systemic(Cvs(
                useComplianceInput=true), Caprox(useComplianceInput=false));
          Modelica.Blocks.Math.Add3 add3_1;
          Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement;
        equation
          connect(add3_1.u3, Cvs.volume);
          connect(add3_1.u2, Cas.volume);
          connect(add3_1.u1, Caprox.volume);
          connect(add3_1.y, busConnector.systemicBloodVolume);
          connect(Rcs.q_in, aortaPressureMeasurement.q_in);
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure);
          connect(Cvs.compliance, busConnector.venacavacompliance);
        end SystemicControl;

        model HeartControl
          extends Controlled.Heart;
          extends Parts.Heart(
            redeclare Types.Constants.FrequencyControl heartRate,
            ventricularElastance(useEs_extInput=true),
            atrialElastance1(useEs_extInput=false),
            ventricularElastance1(useEs_extInput=true),
            AOV(_Goff(displayUnit="ml/(mmHg.s)"), useLimitationInputs=false),
            MV(useLimitationInputs=false));

          Modelica.Blocks.Math.Sum sum1(nin=4);
        equation
          connect(heartRate.c, busConnector.heartrate);
          connect(ventricularElastance.Es_ext, busConnector.rvcompliance);
          connect(ventricularElastance1.Es_ext, busConnector.lvcompliance);
          connect(RV.volume, sum1.u[1]);
          connect(RA.volume, sum1.u[2]);
          connect(LV.volume, sum1.u[3]);
          connect(LA.volume, sum1.u[4]);
          connect(sum1.y, busConnector.heartBloodVolume);
        end HeartControl;

        model AorticValveStenosisScenario
          extends Model.Scenario.StenosisControl(venacavastenosis(
                InitialElastance=1906510.1400345, FinalElastance=
                  1906510.1400345),
            aorticstenosis(
              InitialResistance(displayUnit="(mmHg.s)/ml") = 266644.77483,
              FinalResistance(displayUnit="(mmHg.s)/ml") = 10665790.9932,
              duration=60),
            mitralvalvestenosis(InitialResistance=333305.9685375,
                FinalResistance=333305.9685375));
        end AorticValveStenosisScenario;

        model AorticValveHeartControl
          extends HeartControl(AOV(useLimitationInputs=true));
        equation
          connect(AOV.Goff, busConnector.avbackflowconductance);
          connect(AOV.Gon, busConnector.avoutflowresistance);
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve
        extends HemodynamicsBurkhoffBVControl(redeclare
          ControlledParts.AorticValveStenosisScenario   scenarioControl(
              aorticstenosis(duration=60)), redeclare
          ControlledParts.AorticValveHeartControl   heart);
      end StenosisAorticValve;

      model Bleeding
        extends HemodynamicsBurkhoffBVControl(redeclare
          Scenario.BleedingTransfusionScenario   scenarioControl(
            BloodTrans=0,
            Tbs=600,
            Tbd=300,
            BloodLoss=0.0005,
            Tts=1200,
            Ttd=600), longTermControl(redeclare
            Control.BloodVolume.PlasmaBleeding   plasma, redeclare
            Control.BloodVolume.RBCBleeding   redBloodCells));
      end Bleeding;
    end Burkhoff;

    package Smith2004
        extends Modelica.Icons.ExamplesPackage;

      model HemodynamicsSmith_shallow
        import Physiolibrary.Hydraulic.Components.*;
      ElasticVesselElastance aorta(
          ZeroPressureVolume=0,
          volume_start=0.0001241,
          Elastance=92165766.41999);
      ElasticVesselElastance venaCava(
          ZeroPressureVolume=0,
          volume_start=0.0002952,
          Elastance(displayUnit="Pa/m3") = 786602.0857485);
      IdealValveResistance aorticValve(Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347);
      Resistor Rsys(Resistance(displayUnit=
               "(mmHg.s)/ml") = 145054757.50752);
      IdealValveResistance tricuspidValve(Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 3159740.5817355);
      Inertia Lav(
            I(displayUnit="mmHg.s2/ml") = 16250.665802014, volumeFlow_start(
              displayUnit="m3/s") = -1.4e-8);
      Inertia Lpv(
            I(displayUnit="mmHg.s2/ml") = 19822.372560862, volumeFlow_start(
              displayUnit="m3/s") = -1.9e-9);
      IdealValveResistance pulmonaryValve(Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 733273.1307825);
          ElasticVesselElastance pulmonaryArteries(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=3.904e-05,
          Elastance(displayUnit="Pa/m3") = 49195960.956135);
      Resistor Rpul(Resistance(displayUnit=
               "(mmHg.s)/ml") = 20691634.526808);
      ElasticVesselElastance pulmonaryVeins(
          ZeroPressureVolume=0,
          useExternalPressureInput=true,
          volume_start=0.0008269,
          Elastance(displayUnit="Pa/m3") = 973253.4281295);
      IdealValveResistance mitralValve(Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157);
      Inertia Ltc(
            I(displayUnit="mmHg.s2/ml") = 10678.18997523, volumeFlow_start(
              displayUnit="m3/s") = 0.0001372);
      Inertia Lmt(
            I(displayUnit="mmHg.s2/ml") = 10261.557514558, volumeFlow_start(
              displayUnit="m3/s") = 0.0001141);
        Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2);
        Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=-533.28954966);
      Parts.VentricularInteraction_flat ventricularInteraction_flat(
          lambdalv=33000,
          lambdaperi=30000,
          lambdas(displayUnit="1/m3") = 435000,
          lambdarv(displayUnit="1/m3") = 23000,
          Essept(displayUnit="mmHg/ml") = 6499999676.0309,
          V0peri=0.0002,
          Pi0sept=148.00118226939,
          Pi0rv=28.757638965416,
          Pi0lv=16.038683206025,
          Pi0peri=66.701190423724,
          Esrv=77993596.637775,
          Eslv=383941811.27772);
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
        connect(Ltc.q_out,tricuspidValve. q_in);
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
        extends Cardiovascular.System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);
      end HemodynamicsSmith;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;

        model VentricularInteraction_flat
            import Physiolibrary.Types.*;
            Volume Vsept(start=0.000002),Vrv(start=0.0001042),Vlv(start=0.0001042),Vperi;
            parameter Volume V0sept=0.000002,V0peri;
            Pressure Psept,Pperi;
            parameter Pressure Pi0sept,Pi0rv,Pi0lv,Pi0peri
          "peak isovolumic pressure";
            parameter HydraulicElastance Essept,Esrv,Eslv
          "elastance of systole";
            parameter Real A=1,B=80,CC=0.375;
            Time tm;
            discrete Time HP "heart period";
            discrete Time t0 "time of beginning of the cardiac cycle";
            discrete Time ts "duration of systole";
            parameter HydraulicLambda lambdas;
            parameter HydraulicLambda lambdarv;
            parameter HydraulicLambda lambdalv;
            parameter HydraulicLambda lambdaperi;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow;
          RealIO.FrequencyInput HR;
          RealIO.PressureInput Pth;
        equation
          //timing
          tm = time - pre(t0);
          when {initial(), tm >= pre(HP)} then
            HP = 1 / HR;
            t0 = time;
            ts = 0.16 + 0.3 * HP;
          end when;
          //  septum
          Psept = lvflow.pressure-rvflow.pressure;
          Psept = (Vsept-V0sept)*A*exp(-B*(tm-CC)^2)*Essept
                        +(1-A*exp(-B*(tm-CC)^2))*Pi0sept*(exp(lambdas*Vsept)-1);
          // rightventricle
          rvflow.pressure - Pperi = (Vrv+Vsept)*A*exp(-B*(tm-CC)^2)*Esrv
                        +(1-A*exp(-B*(tm-CC)^2))*Pi0rv*(exp(lambdarv*(Vrv+Vsept))-1);
          der(Vrv) = rvflow.q;
          //leftventricle
          lvflow.pressure - Pperi = (Vlv-Vsept)*A*exp(-B*(tm-CC)^2)*Eslv
                        +(1-A*exp(-B*(tm-CC)^2))*Pi0lv*(exp(lambdalv*(Vlv-Vsept))-1);
          der(Vlv) = lvflow.q;
          //pericardium
          Vperi = Vrv+Vlv;
          Pperi=Pth+ Pi0peri*(exp(lambdaperi*(Vperi-V0peri))-1);
        end VentricularInteraction_flat;

        model Septum

          Physiolibrary.Hydraulic.Sensors.PressureMeasure rvpressure;
          Modelica.Blocks.Math.Add add1;
        TimeVaryingElastance septumdrv(
            lambda=435000,
            Es=6499999676.0309,
            Pi0=148.00118226939);
          Physiolibrary.Hydraulic.Sensors.PressureMeasure lvpressure;
        ElasticWall elasticWall(volume(
                start=2e-06), V0=2e-06);
          Physiolibrary.Types.RealIO.VolumeOutput volume(start=2e-06);
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

          TimeVaryingElastance drive(
            lambda=23000,
            Es=77993596.637775,
            Pi0=28.757638965416);
        ElasticVesselWithSVandP ventricle(
            useComplianceInput=true,
            useExternalPressureInput=true,
            useV0Input=true,
            volume_start=0.0001042,
            Elastance=133322387.415);
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
        //  Physiolibrary.Types.Pressure Plv,Plvf,Pperi,Prv,Prvf,Ppcd,Pth,Pspt;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow;
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow;
          Physiolibrary.Types.RealIO.FrequencyInput frequency;
        Pericardium pericardium(
            lambda(displayUnit="1/m3") = 30000,
            V0=0.0002,
            P0=66.701190423724);
          Physiolibrary.Types.RealIO.PressureInput Pth;
        Ventricle rightVentricle(drive(
              lambda=23000,
              Es=77993596.637775,
              Pi0=28.757638965416));
        Ventricle leftVentricle(drive(
              lambda=33000,
              Es=383941811.27772,
              Pi0=16.038683206025));
        Septum septum;
          Modelica.Blocks.Math.Gain gain(k=-1);
        equation
          /*Plv = Plvf+Pperi;
  Plvf=e*Peslvf+(1-e)*Pedlvf;

  Prv=Prvf+Pperi;
  Prvf=e*Pesrvf+(1-e)*Pedrvf;

  Pperi=Ppcd+Pth;

  Pspt=Plv-Prv;

Pspt=e*Pesspt+(1-e)*Pedspt;
*/
          //Pspt = leftVentricle.q_in.pressure - rightVentricle.q_in.pressure;
          connect(frequency,leftVentricle. HR);
          connect(rightVentricle.HR, frequency);
          connect(septum.HR,    frequency);
          connect(rightVentricle.stressedVolume, pericardium.Vrvfw);
          connect(lvflow,leftVentricle. q_in);
          connect(pericardium.pressure,leftVentricle. Pext);
          connect(Pth, pericardium.Pth);
          connect(pericardium.pressure, rightVentricle.Pext);
          connect(leftVentricle.stressedVolume, pericardium.Vlvfw);
          connect(septum.volume,leftVentricle. V0);
          connect(septum.volume, gain.u);
          connect(pericardium.Vsept, gain.u);
          connect(gain.y, rightVentricle.V0);
          connect(rightVentricle.q_in, rvflow);
          connect(septum.rvflow, rvflow);
          connect(septum.lvflow,leftVentricle. q_in);
        end VentricularInteraction;

        model TimeVaryingElastance
          //parameter Physiolibrary.Types.HydraulicElastance Ed "elastance of diastole";
          parameter Boolean useEs_extInput = false
          "=true, if external elastance/compliance value is used";
          parameter Physiolibrary.Types.HydraulicElastance Es
          "elastance of systole";
          parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
          parameter HydraulicLambda lambda;
          Physiolibrary.Types.Time tm
          "relative time from the beginning of cardiac cycle";
          discrete Physiolibrary.Types.Time HP "heart period";
          discrete Physiolibrary.Types.Time t0
          "time of beginning of the cardiac cycle";
          discrete Physiolibrary.Types.Time ts "duration of systole";
          Real et;
          parameter Real A=1,B=80,CC=0.375;
          Physiolibrary.Types.RealIO.HydraulicComplianceOutput C;
          Physiolibrary.Types.HydraulicElastance E;
          Physiolibrary.Types.RealIO.PressureOutput Pi;
          Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate";
          Physiolibrary.Types.RealIO.VolumeInput V;
        Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Es)=1/es_int if useEs_extInput;
      protected
           Physiolibrary.Types.HydraulicElastance es_int;
        equation
          if not useEs_extInput then
            es_int=Es;
          end if;
          tm = time - pre(t0);
        /*  if tm < pre(ts) then
    a = (1 - cos(2 * Modelica.Constants.pi * tm / pre(ts))) / 2;
  else
    a = 0;
  end if;
  E = Ed + Es * a;
  C = 1 / E;
  //  Pi = Pi0 * a;
  */
          when {initial(), tm >= pre(HP)} then
            HP = 1 / HR;
            t0 = time;
            ts = 0.16 + 0.3 * HP;
          end when;
          et = A*exp(-B*(tm-CC)^2);//(5)
          E = et*es_int;//(derived (4)
          C = 1/E;
          Pi = (1-et)*Pi0*(exp(lambda*V)-1);//derived(4)
        end TimeVaryingElastance;

        type HydraulicLambda = Real(final quantity="HydraulicLambda",final unit="1/m3", displayUnit="1/ml", nominal=(1e-5), min=0);

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
          Vperi = Vrvfw+Vlvfw;
          Vrv = Vrvfw+Vsept;
          Vlv= Vlvfw-Vsept;
          Pperi=P0*(exp(lambda*(Vperi-V0))-1); //orig equation in mmHg and ml
           pressure = Pth + Pperi;
        end Pericardium;

        model Heart
          extends Cardiovascular.Interfaces.Heart;
          Physiolibrary.Hydraulic.Components.Inertia Ltc(
              I(displayUnit="mmHg.s2/ml") = 10678.18997523, volumeFlow_start(
                displayUnit="m3/s") = 0.0001372);
          Physiolibrary.Hydraulic.Components.IdealValveResistance tricuspidValve(
            Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 3159740.5817355);
          Physiolibrary.Hydraulic.Components.Inertia Lpv(
              I(displayUnit="mmHg.s2/ml") = 19822.372560862, volumeFlow_start(
                displayUnit="m3/s") = -1.9e-9);
          Physiolibrary.Hydraulic.Components.IdealValveResistance pulmonaryValve(
            Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 733273.1307825);
          Physiolibrary.Hydraulic.Components.Inertia Lmt(
              I(displayUnit="mmHg.s2/ml") = 10261.557514558, volumeFlow_start(
                displayUnit="m3/s") = 0.0001141);
          Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(
            Pknee=0,
           _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157);
          Physiolibrary.Hydraulic.Components.Inertia Lav(
              I(displayUnit="mmHg.s2/ml") = 16250.665802014, volumeFlow_start(
                displayUnit="m3/s") = -1.4e-8);
            Physiolibrary.Hydraulic.Components.IdealValveResistance  aorticValve(
            Pknee=0,
            _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347);
          replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                       HR(k=1.2);
          replaceable VentricularInteraction
                                   ventricularInteraction
            constrainedby VentricularInteraction;
          Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966);
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
        Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryArteries(
            ZeroPressureVolume=0,
            useExternalPressureInput=true,
            volume_start=3.904e-05,
            Elastance=49195960.956135);
          Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(displayUnit="(mmHg.s)/ml")=
                 20691634.526808);
                  Physiolibrary.Hydraulic.Components.ElasticVesselElastance pulmonaryVeins(
            ZeroPressureVolume=0,
            useExternalPressureInput=true,
            volume_start=0.0008269,
            Elastance=973253.4281295);
          Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966);
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
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(
            ZeroPressureVolume=0,
            volume_start=0.0001241,
            Elastance=92165766.41999);
          Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(displayUnit=
                 "(mmHg.s)/ml") = 145054757.50752);
          Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(
            ZeroPressureVolume=0,
            volume_start=0.0002952,
            Elastance=786602.0857485);
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
                    parameter Physiolibrary.Types.Volume V0=0;
          Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance;
        equation
          pressure = plv -prv;
          pressure = (volume-V0) /compliance;
        end ElasticWall;

        model ElasticVesselWithSVandP
        "elastic vessel computes aditionally stressed volume and pressure"
          extends Physiolibrary.Hydraulic.Components.ElasticVesselElastance;
          Physiolibrary.Types.RealIO.VolumeOutput StressedVolume;
        equation
          StressedVolume = volume - zpv;
        end ElasticVesselWithSVandP;
      end Parts;

      model HemodynamicsSmithControl
        extends Controlled.System(
          redeclare ControlledParts.PulmonaryControl
            pulmonaryCirculation,
          redeclare replaceable ControlledParts.HeartControl
            heart,
          redeclare ControlledParts.SystemicControl
            systemicCirculation(venaCava(volume_start=0.0022952,
                ZeroPressureVolume=0.002), aorta(volume_start=0.0008841,
                ZeroPressureVolume=0.00076)),
          redeclare replaceable Model.Control.BloodVolumeControl
            longTermControl,
          redeclare ControlledParts.Baroreflex
            shortTermControl);
      /*    redeclare CardiovascularDevel.Model.Control.StenosisControl stenosisControl(
      venacavastenosis(InitialElastance=786602.0857485, FinalElastance=786602.0857485),
      AVBackFlowConductance(k(displayUnit="ml/(mmHg.s)") = 7.5006157584566e-14),
      aorticstenosis(InitialResistance=2399802.97347, FinalResistance=2399802.97347)),*/

      end HemodynamicsSmithControl;

      package ControlledParts
        extends Modelica.Icons.UtilitiesPackage;

        model PulmonaryControl
          extends Parts.Pulmonary(pulmonaryArteries(volume_start=5.904e-05,
                ZeroPressureVolume=2e-05), pulmonaryVeins(volume_start=
                  0.0015269, ZeroPressureVolume=0.0007));
          extends Controlled.Pulmonary;
          Modelica.Blocks.Math.Add add;
        equation
          connect(pulmonaryArteries.volume, add.u2);
          connect(pulmonaryVeins.volume, add.u1);
          connect(add.y, busConnector.pulmonaryBloodVolume);
        end PulmonaryControl;

        model SystemicControl
          extends Parts.Systemic(venaCava(
                useComplianceInput=true), Rsys(useConductanceInput=true));
          extends Controlled.Systemic;
          Model.Control.AortaPressureMeasurement
            aortaPressureMeasurement;
          Modelica.Blocks.Math.Add add;
        equation
          connect(venaCava.compliance, busConnector.venacavacompliance);
          connect(Rsys.cond, busConnector.peripheralconductance);
          connect(Rsys.q_in, aortaPressureMeasurement.q_in);
          connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure);
          connect(aorta.volume, add.u1);
          connect(add.u2, venaCava.volume);
          connect(add.y, busConnector.systemicBloodVolume);
        end SystemicControl;

        model HeartControl

          extends Controlled.Heart;
          extends Parts.Heart(redeclare Types.Constants.FrequencyControl
                                               HR,
            redeclare VIVolume
              ventricularInteraction(rightVentricle(drive(useEs_extInput=true))),
            aorticValve(useLimitationInputs=false));
        equation
        //  connect(volume, busConnector.heartvolume);
          connect(HR.c, busConnector.heartrate);
          connect(ventricularInteraction.busConnector, busConnector);
          connect(ventricularInteraction.volume, busConnector.heartBloodVolume);
        end HeartControl;

        model VIVolume
          extends Parts.VentricularInteraction(
              rightVentricle(drive(useEs_extInput=true)), leftVentricle(drive(
                  useEs_extInput=true)));
          Physiolibrary.Types.RealIO.VolumeOutput volume;
          Modelica.Blocks.Math.Add add;
          Physiolibrary.Types.BusConnector busConnector;
        equation
          connect(busConnector.rvcompliance,rightVentricle.drive.Es_ext);
          connect(busConnector.lvcompliance,leftVentricle.drive.Es_ext);
          connect(rightVentricle.volume, add.u2);
          connect(leftVentricle.volume, add.u1);
          connect(add.y, volume);
        end VIVolume;

        model Baroreflex
          extends Model.Control.Baroreflex(baroreceptor(
              PAOmedia=12486.574838127,
              HR0Param=1.2,
              EV0right=77993596.637775,
              EV0left=383835153.36779,
              EV0venacava=1.2713543710584e-06,
              RS0=145054757.50752));
        end Baroreflex;

        model AorticValveStenosisScenario
          extends Model.Scenario.StenosisControl(venacavastenosis(
                InitialElastance=786602.0857485, FinalElastance=786602.0857485),
            aorticstenosis(
              duration=60,
              InitialResistance(displayUnit="(mmHg.s)/ml") = 2399802.97347,
              FinalResistance(displayUnit="(mmHg.s)/ml") = 10665790.9932),
            mitralvalvestenosis(InitialResistance=2106493.721157,
                FinalResistance=2106493.721157),
            AVgon(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12),
            mvgoff(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12));

        end AorticValveStenosisScenario;

        model AorticValveHeartControl
          extends HeartControl(aorticValve(useLimitationInputs=true));
        equation
          connect(aorticValve.Goff, busConnector.avbackflowconductance);
          connect(aorticValve.Gon, busConnector.avoutflowresistance);
        end AorticValveHeartControl;
      end ControlledParts;

      model StenosisAorticValve
        extends HemodynamicsSmithControl(redeclare
          ControlledParts.AorticValveHeartControl   heart, redeclare
          ControlledParts.AorticValveStenosisScenario   scenarioControl(AVgon(k(
                  displayUnit="ml/(mmHg.s)"))));
      end StenosisAorticValve;

      model Bleeding
        extends HemodynamicsSmithControl(redeclare
          Scenario.BleedingTransfusionScenario   scenarioControl(
            Tbd=300,
            BloodLoss=0.0005,
            Tts=600,
            Ttd=600,
            BloodTrans=0), longTermControl(redeclare
            Control.BloodVolume.RBCBleeding   redBloodCells, redeclare
            Control.BloodVolume.PlasmaBleeding   plasma));
      end Bleeding;
    end Smith2004;

    package Control "models of control mechanism and additional components"
      extends Modelica.Icons.VariantsPackage;

      package EPO_Physiolibrary = Physiolibrary(Types(
        redeclare type Concentration = Real(quantity="EPO Concentration",unit="1/m3",displayUnit="iu/l"),
        redeclare type AmountOfSubstance = Real(quantity="EPO AmountOfSubstance",unit="1",displayUnit="iu"),
        redeclare type MolarFlowRate = Real(quantity="EPO Flow Rate",unit="1/s",displayUnit="iu/min"),
        redeclare type MolarEnergy = Real(quantity="EPO Internal Energy",unit="J",displayUnit="cal/iu")));

      model Baroreflex
        extends Cardiovascular.Controlled.ShortTermControl;
      /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-28,14},{12,54}}), iconTransformation(
          extent={{60,70},{100,110}})));*/
        Baroreceptor baroreceptor(activationDelay(displayUnit="s"));
      equation
        connect(baroreceptor.RS, busConnector.peripheralconductance);
        connect(baroreceptor.evright, busConnector.rvcompliance);
        connect(baroreceptor.evleft, busConnector.lvcompliance);
        connect(baroreceptor.HR, busConnector.heartrate);
        connect(baroreceptor.PAo, busConnector.aortameanpressure);
        connect(baroreceptor.evenacava, busConnector.venacavacompliance);
      end Baroreflex;

      model Baroreceptor
        Modelica.Blocks.Continuous.TransferFunction H1(a = {15, 1}, b = {1});
        Modelica.Blocks.Continuous.TransferFunction H2(a = {15, 1}, b = {0.048});
        Modelica.Blocks.Continuous.TransferFunction H3(a = {15, 1}, b = {0.154});
        // from orign.mo(a={30,1}, b={0.194});
        Modelica.Blocks.Continuous.TransferFunction H4(a = {2, 1}, b = {0.1});
        Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax = 0.1, uMin = -0.1);
        parameter Physiolibrary.Types.Pressure PAOmedia = 13465.561128915;
        parameter Physiolibrary.Types.Frequency HR0Param = 1.3333333333333;
        parameter Boolean useHRInput = false
        "=true, if external HR value is used";
        Physiolibrary.Types.RealIO.FrequencyInput cond(start = HR0Param) = HR0 if useHRInput;
        Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta";
        Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block";
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright;
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft;
        Physiolibrary.Types.HydraulicElastance evrightref;
        Physiolibrary.Types.HydraulicElastance evleftref;
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava;
        Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS;
        parameter Physiolibrary.Types.HydraulicElastance EV0right = 103991462.1837, EV0left = 106657909.932;
        parameter Physiolibrary.Types.HydraulicCompliance EV0venacava = 1.8751539396141e-006;
        parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit = "(mmHg.s)/ml") = 81793284.67910001;
        parameter Physiolibrary.Types.Time activationDelay = 15;
        //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
        Physiolibrary.Types.Frequency HR0;
      //  parameter Physiolibrary.Types.HydraulicCompliance ECV0;
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
        //recount to SI Hz
        H2.u = deadZone.y;
        evright = 1 / (EV0right + H2.y * 1000000.0 * 133.322387415);
        evrightref = 1 / evright;
        //recount to SI
        evleft = 1 / (EV0left + H2.y * 1000000.0 * 133.322387415);
        evleftref = 1 / evleft;
        //recount to SI
        H3.u = deadZone.y;
        evenacava = EV0venacava+H3.y * 1e-006 / 133.322387415;
        H4.u = deadZone.y;
        RS = 1 / (RS0 + H4.y * 1000000.0 * 133.322387415);
        //recount to conductance
      end Baroreceptor;

      package BloodVolume
        extends Modelica.Icons.UtilitiesPackage;

        model KidneyPO2Estimate
          Physiolibrary.Types.RealIO.PressureOutput pressure;
        parameter Real MaxPo2 = 60;
          Physiolibrary.Types.RealIO.FractionInput hematocrit;
          Physiolibrary.Blocks.Factors.Spline spline(
                       Yscale=101325/760, data=[0,0,0; 0.4,35,1; 0.6,60,0]);
          Physiolibrary.Types.Constants.OneConst one;
        equation
          connect(hematocrit, spline.u);
          connect(spline.y, pressure);
          connect(one.y, spline.yBase);
        end KidneyPO2Estimate;

        model Erythropoetin
          EPO_Physiolibrary.Chemical.Components.Substance erythropoetin(useNormalizedVolume = false,
              solute_start(displayUnit="mol") = 79.5);
          EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePump secretion(useSoluteFlowInput = true);
          EPO_Physiolibrary.Chemical.Sensors.ConcentrationMeasure concentrationMeasure;
          EPO_Physiolibrary.Types.RealIO.ConcentrationOutput concentration;
          Physiolibrary.Types.RealIO.PressureInput kidney_po2;
          Physiolibrary.Blocks.Factors.Spline PO2Effect(data = {{0.0, 4.0, 0}, {35.0, 0.0, -0.14}, {60.0, -1.0, 0}}, Xscale = 101325 / 760);
          Physiolibrary.Blocks.Math.Power pow;
          Physiolibrary.Blocks.Factors.Normalization CounEffect;
          Physiolibrary.Blocks.Factors.Normalization FunctionEffect;
          Physiolibrary.Blocks.Factors.Normalization PO2Effect1;
          Physiolibrary.Types.Constants.FractionConst Kidney_Nefron_Count_TotalxNormal(k=1);
          Physiolibrary.Types.Constants.FractionConst KidneyFunctionEffect(k=1);
          Physiolibrary.Types.RealIO.VolumeInput ecf_volume;
          Modelica.Blocks.Math.Gain VODIST(k = 0.4);
          Physiolibrary.Types.Constants.FractionConst hormoneFlowFraction(k=1);
          Cardiovascular.Model.Control.EPO_Physiolibrary.Types.Constants.MolarFlowRateConst
            molarFlowRate(k(displayUnit="mol/min") = 0.011166666666667);
          EPO_Physiolibrary.Chemical.Sources.UnlimitedSolutePumpOut
                                                      clearance(
              useSoluteFlowInput=true);
          Modelica.Blocks.Math.Gain K(k(unit="1/s")=0.00555/60);
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
          parameter Physiolibrary.Types.VolumeFlowRate Kud = 4.6666666666667e-08; //dehydratation
          parameter Physiolibrary.Types.VolumeFlowRate Kuo = 3.4666666666667e-07; //overhydratation
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
          Physiolibrary.Population.Sources.Growth erythropoiesis(useChangeInput=
               true);
          Physiolibrary.Population.Sources.Growth transfusion;
          Physiolibrary.Population.Components.Mortality degradation(LifeTime(
                displayUnit="d") = 10368000);
          Physiolibrary.Population.Sources.Loss hemorrhage;
        Physiolibrary.Types.Constants.PopulationChangeConst RBCBaseSecretionRate(
            k=1.16e6) "13.7 ml/day (12e12 cells == 2.4 L)";
          Physiolibrary.Blocks.Factors.SplineLag      EPOEffect(
            HalfTime=3*86400*Modelica.Math.log(2),
            data={{0.0,0.0,0},{1.3,1.0,1.0},{4.0,4.0,0}},
            stateName="[EPO]Delay.Effect",
          UsePositiveLog10=true,
          Xscale=1e3) "20 miu/ml = 20e3 iu/m3";
          Physiolibrary.Types.BusConnector busConnector;
          Modelica.Blocks.Math.Gain RBCVol(k(unit="m3")=2.4e-3/12e12)
          "12e12 cells == 2.4 L";
          Modelica.Blocks.Math.Gain InitialPopulation(k=12e12/2.4e-3)
          "12e12 cells == 2.4 L";
        initial algorithm
        equation
          connect(erythropoiesis.port_b, RBC.port);
          connect(transfusion.port_b, RBC.port);
          connect(degradation.port_a, RBC.port);
          connect(hemorrhage.port_a, RBC.port);
          connect(erythropoiesis.populationChange, EPOEffect.y);
          connect(RBCBaseSecretionRate.y, EPOEffect.yBase);
          connect(EPOEffect.u, erythropoetin.concentration);
          connect(erythropoetin.kidney_po2, busConnector.Kidney_PO2);
          connect(erythropoetin.ecf_volume, busConnector.ecfvolume);
          connect(RBC.population, RBCVol.u);
          connect(RBCVol.y, busConnector.RBCVolume);
          connect(InitialPopulation.u, busConnector.initialrbcvolume);
        end RedBloodCells2;

        model Plasma2
          Physiolibrary.Osmotic.Sources.SolventInflux transfusion(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventOutflux hemorrhage(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventInflux IVDrip(useSolutionFlowInput = false);
          Physiolibrary.Osmotic.Sources.SolventInflux FoodAndDrink(useSolutionFlowInput = false,
              SolutionFlow(displayUnit="l/day") = 2.4305555555556e-08);
          Physiolibrary.Osmotic.Sources.SolventInflux Metabolism(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 3.4722222222222e-09);
          Physiolibrary.Osmotic.Sources.SolventOutflux SkinAndLungsLoss(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.0416666666667e-08);
          Physiolibrary.Osmotic.Sources.SolventOutflux Urine(SolutionFlow(displayUnit = "ml/day") = 1.7361111111111e-08, useSolutionFlowInput = true);
          Physiolibrary.Osmotic.Sources.SolventOutflux Feces(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.1574074074074e-09);
          Physiolibrary.Osmotic.Components.Membrane capillaryMembrane(
            HydraulicPressureIn(displayUnit="mmHg") = 2359.8062572455,
            cond(displayUnit="m3/(Pa.s)") = 3.7265559293265e-11,
            HydraulicPressureOut=-549.2882361498,
            T(displayUnit="K"));
          Physiolibrary.Osmotic.Components.OsmoticCell interstitialFluid(
            NumberOfMembraneTypes=2,
            volume_start=0.01175,
            ImpermeableSolutes={0.0061,3.1});
          Modelica.Blocks.Math.Add add1;
          KidneyFluidBalance kidneyFluidBalance(
            Kud(displayUnit="ml/min"),
            Kuo(displayUnit="m3/s"),
            Jun(displayUnit="m3/s"));
          Physiolibrary.Osmotic.Components.SolventFlux lymphatic(SolutionFlow(
                displayUnit="l/day") = 3.45e-08);
          Physiolibrary.Types.BusConnector busConnector;
          Physiolibrary.Osmotic.Components.OsmoticCell
                                                plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit,
            NumberOfMembraneTypes=2,
            ImpermeableSolutes(displayUnit="mmol") = {0.00356,0.82});
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
          connect(kidneyFluidBalance.plasmaticVolume, busConnector.plasmaVolume);
          connect(plasma.volume, busConnector.plasmaVolume);
          connect(add1.u2, plasma.volume);
          connect(add1.y, busConnector.ecfvolume);
          connect(Metabolism.q_out, lymphatic.q_in);
          connect(SkinAndLungsLoss.q_in, lymphatic.q_in);
        end Plasma2;

        model VolumeRefill2
        "injects/removes volume if the pressure on connector is > 0"
          DesiredFlowrate                             desiredFlowrate(flowtime(
                displayUnit="s") = 1);
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b;
          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeRefill(useSolutionFlowInput = true);
          Modelica.Blocks.Logical.Switch switch1;
          Physiolibrary.Types.Constants.VolumeFlowRateConst zeroRefill(k(
                displayUnit="l/min") = 0);
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure;
          Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
               0);
          Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
                displayUnit="ml/(mmHg.s)") = 7.5006157584566e-08);
          Physiolibrary.Types.BusConnector busConnector;
        equation
        /*  if desiredFlowrate.volumeflowrate < 0 then
    volumeRefill.solutionFlow = -max(0, min(-desiredFlowrate.volumeflowrate, -maxflowrate));
  else
    volumeRefill.solutionFlow = desiredFlowrate.volumeflowrate;
  end if;*/
          connect(switch1.y, volumeRefill.solutionFlow);
          connect(desiredFlowrate.volumeflowrate, switch1.u1);
          connect(zeroRefill.y, switch1.u3);
          connect(pressureMeasure.pressure, greaterThreshold.u);
          connect(greaterThreshold.y, switch1.u2);
          connect(port_b, conductor.q_out);
          connect(volumeRefill.q_out, conductor.q_in);
          connect(desiredFlowrate.volume, busConnector.bloodVolume);
          connect(desiredFlowrate.desiredVolume, busConnector.desiredBloodVolume);
          connect(pressureMeasure.q_in, conductor.q_out);
        end VolumeRefill2;

        model BloodProperties
          Modelica.Blocks.Math.Add DesiredBloodVolume;
          KidneyPO2Estimate kidneyPO2Estimate(spline(data=[0.3,0,0; 0.4,36.3,1;
                  0.5,60,0]));
          Physiolibrary.Types.BusConnector busConnector;
          Modelica.Blocks.Math.Division hematocrit;
          Modelica.Blocks.Math.Add3 BloodVolume;
          Physiolibrary.Types.Constants.FractionConst initialHematocrit(k=0.4);
          Modelica.Blocks.Math.Product InitialRBCVolume;
          Modelica.Blocks.Math.Add InitialPlasmaVolume(k2=-1);
        equation
          connect(DesiredBloodVolume.u2, busConnector.RBCVolume);
          connect(DesiredBloodVolume.u1, busConnector.plasmaVolume);
          connect(DesiredBloodVolume.y, busConnector.desiredBloodVolume);
          connect(hematocrit.u2, DesiredBloodVolume.y);
          connect(hematocrit.u1, DesiredBloodVolume.u2);
          connect(hematocrit.y, busConnector.hematocrit);
          connect(hematocrit.y, kidneyPO2Estimate.hematocrit);
          connect(kidneyPO2Estimate.pressure, busConnector.Kidney_PO2);
          connect(BloodVolume.u3, busConnector.pulmonaryBloodVolume);
          connect(BloodVolume.u2, busConnector.systemicBloodVolume);
          connect(BloodVolume.u1, busConnector.heartBloodVolume);
          connect(BloodVolume.y, busConnector.bloodVolume);
          connect(initialHematocrit.y, InitialRBCVolume.u1);
          connect(BloodVolume.y, InitialRBCVolume.u2);
          connect(InitialRBCVolume.y, busConnector.initialrbcvolume);
          connect(InitialRBCVolume.y, InitialPlasmaVolume.u2);
          connect(BloodVolume.y, InitialPlasmaVolume.u1);
          connect(InitialPlasmaVolume.y, busConnector.initialPlasmaVolume);
        end BloodProperties;

        model DesiredFlowrate "control total blood volume"
          parameter Physiolibrary.Types.Time flowtime = 0.1;
          parameter Boolean enabled = true;
          Physiolibrary.Types.RealIO.VolumeInput volume;
          Physiolibrary.Types.RealIO.VolumeInput desiredVolume;
          Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate;
        equation
          volumeflowrate = if enabled then (desiredVolume - volume) / flowtime else 0;
        end DesiredFlowrate;

        model PlasmaBleeding
          extends Plasma2(
            hemorrhage(useSolutionFlowInput=true),
            transfusion(useSolutionFlowInput=true),
            plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit));
        equation
          connect(hemorrhage.solutionFlow, busConnector.plasmableed);
          connect(transfusion.solutionFlow, busConnector.plasmatransfusion);
        end PlasmaBleeding;

        model RBCBleeding
          extends RedBloodCells2(
            transfusion(useChangeInput=true),
            hemorrhage(useChangeInput=true),
            RBC(Simulation=Physiolibrary.Types.SimulationType.NoInit));
        equation
          connect(transfusion.populationChange, busConnector.RBCtransfusion);
          connect(hemorrhage.populationChange, busConnector.RBCbleed);
        end RBCBleeding;
      end BloodVolume;

      model BloodVolumeControl
        extends Cardiovascular.Controlled.LongTermControl;
      /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-40,2},{0,42}}), iconTransformation(
          extent={{-38,4},{2,44}})));*/
        replaceable BloodVolume.Plasma2
                            plasma(plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit))
          constrainedby BloodVolume.Plasma2;
                                   //(plasma(volume_start=bloodProperties.BloodVolume.y))
        replaceable BloodVolume.RedBloodCells2
                                   redBloodCells(RBC(population_start=2, Simulation=
                Physiolibrary.Types.SimulationType.NoInit)) constrainedby
        BloodVolume.RedBloodCells2;
        BloodVolume.BloodProperties bloodProperties;
      initial algorithm
        plasma.plasma.state:=bloodProperties.InitialPlasmaVolume.y;
        redBloodCells.RBC.state:=redBloodCells.InitialPopulation.y;

      equation
        connect(plasma.busConnector, busConnector);
        connect(redBloodCells.busConnector, busConnector);
        connect(bloodProperties.busConnector, busConnector);
      end BloodVolumeControl;

      model MeanAortaPressureMeasurement
        extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
        import Physiolibrary.Types.RealIO.*;
        import Physiolibrary.Types.*;
        discrete PressureOutput Pmean(start=11300)
        "Mean pressure during heart cycle";
        Real SumPressure(start = 6300) "sum of pressure of cardiac cycle";
        discrete Boolean b(start = false) "beat signal";
        Time T0(start = 0) "start of cardiac cycle ";
        discrete Time HP(start = 0.75) "length of cardiac cycle";
      //protected
      equation
        b = der(q_in.pressure) > 0;
        der(SumPressure) = q_in.pressure;
       when {edge(b)} then
          T0 =   time "initial time of current cardiac cycle";
          HP =   if pre(T0) > 0 then time - pre(T0) else 0.75;
          Pmean =  SumPressure / HP "mean pressure";
          reinit(SumPressure,  0) "reinitialisation of sum pressure";
                   //if (Pmean2>Pd) then Pmean1 else Pmean2;
       end when;
      end MeanAortaPressureMeasurement;

      model BloodFlowMeasurement
      "measures flow, diastolic, systolic and mean pressure"
        extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
        import Physiolibrary.Types.RealIO.*;
        import Physiolibrary.Types.*;
        PressureOutput Ps "Systolic pressure during heart cycle";
        PressureOutput Pd "Diastolic pressure during heart cycle";
        PressureOutput Pmean "Mean pressure during heart cycle";
        Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume";
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output";
        Physiolibrary.Types.Volume Volume(start = 0)
        "sum of volume through cyrdiac cycle";
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        Pressure Pmin(start = 133000);
        Pressure Pmax(start = 0);
        discrete Time T0(start = 0) "start of cardiac cycle ";
        discrete Time HP "length of cardiac cycle";
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
          Pmean = if pre(HP) > 0 then SumPressure / pre(HP) else pre(Pd) * 2 / 3 + pre(Ps) * 1 / 3
          "mean pressure";
          SV = Volume
          "systolic volume is equal of total volume passed through this block";
          CO = SV / HP
          "cardiac output calculation from systolic volume and heart period";
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
        import Physiolibrary.Types.RealIO.*;
        import Physiolibrary.Types.*;
        discrete PressureOutput Ps "Systolic pressure during heart cycle";
        discrete PressureOutput Pd "Diastolic pressure during heart cycle";
        discrete PressureOutput Pmean "Mean pressure during heart cycle";
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        Pressure Pmax,Pmin;
        discrete Boolean b(start = false) "beat signal";
        Time T0(start = 0) "start of cardiac cycle ";
        discrete Time HP(start = 1) "length of cardiac cycle";
      //protected
        Pressure PmeanA "approximation of mean pressure";
        Pressure Pmean2 "approximation of mean pressure";
      /*initial algorithm

  Ps := q_in.pressure;
  Pd := q_in.pressure;
  Pmean:=q_in.pressure;*/
      equation
        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        PmeanA =  (2/3)*Pmin+(1/3)*Pmax;
        b = der(q_in.pressure) > 0;
        der(SumPressure) = q_in.pressure;
       when {initial(),edge(b)} then
          T0 =   time "initial time of current cardiac cycle";
          HP =   if pre(T0) > 0 then time - pre(T0) else 1;
          Ps =   pre(Pmax)
          "systolic pressure = maximum pressure during cardiac cycle";
          Pd =   pre(Pmin)
          "diastolic pressure=minimal pressure during cardiac cycle";
          Pmean2 =  pre(SumPressure) / pre(HP) "mean pressure";
          Pmean = if (Pmean2<Pd) then max(Pd,PmeanA) else Pmean2;
      //    Pmean =  max(Pd,(SumPressure / pre(HP))) "mean pressure";
                   //if ((SumPressure / pre(HP))<Pd) then PmeanA else
          reinit(SumPressure,  0) "reinitialisation of sum pressure";
                   //if (Pmean2>Pd) then Pmean1 else Pmean2;
          reinit(Pmax,  q_in.pressure) "reinitialisation of maximal pressure";
          reinit(Pmin,  q_in.pressure) "reinitialisation minimal pressure";
       end when;
      end AortaPressureMeasurement;
    end Control;

    package Scenario "models of various scenarios"
        extends Modelica.Icons.VariantsPackage;

      partial model StenosisControl
        extends Controlled.ScenarioControl;
      /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-28,14},{12,54}}), iconTransformation(
          extent={{-28,14},{12,54}})));*/
        Stenosis.StenosisElastance venacavastenosis;
        Stenosis.StenosisResistance aorticstenosis
        "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater";
        Physiolibrary.Types.Constants.HydraulicConductanceConst AVgon(k=0);
        Stenosis.StenosisResistance mitralvalvestenosis(InitialResistance(displayUnit=
               "(mmHg.s)/ml"), FinalResistance(displayUnit="(mmHg.s)/ml"))
        "Aorctic stenosis - valve diameter goes to 1/2 =resistance 1/2^4 greater";
        Physiolibrary.Types.Constants.HydraulicConductanceConst mvgoff(k=0);
      equation
        connect(venacavastenosis.hydrauliccompliance, busConnector.venacavacompliance0);
        connect(aorticstenosis.conductance, busConnector.avoutflowresistance);
        connect(mitralvalvestenosis.conductance, busConnector.mv_gon);
        connect(mvgoff.y, busConnector.mv_goff);
        connect(AVgon.y, busConnector.avbackflowconductance);
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
        import Physiolibrary.Types.*;
        //after 1 minute, 5minutes bleeding
        parameter Time Tbs=60,Tbd=5*60;
        parameter Volume BloodLoss=0.001;
        //after 20 minutes, transfussion for 10 minutes
        parameter Time Tts=20*60,Ttd=10*60;
        parameter Volume BloodTrans=0.001;

        BleedingTransfusionBurkhoffInterface bleedingTransfusionBurkhoffInterface;
        BleedingTransfusionRate bleedingTransfusionRate(
          Tbs=Tbs,
          Tbd=Tbd,
          BloodLoss=BloodLoss,
          Tts=Tts,
          Ttd=Ttd,
          BloodTrans=BloodTrans);
      equation

        connect(bleedingTransfusionBurkhoffInterface.hematocrit, busConnector.hematocrit);
        connect(bleedingTransfusionBurkhoffInterface.RBCbleed, busConnector.RBCbleed);
        connect(bleedingTransfusionBurkhoffInterface.RBCtransfusion, busConnector.RBCtransfusion);
        connect(bleedingTransfusionBurkhoffInterface.plasmableed, busConnector.plasmableed);
        connect(bleedingTransfusionBurkhoffInterface.plasmatransfusion, busConnector.plasmatransfusion);
        connect(bleedingTransfusionRate.bleedrate,
          bleedingTransfusionBurkhoffInterface.bleedrate);
        connect(bleedingTransfusionRate.transrate,
          bleedingTransfusionBurkhoffInterface.transrate);
      end BleedingTransfusionScenario;

      model BleedingTransfusionBurkhoffInterface
        //Real RBCbleed,plasmableed,RBCtransfusion,plasmatransfusion,hematocrit;

        Physiolibrary.Types.RealIO.VolumeFlowRateInput bleedrate;
        Physiolibrary.Types.RealIO.VolumeFlowRateInput transrate;

        Modelica.Blocks.Interfaces.RealInput hematocrit;
        Modelica.Blocks.Interfaces.RealOutput RBCbleed;
        Modelica.Blocks.Interfaces.RealOutput RBCtransfusion;
        Modelica.Blocks.Interfaces.RealOutput plasmableed;
        Modelica.Blocks.Interfaces.RealOutput plasmatransfusion;
      equation
       RBCbleed=bleedrate*hematocrit*12e12/2.4e-3;
       plasmableed=bleedrate*(1-hematocrit);
       RBCtransfusion=transrate*0.4*12e12/2.4e-3;
       plasmatransfusion=transrate*(1-0.4);
      /* connect(busConnector.hematocrit,hematocrit);
 connect(busConnector.RBCbleed,RBCbleed);
 connect(busConnector.plasmableed,plasmableed);
 connect(busConnector.RBCtransfusion,RBCtransfusion);
 connect(busConnector.plasmatransfusion,plasmatransfusion);
*/
      end BleedingTransfusionBurkhoffInterface;

      model BleedingTransfusionRate
        import Physiolibrary.Types.*;
        //after 1 minute, 5minutes bleeding
        parameter Time Tbs=60,Tbd=5*60;
        parameter Volume BloodLoss=0.001;
        //after 20 minutes, transfussion for 10 minutes
        parameter Time Tts=20*60,Ttd=10*60;
        parameter Volume BloodTrans=0.001;

        Physiolibrary.Types.RealIO.VolumeFlowRateOutput bleedrate;
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput transrate;
      equation
        if time>Tbs and time<Tbs+Tbd then
          bleedrate=BloodLoss/Tbd;
        else
          bleedrate=0;
        end if;
        if time>Tts and time<Tts+Ttd then
            transrate=BloodTrans/Ttd;
        else
            transrate=0;
        end if;
      end BleedingTransfusionRate;
    end Scenario;
  end Model;

  package Types

    package Constants

      block FrequencyControl "External signal of type Frequency"
        Physiolibrary.Types.RealIO.FrequencyOutput y
        "HydraulicCompliance constant";
        Physiolibrary.Types.RealIO.FrequencyInput c;
        parameter Physiolibrary.Types.Frequency k;
        //ignored for this component
        //TODO add switch between constant default signal and input control signal
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
      Model.Burkhoff.HemodynamicsBurkhoffBVControl
        hemodynamicsBurkhoffBVControl;
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
model Cardiovascular_Test_AllModels
 extends Cardiovascular.Test.AllModels;
  annotation(experiment(
    StopTime=1,
    __Dymola_NumberOfIntervals=500,
    Tolerance=0.0001,
    __Dymola_Algorithm="dassl"));
end Cardiovascular_Test_AllModels;
