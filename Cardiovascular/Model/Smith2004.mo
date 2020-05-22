within Cardiovascular.Model;
package Smith2004
    extends Modelica.Icons.ExamplesPackage;
  model HemodynamicsSmith_shallow
        extends Cardiovascular.Icons.Runnable_Shallow;
    import Physiolibrary.Hydraulic.Components.*;
  ElasticVesselElastance aorta(
      ZeroPressureVolume=0,
      volume_start=0.0001241,
      Elastance=92165766.41999) annotation (Placement(transformation(extent=
             {{-130,-30},{-110,-10}})));
  ElasticVesselElastance venaCava(
      ZeroPressureVolume=0,
      volume_start=0.0002952,
      Elastance(displayUnit="Pa/m3") = 786602.0857485)
      annotation (Placement(transformation(extent={{-130,24},{-110,44}})));
    IdealValveResistance aorticValve(Pknee=0, _Ron(displayUnit=
            "(mmHg.s)/ml") = 2399802.97347)
      annotation (Placement(transformation(extent={{-68,-30},{-88,-10}})));
    Resistor Rsys(Resistance(displayUnit="(mmHg.s)/ml") = 145054757.50752)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-120,6})));
    IdealValveResistance tricuspidValve(Pknee=0, _Ron(displayUnit=
            "(mmHg.s)/ml") = 3159740.5817355)
      annotation (Placement(transformation(extent={{-62,24},{-42,44}})));
    Inertia Lav(I(displayUnit="mmHg.s2/ml") = 16250.665802014,
        volumeFlow_start(displayUnit="m3/s") = -1.4e-8) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-44,-20})));
    Inertia Lpv(I(displayUnit="mmHg.s2/ml") = 19822.372560862,
        volumeFlow_start(displayUnit="m3/s") = -1.9e-9)
      annotation (Placement(transformation(extent={{32,24},{52,44}})));
    IdealValveResistance pulmonaryValve(Pknee=0, _Ron(displayUnit=
            "(mmHg.s)/ml") = 733273.1307825)
      annotation (Placement(transformation(extent={{62,24},{82,44}})));
      ElasticVesselElastance pulmonaryArteries(
      ZeroPressureVolume=0,
      useExternalPressureInput=true,
      volume_start=3.904e-05,
      Elastance(displayUnit="Pa/m3") = 49195960.956135)
      annotation (Placement(transformation(extent={{102,24},{122,44}})));
    Resistor Rpul(Resistance(displayUnit="(mmHg.s)/ml") = 20691634.526808)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={114,4})));
  ElasticVesselElastance pulmonaryVeins(
      ZeroPressureVolume=0,
      useExternalPressureInput=true,
      volume_start=0.0008269,
      Elastance(displayUnit="Pa/m3") = 973253.4281295)
      annotation (Placement(transformation(extent={{104,-30},{124,-10}})));
    IdealValveResistance mitralValve(Pknee=0, _Ron(displayUnit=
            "(mmHg.s)/ml") = 2106493.721157)
      annotation (Placement(transformation(extent={{52,-30},{32,-10}})));
    Inertia Ltc(I(displayUnit="mmHg.s2/ml") = 10678.18997523,
        volumeFlow_start(displayUnit="m3/s") = 0.0001372)
      annotation (Placement(transformation(extent={{-88,24},{-68,44}})));
    Inertia Lmt(I(displayUnit="mmHg.s2/ml") = 10261.557514558,
        volumeFlow_start(displayUnit="m3/s") = 0.0001141) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={70,-20})));
    Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
      annotation (Placement(transformation(extent={{-44,0},{-28,14}})));
    Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=-533.28954966)
      annotation (Placement(transformation(extent={{38,12},{50,20}})));
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
      Eslv=383941811.27772)
      annotation (Placement(transformation(extent={{-18,-12},{20,28}})));
  equation
    connect(aorta.q_in, Rsys.q_in) annotation (Line(
        points={{-120,-20},{-120,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rsys.q_out, venaCava.q_in) annotation (Line(
        points={{-120,16},{-120,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
        points={{82,34},{112,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
        points={{112,34},{114,34},{114,14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{114,-6},{114,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_out, aorta.q_in) annotation (Line(
        points={{-88,-20},{-120,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(venaCava.q_in, Ltc.q_in) annotation (Line(
        points={{-120,34},{-88,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, Lmt.q_in) annotation (Line(
        points={{114,-20},{80,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lav.q_out, aorticValve.q_in) annotation (Line(
        points={{-54,-20},{-68,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
        points={{-68,34},{-62,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
        points={{52,34},{62,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_in, Lmt.q_out) annotation (Line(
        points={{52,-20},{60,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricuspidValve.q_out, ventricularInteraction_flat.rvflow)
      annotation (Line(
        points={{-42,34},{0.62,34},{0.62,28}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lpv.q_in, ventricularInteraction_flat.rvflow) annotation (Line(
        points={{32,34},{0.62,34},{0.62,28}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ventricularInteraction_flat.lvflow, Lav.q_in) annotation (Line(
        points={{1,-12},{2,-12},{2,-20},{-34,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_out, Lav.q_in) annotation (Line(
        points={{32,-20},{-34,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(HR.y, ventricularInteraction_flat.HR) annotation (Line(
        points={{-26,7},{-22,7},{-22,8},{-14.2,8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, ventricularInteraction_flat.Pth)
      annotation (Line(
        points={{51.5,16},{58,16},{58,8},{16.58,8}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(pulmonaryArteries.externalPressure, IntraThoracicPressure.y)
      annotation (Line(
        points={{120,42},{120,46},{86,46},{86,16},{51.5,16}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(pulmonaryVeins.externalPressure, IntraThoracicPressure.y)
      annotation (Line(
        points={{122,-12},{122,16},{51.5,16}},
        color={0,190,190},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
              {160,100}}), graphics={Rectangle(extent={{-158,62},{-82,-34}},
            lineColor={28,108,200}),Rectangle(extent={{-84,54},{92,-46}},
            lineColor={28,108,200})}),
      Icon(coordinateSystem(extent={{-160,-100},{160,100}})),
      Documentation(info="<html>
<p>Cardiovascular model implemented per description of Smith et al.</p>
<p>[12] B. W. Smith, J. G. Chase, R. I. Nokes, G. M. Shaw, G. Wake, Minimal Haemodynamic System Model Including Ventricular Interaction and Valve Dynamics., Medical Engineering &AMP; Physics 26 (2) (2004) 131&ndash;139. doi:10.1016/j.medengphy.2003.10.001.</p>
<p>[13] CellML implementation at URL:  http://models.cellml.org/exposure/9d046663ba5cac5c8a61ac146183614b/smith_chase_nokes_shaw_wake_2004.cellml/view</p>
</html>"),
      experiment(StopTime=5));
  end HemodynamicsSmith_shallow;

  model HemodynamicsSmith
    extends Cardiovascular.System(
      redeclare Parts.Pulmonary pulmonaryCirculation,
      redeclare Parts.Heart heart,
      redeclare Parts.Systemic systemicCirculation);

      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000));
  end HemodynamicsSmith;

  package Parts
    extends Modelica.Icons.UtilitiesPackage;

    model VentricularInteraction_flat
        import Physiolibrary.Types.*;
      Volume Vsept(start=0.000002), Vrv(start=0.0001042), Vlv(start=
            0.0001042), Vperi;
      parameter Volume V0sept=0.000002, V0peri;
      Pressure Psept, Pperi;
      parameter Pressure Pi0sept, Pi0rv, Pi0lv, Pi0peri
        "peak isovolumic pressure";
      parameter HydraulicElastance Essept, Esrv, Eslv
        "elastance of systole";
      parameter Real A=1, B=80, CC=0.375;
        Time tm;
        discrete Time HP "heart period";
        discrete Time t0 "time of beginning of the cardiac cycle";
        discrete Time ts "duration of systole";
        parameter HydraulicLambda lambdas;
        parameter HydraulicLambda lambdarv;
        parameter HydraulicLambda lambdalv;
        parameter HydraulicLambda lambdaperi;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
         Placement(transformation(extent={{-48,20},{-28,40}}),
            iconTransformation(extent={{-12,90},{8,110}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
         Placement(transformation(extent={{-46,-22},{-26,-2}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));
      RealIO.FrequencyInput HR annotation (Placement(transformation(extent=
                {{-78,-40},{-38,0}}), iconTransformation(extent={{-100,-20},
                {-60,20}})));
      RealIO.PressureInput Pth annotation (Placement(transformation(extent=
                {{-6,24},{14,44}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={82,0})));
    equation
      //timing
      tm = time - pre(t0);
      when {initial(),tm >= pre(HP)} then
        HP = 1/HR;
        t0 = time;
        ts = 0.16 + 0.3*HP;
      end when;
      //  septum
      Psept = lvflow.pressure - rvflow.pressure;
      Psept = (Vsept - V0sept)*A*exp(-B*(tm - CC)^2)*Essept + (1 - A*exp(-B
        *(tm - CC)^2))*Pi0sept*(exp(lambdas*Vsept) - 1);
      // rightventricle
      rvflow.pressure - Pperi = (Vrv + Vsept)*A*exp(-B*(tm - CC)^2)*Esrv +
        (1 - A*exp(-B*(tm - CC)^2))*Pi0rv*(exp(lambdarv*(Vrv + Vsept)) - 1);
      der(Vrv) = rvflow.q;
      //leftventricle
      lvflow.pressure - Pperi = (Vlv - Vsept)*A*exp(-B*(tm - CC)^2)*Eslv +
        (1 - A*exp(-B*(tm - CC)^2))*Pi0lv*(exp(lambdalv*(Vlv - Vsept)) - 1);
      der(Vlv) = lvflow.q;
      //pericardium
      Vperi = Vrv + Vlv;
      Pperi = Pth + Pi0peri*(exp(lambdaperi*(Vperi - V0peri)) - 1);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
              extent={{102,-32},{76,-20}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Pth"),Text(
              extent={{-100,-22},{-74,-34}},
              lineColor={0,0,255},
                      textString="HR"),Rectangle(
                      extent={{-20,80},{20,-60}},
                      lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
                      fillColor={0,0,255}),Text(
              extent={{-100,-60},{100,-80}},
              lineColor={0,0,255},
              textString="%name")}));
    end VentricularInteraction_flat;

    model Septum

      Physiolibrary.Hydraulic.Sensors.PressureMeasure rvpressure
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-12,40})));
      Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-23,23})));
    TimeVaryingElastance septumdrv(
        lambda=435000,
        Es=6499999676.0309,
        Pi0=148.00118226939) annotation (Placement(transformation(
            extent={{-10,-12},{10,12}},
            rotation=0,
            origin={-58,12})));
      Physiolibrary.Hydraulic.Sensors.PressureMeasure lvpressure
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-14})));
      ElasticWall elasticWall(volume(start=2e-06), V0=2e-06)
        annotation (Placement(transformation(extent={{-28,-8},{18,22}})));
      Physiolibrary.Types.RealIO.VolumeOutput volume(start=2e-06)
        annotation (Placement(transformation(
            rotation=180,
            extent={{-10,-10},{10,10}},
            origin={-84,-10}), iconTransformation(extent={{80,-10},{100,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
         Placement(transformation(rotation=0, extent={{-4,-28},{16,-8}}),
            iconTransformation(extent={{-10,-40},{10,-20}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
         Placement(transformation(rotation=0, extent={{-4,32},{16,52}}),
            iconTransformation(extent={{-10,6},{10,26}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(rotation=0, extent={{-94,10},{-74,30}}),
            iconTransformation(extent={{-100,-10},{-80,10}})));
    equation
      connect(elasticWall.compliance, septumdrv.C) annotation (Line(
          points={{-27.08,7.9},{-32,7.9},{-32,13.68},{-47.25,13.68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(septumdrv.Pi, add1.u2) annotation (Line(
          points={{-47.25,19.92},{-33.625,19.92},{-33.625,20},{-29,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, elasticWall.prv) annotation (Line(
          points={{-17.5,23},{-13.74,23},{-13.74,7.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(elasticWall.volume, septumdrv.V) annotation (Line(
          points={{-27.08,-1.4},{-44,-1.4},{-44,7.2},{-48,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volume, elasticWall.volume) annotation (Line(points={{-84,-10},
              {-27.08,-10},{-27.08,-1.4}}, color={0,0,127}));
      connect(HR, septumdrv.HR) annotation (Line(points={{-84,20},{-68,20},
              {-68,19.2}}, color={0,0,127}));
      connect(lvpressure.pressure, elasticWall.plv) annotation (Line(
          points={{-16,-8},{-16,-0.5},{-16.96,-0.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rvpressure.q_in, rvflow) annotation (Line(
          points={{-18,44},{-6,44},{-6,42},{6,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rvpressure.pressure, add1.u1) annotation (Line(
          points={{-16,34},{-34,34},{-34,26},{-29,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(lvflow, lvpressure.q_in) annotation (Line(
          points={{6,-18},{-14,-18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Polygon(
                      points={{-100,-20},{-40,0},{-6,6},{8,6},{40,0},{100,-20},
                {98,-20},{-100,-20}},
              lineColor={167,167,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Forward,
                      fillColor={255,170,170}),Text(
              extent={{-100,-20},{-78,-40}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Forward,
                      textString="HR"),Text(
              extent={{80,-20},{100,-40}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Forward,
                      textString="V"),Text(
              extent={{-80,-20},{76,0}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Forward,
              textString="%name")}));
    end Septum;

    model Ventricle

      TimeVaryingElastance drive(
        lambda=23000,
        useEs_extInput=false,
        Es=77993596.637775,
        Pi0=28.757638965416)
        annotation (Placement(transformation(extent={{-32,-4},{-12,22}})));
    ElasticVesselWithSVandP ventricle(
        useComplianceInput=true,
        useExternalPressureInput=true,
        useV0Input=true,
        volume_start=0.0001042,
        Elastance=133322387.415)
        annotation (Placement(transformation(extent={{16,-22},{36,-2}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={34,6})));
      Modelica.Blocks.Interfaces.RealInput Pext annotation (Placement(
            transformation(
            rotation=180,
            extent={{-10,-10},{10,10}},
            origin={50,12}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={30,30})));
      Modelica.Blocks.Interfaces.RealInput V0 annotation (Placement(
            transformation(
            rotation=0,
            extent={{-10,-10},{10,10}},
            origin={0,-4}),iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,-10})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation (
          Placement(transformation(rotation=0, extent={{36,-22},{56,-2}}),
            iconTransformation(extent={{-50,-20},{-30,0}})));
      Physiolibrary.Types.RealIO.VolumeOutput stressedVolume annotation (
          Placement(transformation(
            rotation=180,
            extent={{-10,-10},{10,10}},
            origin={-26,-10}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={30,-10})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(rotation=0, extent={{-56,6},{-36,26}}),
            iconTransformation(extent={{-40,20},{-20,40}})));
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-26,-28}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,-10})));
    equation
      connect(drive.C, ventricle.compliance) annotation (Line(
          points={{-11.25,10.82},{26,10.82},{26,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.externalPressure, add.y) annotation (Line(
          points={{34,-4},{34,1.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(drive.Pi, add.u2) annotation (Line(
          points={{-11.25,17.58},{10,17.58},{10,18},{32,18},{32,10.8},{31.6,
              10.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HR, drive.HR) annotation (Line(points={{-46,16},{-42,16},{-42,
              16.8},{-32,16.8}}, color={0,0,127}));
      connect(add.u1, Pext) annotation (Line(
          points={{36.4,10.8},{47.2,10.8},{47.2,12},{50,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(V0, ventricle.zeroPressureVolume) annotation (Line(
          points={{0,-4},{18,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(drive.V, stressedVolume) annotation (Line(
          points={{-12,3.8},{-8,3.8},{-8,-10},{-26,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, q_in) annotation (Line(
          points={{26,-12},{46,-12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricle.volume, volume) annotation (Line(
          points={{32,-22},{32,-28},{-26,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.StressedVolume, stressedVolume) annotation (Line(
          points={{21.6,-1.8},{21.6,6},{-6,6},{-6,-10},{-26,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-60,-60},{60,40}})),           Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-60,-60},{60,40}}),
            graphics={Bitmap(extent={{-34,-44},{28,24}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/heartVentricle.png"),
              Text(   extent={{-40,18},{-20,0}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="HR"),Text(
              extent={{20,20},{42,0}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Pext"),Text(
              extent={{-16,0},{6,-20}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="V0"),Rectangle(extent={{-40,40},{40,-20}},
              lineColor={0,0,127}),Text(
              extent={{-60,60},{60,42}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Forward,
              textString="%name")}));
    end Ventricle;

    model VentricularInteraction
    //  Physiolibrary.Types.Pressure Plv,Plvf,Pperi,Prv,Prvf,Ppcd,Pth,Pspt;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rvflow annotation (
         Placement(transformation(extent={{-48,20},{-28,40}}),
            iconTransformation(extent={{-10,90},{10,110}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a lvflow annotation (
         Placement(transformation(extent={{-46,-22},{-26,-2}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));
      Physiolibrary.Types.RealIO.FrequencyInput frequency annotation (
          Placement(transformation(extent={{-78,-40},{-38,0}}),
            iconTransformation(extent={{-100,-12},{-60,28}})));
    Pericardium pericardium(
        lambda(displayUnit="1/m3") = 30000,
        V0=0.0002,
        P0=66.701190423724) annotation (Placement(transformation(
            extent={{13,26},{-13,-26}},
            rotation=180,
            origin={25,12})));
      Physiolibrary.Types.RealIO.PressureInput Pth annotation (Placement(
            transformation(extent={{-6,24},{14,44}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={80,8})));
      replaceable Ventricle rightVentricle(drive(
          lambda=23000,
          Es=77993596.637775,
          Pi0=28.757638965416)) annotation (Placement(transformation(
              rotation=0, extent={{-20,26},{0,46}})));
      replaceable Ventricle leftVentricle(drive(
          lambda=33000,
          useEs_extInput=false,
          Es=383941811.27772,
          Pi0=16.038683206025)) annotation (Placement(transformation(
            rotation=180,
            extent={{10,-10},{-10,10}},
            origin={-10,-16})));
      Septum septum annotation (Placement(transformation(rotation=0, extent=
               {{-54,-6},{-14,26}})));
      Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-14,22})));
      Physiolibrary.Types.RealIO.VolumeOutput rightVentricleVolume
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,90}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,90})));
      Physiolibrary.Types.RealIO.VolumeOutput leftVentricleVolume
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,-90}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-90})));
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
      connect(frequency, leftVentricle.HR) annotation (Line(
          points={{-58,-20},{-36,-20},{-36,-24},{-15,-24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightVentricle.HR, frequency) annotation (Line(
          points={{-15,44},{-58,44},{-58,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(septum.HR,    frequency) annotation (Line(
          points={{-52,10},{-58,10},{-58,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightVentricle.stressedVolume, pericardium.Vrvfw) annotation (
         Line(
          points={{-5,36},{-5,19.54},{14.86,19.54}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(lvflow, leftVentricle.q_in) annotation (Line(
          points={{-36,-12},{-26,-12},{-26,-16},{-16.6667,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pericardium.pressure, leftVentricle.Pext) annotation (Line(
          points={{35.4,35.4},{44,35.4},{44,-24},{-5,-24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth, pericardium.Pth) annotation (Line(
          points={{4,34},{14.86,34},{14.86,35.14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pericardium.pressure, rightVentricle.Pext) annotation (Line(
          points={{35.4,35.4},{44,35.4},{44,44},{-5,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftVentricle.stressedVolume, pericardium.Vlvfw) annotation (
          Line(
          points={{-5,-16},{-4,-16},{-4,3.94},{14.86,3.94}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(septum.volume, leftVentricle.V0) annotation (Line(
          points={{-16,10},{-13.3333,10},{-13.3333,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(septum.volume, gain.u) annotation (Line(
          points={{-16,10},{-14,10},{-14,14.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pericardium.Vsept, gain.u) annotation (Line(
          points={{14.86,12.26},{-14,12.26},{-14,14.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, rightVentricle.V0) annotation (Line(
          points={{-14,28.6},{-14,28},{-13.3333,28},{-13.3333,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightVentricle.q_in, rvflow) annotation (Line(
          points={{-16.6667,36},{-28,36},{-28,30},{-38,30}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(septum.rvflow, rvflow) annotation (Line(
          points={{-34,12.56},{-34,30},{-38,30}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(septum.lvflow, leftVentricle.q_in) annotation (Line(
          points={{-34,5.2},{-34,-16},{-16.6667,-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftVentricle.volume, leftVentricleVolume) annotation (Line(
            points={{-9,-16},{-6,-16},{-6,-90},{-10,-90}}, color={0,0,127}));
      connect(rightVentricle.volume, rightVentricleVolume) annotation (Line(
            points={{-9,36},{-10,36},{-10,90}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
              extent={{-102,-20},{-76,-32}},
              lineColor={0,0,255},
                      textString="HR"),Text(
              extent={{100,-32},{74,-20}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Pth"),Bitmap(extent={{-92,84},{-4,-74}},
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceprava.png"),
            Bitmap(extent={{-18,-102},{94,72}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"),
              Polygon(points={{-18,48},{4,48},{6,30},{14,2},{16,-28},{16,-62},
                {18,-64},{10,-72},{-6,-70},{-8,-52},{-10,-4},{-14,28},{-18,
                44},{-18,46},{-18,48}},
              lineColor={0,0,0},
              smooth=Smooth.Bezier,
              fillPattern=FillPattern.Forward,
                      fillColor={255,205,205}),Polygon(
                      points={{-58,0},{-64,0},{-66,0},{-62,-12},{-56,-38},{
                -38,-60},{-6,-76},{24,-72},{44,-50},{62,-18},{68,2},{60,4},
                {56,-10},{46,-32},{34,-52},{20,-66},{4,-68},{-12,-64},{-44,
                -42},{-42,-42},{-58,0}},
              lineColor={0,0,0},
              smooth=Smooth.Bezier,
              fillColor={255,205,205},
                      fillPattern=FillPattern.Forward),Text(
              extent={{-98,-68},{98,-92}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,205,205},
              fillPattern=FillPattern.Forward,
                      textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end VentricularInteraction;

    model TimeVaryingElastance
      //parameter Physiolibrary.Types.HydraulicElastance Ed "elastance of diastole";
      parameter Boolean useEs_extInput=false
        "=true, if external elastance/compliance value is used" annotation (
        Evaluate=true,
        HideResult=true,
        choices(__Dymola_checkBox=true),
        Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.HydraulicElastance Es
        "elastance of systole"
        annotation (Dialog(enable=not useEs_extInput));
      parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
      parameter HydraulicLambda lambda;
      Physiolibrary.Types.Time tm
        "relative time from the beginning of cardiac cycle";
      discrete Physiolibrary.Types.Time HP "heart period";
      discrete Physiolibrary.Types.Time t0
        "time of beginning of the cardiac cycle";
      discrete Physiolibrary.Types.Time ts "duration of systole";
      Real et;
      parameter Real A=1, B=80, CC=0.375;
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput C annotation (
          Placement(transformation(extent={{-4,-102},{16,-82}}),
            iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=0,
            origin={66,14})));
      Physiolibrary.Types.HydraulicElastance E;
      Physiolibrary.Types.RealIO.PressureOutput Pi annotation (Placement(
            transformation(extent={{-72,-100},{-52,-80}}),
            iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=0,
            origin={66,66})));
      Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (
         Placement(transformation(extent={{76,58},{116,98}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-100,60})));
      Physiolibrary.Types.RealIO.VolumeInput V annotation (Placement(
            transformation(extent={{82,54},{122,94}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={60,-40})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Es)=
           1/es_int if useEs_extInput annotation (Placement(transformation(
              extent={{60,60},{100,100}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-100,20})));
    protected
      Physiolibrary.Types.HydraulicElastance es_int;
    equation
      if not useEs_extInput then
        es_int = Es;
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
      when {initial(),tm >= pre(HP)} then
        HP = 1/HR;
        t0 = time;
        ts = 0.16 + 0.3*HP;
      end when;
      et = A*exp(-B*(tm - CC)^2);
      //(5)
      E = et*es_int;
      //(derived (4)
      C = 1/E;
      Pi = (1 - et)*Pi0*(exp(lambda*V) - 1);
      //derived(4)
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{60,100}}), graphics={Rectangle(
                      extent={{-42,80},{50,-76}},
                      lineColor={0,0,255},
                      fillColor={170,255,255},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-96,82},{-32,58}},
                      lineColor={0,0,255},
                      textString="HR"),Text(
                      extent={{-16,28},{84,-2}},
                      lineColor={0,0,255},
                      textString="Et"),Text(
                      extent={{8,86},{58,56}},
                      lineColor={0,0,255},
                      textString="P"),Text(
                      extent={{-288,134},{260,78}},
                      lineColor={0,0,255},
                      textString="%name"),Text(
              extent={{44,-52},{76,-80}},
              lineColor={0,0,255},
              lineThickness=0.5,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
                      textString="V"),Line(
                      points={{-40,0},{-32,0},{-32,4},{-30,26},{-26,40},{-22,
                42},{-20,38},{-18,22},{-16,0},{6,0},{8,24},{12,40},{16,42},
                {18,38},{22,0},{44,0}},
              color={0,0,255},
                      smooth=Smooth.None)}), Diagram(coordinateSystem(
              extent={{-100,-100},{60,100}})));
    end TimeVaryingElastance;

    type HydraulicLambda = Real (
        final quantity="HydraulicLambda",
        final unit="1/m3",
        displayUnit="1/ml",
        nominal=(1e-5),
        min=0);
    model Pericardium
      parameter Physiolibrary.Types.Volume V0;
      parameter Physiolibrary.Types.Pressure P0;
      parameter HydraulicLambda lambda;
      Physiolibrary.Types.RealIO.VolumeInput Vsept annotation (Placement(
            transformation(extent={{40,-36},{80,4}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=0,
            origin={-29,1})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
          Placement(transformation(extent={{-40,-10},{-20,10}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={50,90})));
      Physiolibrary.Types.RealIO.VolumeInput Vrvfw annotation (Placement(
            transformation(extent={{40,-36},{80,4}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=0,
            origin={-29,29})));
      Physiolibrary.Types.RealIO.VolumeInput Vlvfw annotation (Placement(
            transformation(extent={{40,-36},{80,4}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=0,
            origin={-29,-31})));
      Physiolibrary.Types.Volume Vperi;
      Physiolibrary.Types.Pressure Pperi;
      Physiolibrary.Types.RealIO.VolumeOutput Vrv annotation (Placement(
            transformation(extent={{40,20},{60,40}}), iconTransformation(
              extent={{40,20},{60,40}})));
      Physiolibrary.Types.RealIO.VolumeOutput Vlv annotation (Placement(
            transformation(extent={{36,20},{56,40}}), iconTransformation(
              extent={{40,-40},{60,-20}})));
      Physiolibrary.Types.RealIO.PressureInput Pth annotation (Placement(
            transformation(extent={{-50,60},{-10,100}}), iconTransformation(
              extent={{-40,78},{-18,100}})));
    equation
      Vperi = Vrvfw + Vlvfw;
      Vrv = Vrvfw + Vsept;
      Vlv = Vlvfw - Vsept;
      Pperi = P0*(exp(lambda*(Vperi - V0)) - 1);
      //orig equation in mmHg and ml
       pressure = Pth + Pperi;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-40,-100},{60,100}}), graphics={Polygon(
                      points={{-18,90},{-18,-90},{-6,-80},{24,-44},{32,-16},
                {30,10},{24,32},{0,68},{-18,92},{-18,90}},
              smooth=Smooth.None,
              lineColor={167,167,255},
              fillPattern=FillPattern.Forward,
                      fillColor={227,227,255}),Polygon(
                      points={{30,4},{22,6},{-6,8},{-18,6},{-18,4},{-18,0},
                {-18,-4},{-16,-4},{-8,-6},{24,-4},{30,-4},{30,4}},
              lineColor={167,167,255},
              smooth=Smooth.Bezier,
              fillColor={255,170,170},
                      fillPattern=FillPattern.Forward),Polygon(
                      points={{-18,102},{20,50},{36,14},{36,-30},{16,-62},{
                -18,-98},{-20,-88},{12,-54},{28,-30},{28,14},{12,48},{-18,
                90},{-18,102}},
              lineColor={0,0,255},
              smooth=Smooth.Bezier,
              fillColor={255,170,170},
                      fillPattern=FillPattern.Forward),Text(
              extent={{22,98},{40,80}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="p"),Text(
              extent={{-16,14},{12,-10}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Vsept"),Text(
              extent={{-16,40},{10,14}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Vrvfw"),Text(
              extent={{-18,-18},{8,-44}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Vlvfw"),Text(
              extent={{22,40},{38,22}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Vrv"),Text(
              extent={{20,-22},{40,-36}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
                      textString="Vlv"),Text(
              extent={{-10,98},{12,76}},
              lineColor={0,0,255},
              fillColor={170,255,255},
              fillPattern=FillPattern.Forward,
                      textString="Pth"),Text(
              extent={{-40,120},{64,100}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Forward,
                      textString="%name")}), Diagram(coordinateSystem(
              extent={{-40,-100},{60,100}}), graphics));
    end Pericardium;

    model Heart
      extends Cardiovascular.Interfaces.Heart;
      Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit=
              "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit=
              "m3/s") = 0.0001372)
        annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
      Physiolibrary.Hydraulic.Components.IdealValveResistance
        tricuspidValve(Pknee=0, _Ron(displayUnit="(mmHg.s)/ml")=
          3159740.5817355)
        annotation (Placement(transformation(extent={{-48,30},{-28,50}})));
      Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit=
              "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit=
             "m3/s") = -1.9e-9)
        annotation (Placement(transformation(extent={{42,30},{62,50}})));
      Physiolibrary.Hydraulic.Components.IdealValveResistance
        pulmonaryValve(Pknee=0, _Ron(displayUnit="(mmHg.s)/ml")=
          733273.1307825)
        annotation (Placement(transformation(extent={{66,30},{86,50}})));
      Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit=
              "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit=
             "m3/s") = 0.0001141) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={78,-14})));
      Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(
          Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157)
        annotation (Placement(transformation(extent={{60,-24},{40,-4}})));
      Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit=
              "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit=
             "m3/s") = -1.4e-8) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-40,-14})));
        Physiolibrary.Hydraulic.Components.IdealValveResistance  aorticValve(
          Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347)
        annotation (Placement(transformation(extent={{-58,-24},{-78,-4}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
        annotation (Placement(transformation(extent={{-52,8},{-36,22}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
        annotation (Placement(transformation(extent={{52,20},{42,30}})));
    VentricularInteraction_flat       ventricularInteraction_flat(
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
        Eslv=383941811.27772)
        annotation (Placement(transformation(extent={{-18,-8},{20,32}})));
    equation
      connect(rightHeartInflow, Ltc.q_in) annotation (Line(
          points={{-100,40},{-90,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
          points={{-70,40},{-48,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
          points={{62,40},{66,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryValve.q_out, rightHeartOutflow) annotation (Line(
          points={{86,40},{100,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Lmt.q_in, leftHeartInflow) annotation (Line(
          points={{88,-14},{94,-14},{94,-20},{100,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Lmt.q_out, mitralValve.q_in) annotation (Line(
          points={{68,-14},{60,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorticValve.q_in, Lav.q_out) annotation (Line(
          points={{-58,-14},{-50,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorticValve.q_out, leftHeartOutflow) annotation (Line(
          points={{-78,-14},{-84,-14},{-84,-20},{-100,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(tricuspidValve.q_out, ventricularInteraction_flat.rvflow)
        annotation (Line(
          points={{-28,40},{0.62,40},{0.62,32}},
          color={0,0,0},
          thickness=1));
      connect(ventricularInteraction_flat.rvflow, Lpv.q_in) annotation (
          Line(
          points={{0.62,32},{0.62,40},{42,40}},
          color={0,0,0},
          thickness=1));
      connect(Lav.q_in, ventricularInteraction_flat.lvflow) annotation (
          Line(
          points={{-30,-14},{2,-14},{2,-8},{1,-8}},
          color={0,0,0},
          thickness=1));
      connect(ventricularInteraction_flat.lvflow, mitralValve.q_out)
        annotation (Line(
          points={{1,-8},{2,-8},{2,-14},{40,-14}},
          color={0,0,0},
          thickness=1));
      connect(ventricularInteraction_flat.lvflow, LVCannula) annotation (
          Line(
          points={{1,-8},{2,-8},{2,-68},{50,-68}},
          color={0,0,0},
          thickness=1));
      connect(HR.y, ventricularInteraction_flat.HR) annotation (Line(points=
             {{-34,15},{-24,15},{-24,12},{-14.2,12}}, color={0,0,127}));
      connect(ventricularInteraction_flat.Pth, Pth.y) annotation (Line(
            points={{16.58,12},{35.29,12},{35.29,25},{40.75,25}}, color={0,
              0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})),           Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Smith")}));
    end Heart;

    model Pulmonary
      extends Cardiovascular.Interfaces.Pulmonary;
      Physiolibrary.Hydraulic.Components.ElasticVesselElastance
        pulmonaryArteries(
        ZeroPressureVolume=0,
        useExternalPressureInput=true,
        volume_start=3.904e-05,
        Elastance=49195960.956135)
        annotation (Placement(transformation(extent={{-72,-18},{-34,18}})));
      Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(
            displayUnit="(mmHg.s)/ml") = 20691634.526808) annotation (
          Placement(transformation(
            extent={{-15,-16},{15,16}},
            rotation=0,
            origin={-5,0})));
      Physiolibrary.Hydraulic.Components.ElasticVesselElastance
        pulmonaryVeins(
        ZeroPressureVolume=0,
        useExternalPressureInput=true,
        volume_start=0.0008269,
        Elastance=973253.4281295)
        annotation (Placement(transformation(extent={{36,-18},{72,18}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
        annotation (Placement(transformation(extent={{-92,8},{-80,20}})));
    equation
      connect(q_in, pulmonaryArteries.q_in) annotation (Line(
          points={{-100,0},{-84,0},{-84,2.22045e-16},{-53,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
          points={{-53,2.22045e-16},{-42,2.22045e-16},{-42,4.44089e-16},{-20,
              4.44089e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
          points={{10,4.44089e-16},{36,4.44089e-16},{36,2.22045e-16},{54,
              2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, q_out) annotation (Line(
          points={{54,2.22045e-16},{80,2.22045e-16},{80,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Pth.y, pulmonaryArteries.externalPressure) annotation (Line(
          points={{-78.5,14},{-58,14},{-58,14.4},{-37.8,14.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryArteries.externalPressure, pulmonaryVeins.externalPressure)
        annotation (Line(
          points={{-37.8,14.4},{16.1,14.4},{16.1,14.4},{68.4,14.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Smith")}));
    end Pulmonary;

    model Systemic
      extends Cardiovascular.Interfaces.Systemic;
      Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(
        ZeroPressureVolume=0,
        volume_start=0.0001241,
        Elastance=92165766.41999)
        annotation (Placement(transformation(extent={{36,-14},{68,18}})));
      Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(
            displayUnit="(mmHg.s)/ml") = 145054757.50752) annotation (
          Placement(transformation(
            extent={{-16,-16},{16,16}},
            rotation=180,
            origin={-8,0})));
      Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(
        ZeroPressureVolume=0,
        volume_start=0.0002952,
        Elastance=786602.0857485)
        annotation (Placement(transformation(extent={{-72,-16},{-40,16}})));
    equation
      connect(aorta.q_in, q_in) annotation (Line(
          points={{52,2},{70,2},{70,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorta.q_in, Rsys.q_in) annotation (Line(
          points={{52,2},{20,2},{20,-2.22045e-15},{8,-2.22045e-15}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rsys.q_out, venaCava.q_in) annotation (Line(
          points={{-24,1.77636e-15},{-40,1.77636e-15},{-40,2.22045e-16},{-56,
              2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venaCava.q_in, q_out) annotation (Line(
          points={{-56,2.22045e-16},{-80,2.22045e-16},{-80,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AortaCannulla, aorta.q_in) annotation (Line(
          points={{70,-90},{52,-90},{52,2}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})),           Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Smith")}));
    end Systemic;

    model ElasticWall

      Physiolibrary.Types.RealIO.PressureInput prv annotation (Placement(
            transformation(extent={{-26,32},{14,72}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-38,6})));
      Physiolibrary.Types.RealIO.PressureInput plv annotation (Placement(
            transformation(extent={{-26,-54},{14,-14}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-52,-50})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (
          Placement(transformation(extent={{-2,-94},{18,-74}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={110,-46})));
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(extent={{-112,-66},{-92,-46}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-96,-56})));
      parameter Physiolibrary.Types.Volume V0=0;
      Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance
        annotation (Placement(transformation(extent={{-24,42},{16,82}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-96,6})));
    equation
      pressure = plv - prv;
      pressure = (volume - V0)/compliance;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
              extent={{-30,26},{22,-4}},
              lineColor={0,0,255},
              lineThickness=0.5,
                      textString="prv"),Text(
              extent={{-42,-38},{10,-68}},
              lineColor={0,0,255},
              lineThickness=0.5,
                      textString="plv"),Text(
              extent={{26,-32},{102,-56}},
              lineColor={0,0,255},
              lineThickness=0.5,
                      textString="pressure"),Text(
              extent={{-150,-26},{-70,-46}},
              lineColor={0,0,255},
              lineThickness=0.5,
                      textString="Volume"),Polygon(
                      points={{-100,-14},{-40,-34},{-6,-40},{8,-40},{40,-34},
                {100,-14},{98,-14},{-100,-14}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillPattern=FillPattern.Forward,
                      fillColor={255,170,170}),Text(
              extent={{-128,-10},{-60,-44}},
              lineColor={0,0,255},
              fillColor={255,170,170},
              fillPattern=FillPattern.Forward,
              textString="compliance
"),         Text(
              extent={{20,40},{166,-18}},
              lineColor={0,0,255},
              horizontalAlignment=TextAlignment.Left,
              textString="  pressure = plv -prv;
  pressure = (volume-V0) /compliance;")}),
                                       Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end ElasticWall;

    model ElasticVesselWithSVandP
      "elastic vessel computes aditionally stressed volume and pressure"
      extends Physiolibrary.Hydraulic.Components.ElasticVesselElastance;
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-88,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-44,102})));
    equation
      StressedVolume = volume - zpv;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end ElasticVesselWithSVandP;
  end Parts;

  model HemodynamicsSmithControl
    extends Interfaces.Controlled.System(
      redeclare ControlledParts.PulmonaryControl pulmonaryCirculation,
      redeclare replaceable ControlledParts.HeartControl heart,
      redeclare ControlledParts.SystemicControl systemicCirculation(
          venaCava(volume_start=0.0022952, ZeroPressureVolume=0.002), aorta(
            volume_start=0.0008841, ZeroPressureVolume=0.00076)),
      redeclare replaceable Model.Control.BloodVolumeControl
        longTermControl,
      redeclare ControlledParts.Baroreflex shortTermControl);
  /*    redeclare CardiovascularDevel.Model.Control.StenosisControl stenosisControl(
      venacavastenosis(InitialElastance=786602.0857485, FinalElastance=786602.0857485),
      AVBackFlowConductance(k(displayUnit="ml/(mmHg.s)") = 7.5006157584566e-14),
      aorticstenosis(InitialResistance=2399802.97347, FinalResistance=2399802.97347)),*/

      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(
        StopTime=5,
        __Dymola_NumberOfIntervals=5000,
        Tolerance=0.001));
  end HemodynamicsSmithControl;

  package ControlledParts
    extends Modelica.Icons.UtilitiesPackage;
    model PulmonaryControl
      extends Parts.Pulmonary(pulmonaryArteries(volume_start=5.904e-05,
            ZeroPressureVolume=2e-05), pulmonaryVeins(volume_start=
              0.0015269, ZeroPressureVolume=0.0007));
      extends Interfaces.Controlled.Pulmonary;
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{72,-42},{92,-22}})));
    equation
      connect(pulmonaryArteries.volume, add.u2) annotation (Line(
          points={{-41.6,-18},{-40,-18},{-40,-38},{70,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryVeins.volume, add.u1) annotation (Line(
          points={{64.8,-18},{66,-18},{66,-26},{70,-26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, busConnector.pulmonaryBloodVolume) annotation (Line(
          points={{93,-32},{92,-32},{92,24},{-80,24},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{-25,58},{-25,58}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end PulmonaryControl;

    model SystemicControl
      extends Parts.Systemic(venaCava(useComplianceInput=true), Rsys(
            useConductanceInput=true));
      extends Interfaces.Controlled.Systemic;
      Model.Control.AortaPressureMeasurement aortaPressureMeasurement
        annotation (Placement(transformation(extent={{4,10},{24,30}})));
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{72,-34},{92,-14}})));
    equation
      connect(venaCava.compliance, busConnector.venacavacompliance)
        annotation (Line(
          points={{-56,12.8},{-56,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(Rsys.cond, busConnector.peripheralconductance) annotation (
          Line(
          points={{-8,-9.6},{-4,-9.6},{-4,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{5,1},{5,1}}));
      connect(Rsys.q_in, aortaPressureMeasurement.q_in) annotation (Line(
          points={{8,0},{8,8},{10,8},{10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
        annotation (Line(
          points={{21,23},{26,23},{26,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(aorta.volume, add.u1) annotation (Line(
          points={{61.6,-14},{64,-14},{64,-20},{70,-20},{70,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, venaCava.volume) annotation (Line(
          points={{70,-30},{-46.4,-30},{-46.4,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, busConnector.systemicBloodVolume) annotation (Line(
          points={{93,-24},{92,-24},{92,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{-25,60},{-25,60}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end SystemicControl;

    model HeartControl

      extends Interfaces.Controlled.Heart;
      extends Parts.Heart(redeclare Types.Constants.FrequencyControl HR,
          aorticValve(useLimitationInputs=false));
    equation
    //  connect(volume, busConnector.heartvolume);
      connect(HR.c, busConnector.heartrate) annotation (Line(
          points={{-48,15},{-54,15},{-54,18},{-66,18},{-66,86},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(ventricularInteraction.busConnector, busConnector)
        annotation (Line(
          points={{-9.6,27.04},{-9.6,86},{-98,86}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(ventricularInteraction.rightVentricleVolume, busConnector.heartBloodVolume)
        annotation (Line(
          points={{17.4,26.5},{17.4,86},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end HeartControl;

    model VIVolume
      extends Parts.VentricularInteraction(redeclare VentricleControlled
          rightVentricle(drive(useEs_extInput=true)), redeclare
          VentricleControlled leftVentricle(drive(useEs_extInput=true)));
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(extent={{34,-44},{54,-24}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={38,50})));
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{2,-40},{16,-26}})));
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-72,32},{-32,72}}), iconTransformation(
              extent={{-72,32},{-32,72}})));
    equation
      connect(rightVentricle.volume, add.u2) annotation (Line(
          points={{-9,36},{-10,36},{-10,-37.2},{0.6,-37.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftVentricle.volume, add.u1) annotation (Line(
          points={{-9,-12},{-9,-28.8},{0.6,-28.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, rightVentricleVolume) annotation (Line(
          points={{16.7,-33},{26.35,-33},{26.35,-34},{44,-34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftVentricle.hydrauliccompliance, busConnector.lvcompliance)
        annotation (Line(
          points={{-15.5,-23.8},{-15.5,-40},{-52,-40},{-52,52}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(rightVentricle.hydrauliccompliance, busConnector.rvcompliance)
        annotation (Line(
          points={{-15.5,47.8},{-15.5,52},{-52,52}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
              extent={{46,60},{98,42}},
              lineColor={0,0,255},
                      textString="volume")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-40,56},{24,52}},
              lineColor={0,0,255},
                      textString=
                "rvcompliance ->rightVentricle.drive.Es_ext"),Text(
              extent={{-62,-42},{2,-46}},
              lineColor={0,0,255},
                      textString=
                "lvcompliance ->leftVentricle.drive.Es_ext")}));
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
      extends Model.Scenario.StenosisControl(
        venacavastenosis(InitialElastance=786602.0857485, FinalElastance=
              786602.0857485),
        aorticstenosis(
          duration=60,
          InitialResistance(displayUnit="(mmHg.s)/ml") = 2399802.97347,
          FinalResistance(displayUnit="(mmHg.s)/ml") = 10665790.9932),
        mitralvalvestenosis(InitialResistance=2106493.721157,
            FinalResistance=2106493.721157),
        AVgon(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12),
        mvgoff(k(displayUnit="ml/(mmHg.s)") = 1.2000985213531e-12));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end AorticValveStenosisScenario;

    model AorticValveHeartControl
      extends HeartControl(aorticValve(useLimitationInputs=true));
    equation
      connect(aorticValve.Goff, busConnector.avbackflowconductance)
        annotation (Line(
          points={{-74,-4},{-74,2},{-98,2},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(aorticValve.Gon, busConnector.avoutflowresistance)
        annotation (Line(
          points={{-62,-4},{-62,6},{-98,6},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end AorticValveHeartControl;

    model VentricleControlled
      extends Parts.Ventricle(drive(useEs_extInput=true));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput
        hydrauliccompliance annotation (Placement(transformation(extent={{-12,
                18},{28,58}}), iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=270,
            origin={-33,49})));
    equation
      connect(drive.Es_ext, hydrauliccompliance) annotation (Line(
          points={{-32,11.6},{-56,11.6},{-56,38},{8,38}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-60,-60},{60,40}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-60,-60},{60,40}}),
            graphics));
    end VentricleControlled;
  end ControlledParts;

  model StenosisAorticValve
    extends HemodynamicsSmithControl(redeclare
        ControlledParts.AorticValveHeartControl heart, redeclare
        ControlledParts.AorticValveStenosisScenario scenarioControl(AVgon(k(
              displayUnit="ml/(mmHg.s)"))));
    annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
  end StenosisAorticValve;

  model Bleeding
    extends HemodynamicsSmithControl(redeclare
        Scenario.BleedingTransfusionScenario scenarioControl(
        Tbd=300,
        BloodLoss=0.0005,
        Tts=600,
        Ttd=600,
        BloodTrans=0), longTermControl(redeclare
          Control.BloodVolume.RBCBleeding redBloodCells, redeclare
          Control.BloodVolume.PlasmaBleeding plasma));
    annotation (experiment(StopTime=3600, __Dymola_NumberOfIntervals=5000));
  end Bleeding;
  annotation (Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p><br>[1] 	Smith BW, Chase JG, Nokes RI, Shaw GM, Wake G. Minimal haemodynamic system model including ventricular interaction and valve dynamics. Med Eng Phys 2004;26:131&ndash;9.</p>
</html>"));
end Smith2004;
