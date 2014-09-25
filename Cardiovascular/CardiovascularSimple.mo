within ;
package CardiovascularSimple
  package Parts
    model HeartPump
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-142,-62},{-122,-42}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-144,-66},{-124,-46}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
    equation
      inflow.q + outflow.q =0;
      inflow.q = StarlingSlope * inflow.pressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Polygon(
              points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{24,24},{34,40},
                  {30,70},{26,82},{-22,100},{-26,42},{-26,40},{-30,-6},{-30,-10},
                  {-6,-40},{52,-74},{32,-34}},
              lineColor={0,0,127},
              smooth=Smooth.Bezier,
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-60},{102,-98}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end HeartPump;

    model PulsatileHeartPump
      import CardiovascularSimple;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-64,0},{-44,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{42,2},{62,22}}),
            iconTransformation(extent={{42,2},{62,22}})));
      CardiovascularSimple.Parts.pulses pulses(QP(displayUnit="m3/s")=
          0.000374)
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Physiolibrary.Hydraulic.Components.Pump pump(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-14,2},{6,22}})));
      parameter Physiolibrary.Types.HydraulicConductance StarlingSlope;
    equation
      connect(pump.q_out, outflow) annotation (Line(
          points={{6,12},{52,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pump.solutionFlow, pulses.volumeflowrate) annotation (Line(
          points={{-4,16},{-4,40},{-21,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, pump.q_in) annotation (Line(
          points={{-54,10},{-34,10},{-34,12},{-14,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inflow, inflow) annotation (Line(
          points={{-54,10},{-54,10}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Polygon(
              points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{24,24},{34,40},
                  {30,70},{26,82},{-22,100},{-26,42},{-26,40},{-30,-6},{-30,-10},
                  {-6,-40},{52,-74},{32,-34}},
              lineColor={0,0,127},
              smooth=Smooth.Bezier,
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-60},{102,-98}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end PulsatileHeartPump;

    model pulses
      import Physiolibrary.Types.*;
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate annotation (
          Placement(transformation(extent={{80,-10},{100,10}}), iconTransformation(
              extent={{80,-10},{100,10}})));
      discrete Time T0 "begining of cardiac cycle";
      Boolean b(start=false);
      discrete Time HP "duration of cardiac cycle";
      parameter Frequency HR = 1.2;
      Time tc "relative time in carciac cycle";
      parameter Time TD1=0.07 "relative time of start of systole";
      discrete Time TD2 "relative time of end of systole";
      parameter VolumeFlowRate QP = 0.000424 "peak volume flowrate";
    equation
      b = time - pre(T0) >=pre(HP) "true if new cardiac cycle begins";
      when {initial(),b} then
        T0 = time "set begining of cardiac cycle";
        HP=1/HR "update length of carciac cycle";
        TD2 = TD1+(2/5)*HP "compute end time of systole";
      end when;
      tc = time-T0 "relative time in carciac cycle";
      volumeflowrate =
        if tc<TD1 then 0 else
        if tc<TD2 then sin((tc-TD1)/(TD2-TD1)*Modelica.Constants.pi)*QP else
        0 "zero before and after systole, otherwise sin up to peak flow";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-80,80},{80,-80}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid), Line(
              points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,2},{-20,
                  0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},{50,0},{74,
                  0}},
              color={0,0,255},
              smooth=Smooth.Bezier)}));
    end pulses;
  end Parts;

  package Models
    model NonPulsatileCirculation
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.00037)
        annotation (Placement(transformation(extent={{-40,28},{-20,48}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CAP(k=
            2.2576853432954e-08)
        annotation (Placement(transformation(extent={{-50,56},{-36,70}})));
      Physiolibrary.Types.Constants.VolumeConst V0AP(k=0.000327)
        annotation (Placement(transformation(extent={{-66,44},{-52,58}})));
      Physiolibrary.Hydraulic.Components.Conductor TotalPulmonaryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-2,28},{18,48}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RP(k(
            displayUnit="(mmHg.s)/ml") = 9332567.11905)
        annotation (Placement(transformation(extent={{-6,60},{6,70}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.0007)
        annotation (Placement(transformation(extent={{42,28},{62,48}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CVP(k=
            2.250184727537e-07)
        annotation (Placement(transformation(extent={{36,60},{50,74}})));
      Physiolibrary.Types.Constants.VolumeConst V0VP(k=0.000435)
        annotation (Placement(transformation(extent={{20,48},{34,62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel SystemicVeins(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.0039)
        annotation (Placement(transformation(extent={{-46,-70},{-26,-50}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CVS(k=
            1.5001231516913e-06)
        annotation (Placement(transformation(extent={{-52,-42},{-38,-28}})));
      Physiolibrary.Types.Constants.VolumeConst V0VS(k=0.002845)
        annotation (Placement(transformation(extent={{-74,-54},{-60,-40}})));
      Physiolibrary.Hydraulic.Components.Conductor TotalSystemicResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{16,-70},{-4,-50}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RT(k(
            displayUnit="(mmHg.s)/ml") = 133322387.415)
        annotation (Placement(transformation(extent={{-14,-50},{-4,-40}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel SystemicArteries(
        useV0Input=true,
        useComplianceInput=true,
        volume_start=0.00067)
        annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CAS(k=
            1.1250923637685e-08)
        annotation (Placement(transformation(extent={{30,-38},{44,-24}})));
      Physiolibrary.Types.Constants.VolumeConst V0AS(k=0.000529)
        annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
      replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit=
              "ml/(mmHg.s)") = 1.2503526469347e-07)
        annotation (Placement(transformation(extent={{-72,-10},{-48,16}})));
      replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit=
              "ml/(mmHg.s)") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{72,-10},{50,10}})));
    equation
      connect(CAP.y, PulmonaryArteries.compliance) annotation (Line(
          points={{-34.25,63},{-30,63},{-30,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0AP.y, PulmonaryArteries.zeroPressureVolume) annotation (Line(
          points={{-50.25,51},{-50.25,50.5},{-38,50.5},{-38,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RP.y, TotalPulmonaryResistance.cond) annotation (Line(
          points={{7.5,65},{8,65},{8,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CVP.y, PulmonaryVeins.compliance) annotation (Line(
          points={{51.75,67},{52,67},{52,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CVS.y, SystemicVeins.compliance) annotation (Line(
          points={{-36.25,-35},{-36,-35},{-36,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RT.y, TotalSystemicResistance.cond) annotation (Line(
          points={{-2.75,-45},{6,-45},{6,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CAS.y, SystemicArteries.compliance) annotation (Line(
          points={{45.75,-31},{46,-31},{46,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PulmonaryArteries.q_in, TotalPulmonaryResistance.q_in)
        annotation (Line(
          points={{-30,38},{-2,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in) annotation (
          Line(
          points={{18,38},{52,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeins.q_in, leftHeart.inflow) annotation (Line(
          points={{52,38},{72,38},{72,4.44089e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, SystemicArteries.q_in) annotation (Line(
          points={{55.28,1.2},{55.28,-60},{46,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicArteries.q_in, TotalSystemicResistance.q_in) annotation (
          Line(
          points={{46,-60},{16,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TotalSystemicResistance.q_out, SystemicVeins.q_in) annotation (
          Line(
          points={{-4,-60},{-36,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicVeins.q_in, rightHeart.inflow) annotation (Line(
          points={{-36,-60},{-78,-60},{-78,3},{-72,3}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeins.zeroPressureVolume, V0VP.y) annotation (Line(
          points={{44,46},{40,46},{40,55},{35.75,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVeins.zeroPressureVolume, V0VS.y) annotation (Line(
          points={{-44,-52},{-52,-52},{-52,-47},{-58.25,-47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0AS.y, SystemicArteries.zeroPressureVolume) annotation (Line(
          points={{29.75,-43},{38,-43},{38,-52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart.outflow, PulmonaryArteries.q_in) annotation (Line(
          points={{-53.76,4.56},{-53.76,38},{-30,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end NonPulsatileCirculation;

    model PulsatileCirculation
      extends CardiovascularSimple.Models.NonPulsatileCirculation(redeclare
          Parts.PulsatileHeartPump rightHeart, redeclare
          Parts.PulsatileHeartPump leftHeart);
    end PulsatileCirculation;
  end Models;

   package Examples
    model Windkessel_2element
      "Minimal circulation models driven by cardiac output"
       extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        volume_start(displayUnit="l") = 0.00095,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08)
        annotation (Placement(transformation(extent={{-14,38},{6,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          8.1006650191331e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={18,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.pulses pulses1(QP(displayUnit="m3/s") = 0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
    equation
      connect(heart.q_out, arteries.q_in) annotation (Line(
          points={{-30,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{18,24},{18,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{18,44},{18,48},{-4,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-74,90},{46,80}},
              lineColor={175,175,175},
              textString="2-element Windkessel model")}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=10));
    end Windkessel_2element;

    model TwoBaloon
       extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Components.ElasticVessel balloon1(
        volume_start=0.000501,
        ZeroPressureVolume=0.0005,
        Compliance=1.5001231516913e-08)
        annotation (Placement(transformation(extent={{-40,-12},{-20,8}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel balloon2(
        volume_start=0.002,
        ZeroPressureVolume=0.0005,
        Compliance=7.5006157584566e-09)
        annotation (Placement(transformation(extent={{24,-12},{44,8}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
            displayUnit="ml/(mmHg.s)") = 7.5006157584566e-09) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,-2})));
    equation
      connect(balloon1.q_in, conductor.q_in) annotation (Line(
          points={{-30,-2},{-10,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, balloon2.q_in) annotation (Line(
          points={{10,-2},{34,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end TwoBaloon;

    model Windkessel_3element
      "Minimal circulation models driven by cardiac output"
       extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        volume_start(displayUnit="l") = 0.00095,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          8.1081656348915e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.pulses pulses1(QP(displayUnit="m3/s") = 0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-6,50})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{50,24},{50,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-24,48},{-24,50},{-16,50}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,50},{16,50},{16,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{50,44},{50,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-74,90},{46,80}},
              lineColor={175,175,175},
              textString="3-element Windkessel model")}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=10));
    end Windkessel_3element;

    model Windkessel_4element
      "Minimal circulation models driven by cardiac output"
       extends Modelica.Icons.Example;
      Physiolibrary.Hydraulic.Sources.UnlimitedPump heart(useSolutionFlowInput=
            true)
        annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        ZeroPressureVolume(displayUnit="l") = 0.00085,
        Compliance(displayUnit="ml/mmHg") = 1.0500862061839e-08,
        volume_start(displayUnit="l") = 0.00097)
        annotation (Placement(transformation(extent={{16,38},{36,58}})));
      Physiolibrary.Hydraulic.Components.Conductor resistance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          8.1081656348915e-09) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={48,34})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume veins annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-40,20})));
      Parts.pulses pulses1(QP(displayUnit="m3/s") = 0.000424, HR=1.2)
        annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
      Physiolibrary.Hydraulic.Components.Conductor impedance(
          useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
          1.5001231516913e-06) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-6,48})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/ml") = 666611.937075, volumeFlow_start(displayUnit=
              "l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-16,56},{4,76}})));
    equation
      connect(resistance.q_out, veins.y) annotation (Line(
          points={{48,24},{48,20},{-30,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulses1.volumeflowrate, heart.solutionFlow) annotation (Line(
          points={{-45,68},{-40,68},{-40,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.q_out, impedance.q_in) annotation (Line(
          points={{-30,48},{-16,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(impedance.q_out, arteries.q_in) annotation (Line(
          points={{4,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.q_out, inertia.q_in) annotation (Line(
          points={{-30,48},{-26,48},{-26,66},{-16,66}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_out, arteries.q_in) annotation (Line(
          points={{4,66},{12,66},{12,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.q_in, arteries.q_in) annotation (Line(
          points={{48,44},{48,48},{26,48}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-74,90},{46,80}},
              lineColor={175,175,175},
              textString="4-element Windkessel model")}),
          Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        experiment(StopTime=10));
    end Windkessel_4element;
   end Examples;
  annotation (uses(
      Physiolibrary(version="2.2.0"),
      Cardiovascular(version="1"),
      Modelica(version="3.2.1")));
end CardiovascularSimple;
