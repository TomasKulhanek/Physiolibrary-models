within ;
package Hann2006Model
  model Hemodynamics_flat
    Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
      volume_start=0.000842,
      ZeroPressureVolume=0.0007,
      Compliance=1.2751046789376e-08)
      annotation (Placement(transformation(extent={{-114,-30},{-94,-10}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel venaCava(
      volume_start=0.002755,
      ZeroPressureVolume=0.00223,
      Compliance=5.2504310309196e-07)
      annotation (Placement(transformation(extent={{-114,24},{-94,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve aorticValve(_Gon(displayUnit=
            "ml/(mmHg.s)") = 4.1703423617018e-07, Pknee=0)
      annotation (Placement(transformation(extent={{-46,-30},{-66,-10}})));
    Physiolibrary.Hydraulic.Components.Conductor Rsys(Conductance(displayUnit=
            "ml/(mmHg.s)") = 6.9110673598419e-09) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-104,6})));
    Physiolibrary.Hydraulic.Components.IdealValve tricupsidValve(_Gon(
          displayUnit="ml/(mmHg.s)") = 3.1802610815856e-07, Pknee=0)
      annotation (Placement(transformation(extent={{-46,24},{-26,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true,
      useExternalPressureInput=false,
      volume_start=0.000112,
      ZeroPressureVolume=5e-06)
      annotation (Placement(transformation(extent={{-8,24},{12,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
        useComplianceInput=true,
      useExternalPressureInput=false,
      volume_start=0.000125,
      ZeroPressureVolume=5e-06)
      annotation (Placement(transformation(extent={{2,-32},{18,-8}})));
    Physiolibrary.Hydraulic.Components.Inertia Lav(volumeFlow_start=1e-05, I(
          displayUnit="mmHg.s2/ml") = 16250.665802014)             annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-18,-20})));
    Physiolibrary.Hydraulic.Components.Inertia Lpv(volumeFlow_start=1e-05, I(
          displayUnit="mmHg.s2/ml") = 19822.372560862)
      annotation (Placement(transformation(extent={{18,24},{38,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve(_Gon(
          displayUnit="ml/(mmHg.s)") = 1.3651120680391e-06, Pknee=0)
      annotation (Placement(transformation(extent={{58,24},{78,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
      volume_start=0.001237,
      ZeroPressureVolume=0.0006,
      Compliance=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{98,24},{118,44}})));
    Physiolibrary.Hydraulic.Components.Conductor Rpul(Conductance(displayUnit=
            "ml/(mmHg.s)") = 4.830396548446e-08) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={110,4})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
      volume_start=0.000197,
      ZeroPressureVolume=0.0001,
      Compliance=5.2504310309196e-08)
      annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
    Physiolibrary.Hydraulic.Components.IdealValve mitralValve(_Gon(displayUnit=
            "ml/(mmHg.s)") = 4.7778922381368e-07, Pknee=0)
      annotation (Placement(transformation(extent={{54,-30},{34,-10}})));
    Physiolibrary.Hydraulic.Components.Inertia Ltc(volumeFlow_start=1e-05, I(
          displayUnit="mmHg.s2/ml") = 10678.18997523)
      annotation (Placement(transformation(extent={{-90,24},{-70,44}})));
    Physiolibrary.Hydraulic.Components.Inertia Lmt(volumeFlow_start=1e-05, I(
          displayUnit="mmHg.s2/ml") = 10261.557514558)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={82,-20})));
    TimeVaryingElastance RE(
      Ed=3999671.62245,
      Es=43729743.07212,
      Pi0=3199.73729796)
      annotation (Placement(transformation(extent={{-10,58},{10,78}})));
    TimeVaryingElastance Le(
      Ed=13332238.7415,
      Es=183318282.69563,
      Pi0=6666.11937075)
      annotation (Placement(transformation(extent={{2,-4},{24,20}})));
    Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
      annotation (Placement(transformation(extent={{-72,12},{-64,20}})));
  equation
    connect(aorta.q_in, Rsys.q_in) annotation (Line(
        points={{-104,-20},{-104,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rsys.q_out, venaCava.q_in) annotation (Line(
        points={{-104,16},{-104,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricupsidValve.q_out, rightVentricle.q_in) annotation (Line(
        points={{-26,34},{2,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
        points={{78,34},{108,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
        points={{108,34},{110,34},{110,14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{110,-6},{110,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_out, aorta.q_in) annotation (Line(
        points={{-66,-20},{-104,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.compliance, RE.C) annotation (Line(
        points={{2,42},{2,50},{0,50},{0,59}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(venaCava.q_in, Ltc.q_in) annotation (Line(
        points={{-104,34},{-90,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.q_in, Lpv.q_in) annotation (Line(
        points={{2,34},{18,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, Lmt.q_in) annotation (Line(
        points={{110,-20},{92,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lav.q_out, aorticValve.q_in) annotation (Line(
        points={{-28,-20},{-46,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Ltc.q_out, tricupsidValve.q_in) annotation (Line(
        points={{-70,34},{-46,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
        points={{38,34},{58,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_in, Lmt.q_out) annotation (Line(
        points={{54,-20},{72,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lav.q_in, leftVentricle.q_in) annotation (Line(
        points={{-8,-20},{10,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
        points={{34,-20},{10,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(HR.y, RE.HR) annotation (Line(
        points={{-63,16},{-60,16},{-60,75.6},{-8.6,75.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(HR.y, Le.HR) annotation (Line(
        points={{-63,16},{-58,16},{-58,17.12},{3.54,17.12}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Le.C, leftVentricle.compliance) annotation (Line(
        points={{13,-2.8},{13,-6.4},{10,-6.4},{10,-10.4}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
              -100},{120,100}}),      graphics), Icon(coordinateSystem(extent={
              {-120,-100},{120,100}})));
  end Hemodynamics_flat;

  model VentricularInteraction
    Physiolibrary.Types.Pressure Plv,Plvf,Pperi,Prv,Prvf,Ppcd,Pth,Pspt;
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a annotation (
        Placement(transformation(extent={{-10,80},{10,100}}),
          iconTransformation(extent={{-10,90},{10,110}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a1 annotation (
        Placement(transformation(extent={{-10,-104},{10,-84}}),
          iconTransformation(extent={{-10,-110},{10,-90}})));

  equation
    Plv = Plvf+Pperi;
    Plvf=e*Peslvf+(1-e)*Pedlvf;

    Prv=Prvf+Pperi;
    Prvf=e*Pesrvf+(1-e)*Pedrvf;

    Pperi=Ppcd+Pth;

    Pspt=Plv-Prv;

    Pspt=e*Pesspt+(1-e)*Pedspt;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                           graphics={
          Ellipse(
            extent={{98,0},{-102,-100}},
            lineColor={0,0,255},
            lineThickness=1,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{100,98},{-98,0}},
            lineColor={0,0,255},
            lineThickness=1,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,0},{-66,4},{-50,6},{-32,2},{-16,0},{-4,0},{12,4},{30,4},
                {50,0},{74,-2},{80,0},{80,-4},{74,-6},{64,-4},{52,-8},{30,-2},{
                12,0},{2,-4},{-8,-4},{-20,-6},{-30,-4},{-48,0},{-68,-2},{-80,-6},
                {-80,0}},
            lineColor={0,0,255},
            smooth=Smooth.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-16,54},{-16,8},{-28,20},{-4,20},{-16,8}},
            color={0,0,255},
            smooth=Smooth.None),
          Line(
            points={{34,-68},{34,-10},{22,-24},{48,-24},{34,-12}},
            color={0,0,255},
            smooth=Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio=
             false, extent={{-100,-100},{100,100}}), graphics));
  end VentricularInteraction;

  model TimeVaryingElastance
    parameter Physiolibrary.Types.HydraulicElastance Ed "elastance of diastole";
    parameter Physiolibrary.Types.HydraulicElastance Es "elastance of systole";
    parameter Physiolibrary.Types.Pressure Pi0 "peak isovolumic pressure";
    Physiolibrary.Types.Time tm
      "relative time from the beginning of cardiac cycle";
    discrete Physiolibrary.Types.Time HP "heart period";
    discrete Physiolibrary.Types.Time t0
      "time of beginning of the cardiac cycle";
    discrete Physiolibrary.Types.Time ts "duration of systole";
    Real a;
    Physiolibrary.Types.RealIO.HydraulicComplianceOutput C annotation(Placement(transformation(extent = {{-4, -102}, {16, -82}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -90})));
    Physiolibrary.Types.HydraulicElastance E;
    Physiolibrary.Types.RealIO.PressureOutput Pi annotation(Placement(transformation(extent = {{-72, -100}, {-52, -80}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, -90})));
    Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation(Placement(transformation(extent = {{-106, 56}, {-66, 96}}), iconTransformation(extent = {{-106, 56}, {-66, 96}})));
  equation
    tm = time - pre(t0);
    if tm < pre(ts) then
      a = (1 - cos(2 * Modelica.Constants.pi * tm / pre(ts))) / 2;
    else
      a = 0;
    end if;
    E = Ed + Es * a;
    C = 1 / E;
    Pi = Pi0 * a;
    when {initial(), tm >= pre(HP)} then
      HP = 1 / HR;
      t0 = time;
      ts = 0.16 + 0.3 * HP;
    end when;
    annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 255}, fillColor = {170, 255, 255},
              fillPattern =                                                                                                    FillPattern.Solid), Line(points = {{-78, 0}, {-68, 18}, {-54, 52}, {-44, 64}, {-30, 60}, {-26, 46}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-26, 46}, {-26, 32}, {-20, 10}, {-8, 2}, {36, 2}, {80, 2}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-70, 98}, {-22, 80}}, lineColor = {0, 0, 255}, textString = "HR"), Text(extent = {{-74, -40}, {40, -80}}, lineColor = {0, 0, 255}, textString = "Et"), Text(extent = {{42, -40}, {100, -80}}, lineColor = {0, 0, 255}, textString = "Pi"), Text(extent = {{-272, 16}, {276, -40}}, lineColor = {0, 0, 255}, textString = "%name")}));
  end TimeVaryingElastance;

  model Hemodynamics_flat_without_inertia
    Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
      volume_start=0.000872,
      ZeroPressureVolume=0.0007,
      Compliance=1.2751046789376e-08)
      annotation (Placement(transformation(extent={{-114,-28},{-94,-8}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel venaCava(
      volume_start=0.002601,
      ZeroPressureVolume=0.00223,
      Compliance=5.2504310309196e-07)
      annotation (Placement(transformation(extent={{-114,24},{-94,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve aorticValve
      annotation (Placement(transformation(extent={{-68,-30},{-88,-10}})));
    Physiolibrary.Hydraulic.Components.Conductor Rsys(Conductance(displayUnit=
            "ml/(mmHg.s)") = 6.9110673598419e-09) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-104,6})));
    Physiolibrary.Hydraulic.Components.IdealValve tricupsidValve
      annotation (Placement(transformation(extent={{-34,24},{-14,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true, useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{-8,24},{12,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
        useComplianceInput=true, useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{-6,-8},{12,-30}})));
    Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve
      annotation (Placement(transformation(extent={{74,24},{94,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
      volume_start=0.000832,
      ZeroPressureVolume=0.0006,
      Compliance=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{98,24},{118,44}})));
    Physiolibrary.Hydraulic.Components.Conductor Rpul(Conductance(displayUnit=
            "ml/(mmHg.s)") = 4.830396548446e-08) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={110,4})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
      volume_start=0.000154,
      ZeroPressureVolume=0.0001,
      Compliance=5.2504310309196e-08)
      annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
    Physiolibrary.Hydraulic.Components.IdealValve mitralValve
      annotation (Placement(transformation(extent={{36,-30},{16,-10}})));
    Physiolibrary.Hydraulic.Components.Conductor Rtc(Conductance(displayUnit=
            "ml/(mmHg.s)") = 3.1802610815856e-07) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-52,34})));
    Physiolibrary.Hydraulic.Components.Conductor Rpv(Conductance(displayUnit=
            "ml/(mmHg.s)") = 1.3651120680391e-06) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={58,34})));
    Physiolibrary.Hydraulic.Components.Conductor Rmt(Conductance(displayUnit=
            "ml/(mmHg.s)") = 4.7778922381368e-07) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={52,-20})));
    Physiolibrary.Hydraulic.Components.Conductor Rav(Conductance(displayUnit=
            "ml/(mmHg.s)") = 4.1703423617018e-07) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-48,-20})));
    TimeVaryingElastance RE(
      Ed=3999671.62245,
      Es=43729743.07212,
      Pi0=3199.73729796)
      annotation (Placement(transformation(extent={{-10,58},{10,78}})));
    TimeVaryingElastance Le(
      Ed=13332238.7415,
      Es=183318282.69563,
      Pi0=6666.11937075)
      annotation (Placement(transformation(extent={{-6,-42},{14,-60}})));
    Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
      annotation (Placement(transformation(extent={{-118,72},{-110,80}})));
  equation
    connect(aorta.q_in, Rsys.q_in) annotation (Line(
        points={{-104,-18},{-104,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rsys.q_out, venaCava.q_in) annotation (Line(
        points={{-104,16},{-104,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricupsidValve.q_out, rightVentricle.q_in) annotation (Line(
        points={{-14,34},{2,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
        points={{94,34},{108,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
        points={{108,34},{110,34},{110,14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{110,-6},{110,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
        points={{16,-20},{10,-20},{10,-19},{3,-19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_in, Rav.q_out) annotation (Line(
        points={{-68,-20},{-58,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_out, aorta.q_in) annotation (Line(
        points={{-88,-20},{-96,-20},{-96,-18},{-104,-18}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rtc.q_out, tricupsidValve.q_in) annotation (Line(
        points={{-42,34},{-34,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpv.q_out, pulmonaryValve.q_in) annotation (Line(
        points={{68,34},{74,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rmt.q_out, mitralValve.q_in) annotation (Line(
        points={{42,-20},{36,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.compliance, RE.C) annotation (Line(
        points={{2,42},{2,50},{0,50},{0,59}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Le.C, leftVentricle.compliance) annotation (Line(
        points={{4,-42.9},{4,-27.8},{3,-27.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RE.HR, HR.y) annotation (Line(
        points={{-8.6,75.6},{-109,75.6},{-109,76}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RE.Pi, rightVentricle.externalPressure) annotation (Line(
        points={{7,59},{7,52.5},{10,52.5},{10,42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Le.Pi, leftVentricle.externalPressure) annotation (Line(
        points={{11,-42.9},{11,-36.45},{10.2,-36.45},{10.2,-27.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(HR.y, Le.HR) annotation (Line(
        points={{-109,76},{-108,76},{-108,64},{-118,64},{-118,-58},{-62,-58},{
            -62,-57.84},{-4.6,-57.84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(rightVentricle.q_in, Rpv.q_in) annotation (Line(
        points={{2,34},{12,34},{12,14},{48,14},{48,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, Rmt.q_in) annotation (Line(
        points={{110,-20},{100,-20},{100,-6},{62,-6},{62,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rav.q_in, leftVentricle.q_in) annotation (Line(
        points={{-38,-20},{-38,-18},{3,-18},{3,-19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rtc.q_in, venaCava.q_in) annotation (Line(
        points={{-62,34},{-64,34},{-64,18},{-98,18},{-98,34},{-104,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
              -100},{120,100}}),      graphics), Icon(coordinateSystem(extent={
              {-120,-100},{120,100}})));
  end Hemodynamics_flat_without_inertia;

  model Hemodynamics_flat2
    Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
      volume_start=0.000872,
      ZeroPressureVolume=0.0007,
      Compliance=1.2751046789376e-08)
      annotation (Placement(transformation(extent={{-114,-30},{-94,-10}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel venaCava(
      volume_start=0.002601,
      ZeroPressureVolume=0.00223,
      Compliance=5.2504310309196e-07)
      annotation (Placement(transformation(extent={{-114,24},{-94,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve aorticValve(_Gon(displayUnit=
            "ml/(mmHg.s)") = 4.1703423617018e-07)
      annotation (Placement(transformation(extent={{-46,-30},{-66,-10}})));
    Physiolibrary.Hydraulic.Components.Conductor Rsys(Conductance(displayUnit=
            "ml/(mmHg.s)") = 6.9110673598419e-09) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-104,6})));
    Physiolibrary.Hydraulic.Components.IdealValve tricupsidValve(_Gon(
          displayUnit="ml/(mmHg.s)") = 3.1802610815856e-07)
      annotation (Placement(transformation(extent={{-46,24},{-26,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true, useExternalPressureInput=true,
      volume_start=1e-05,
      ZeroPressureVolume=1e-06)
      annotation (Placement(transformation(extent={{-8,24},{12,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
        useComplianceInput=true, useExternalPressureInput=true,
      volume_start=1e-05,
      ZeroPressureVolume=1e-06)
      annotation (Placement(transformation(extent={{4,-8},{22,-30}})));
    Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve(_Gon(
          displayUnit="ml/(mmHg.s)") = 1.3651120680391e-06)
      annotation (Placement(transformation(extent={{58,24},{78,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
      volume_start=0.000832,
      ZeroPressureVolume=0.0006,
      Compliance=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{98,24},{118,44}})));
    Physiolibrary.Hydraulic.Components.Conductor Rpul(Conductance(displayUnit=
            "ml/(mmHg.s)") = 4.830396548446e-08) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={110,4})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
      volume_start=0.000154,
      ZeroPressureVolume=0.0001,
      Compliance=5.2504310309196e-08)
      annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
    Physiolibrary.Hydraulic.Components.IdealValve mitralValve(_Gon(displayUnit=
            "ml/(mmHg.s)") = 4.7778922381368e-07)
      annotation (Placement(transformation(extent={{52,-30},{32,-10}})));
    TimeVaryingElastance RE(
      Ed=3999671.62245,
      Es=43729743.07212,
      Pi0=3199.73729796)
      annotation (Placement(transformation(extent={{-10,58},{10,78}})));
    TimeVaryingElastance Le(
      Ed=13332238.7415,
      Es=183318282.69563,
      Pi0=6666.11937075)
      annotation (Placement(transformation(extent={{-6,-42},{14,-60}})));
    Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
      annotation (Placement(transformation(extent={{-118,72},{-110,80}})));
  equation
    connect(aorta.q_in, Rsys.q_in) annotation (Line(
        points={{-104,-20},{-104,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rsys.q_out, venaCava.q_in) annotation (Line(
        points={{-104,16},{-104,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricupsidValve.q_out, rightVentricle.q_in) annotation (Line(
        points={{-26,34},{2,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
        points={{78,34},{108,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
        points={{108,34},{110,34},{110,14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{110,-6},{110,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_out, aorta.q_in) annotation (Line(
        points={{-66,-20},{-104,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.compliance, RE.C) annotation (Line(
        points={{2,42},{2,50},{0,50},{0,59}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Le.C, leftVentricle.compliance) annotation (Line(
        points={{4,-42.9},{4,-27.8},{13,-27.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RE.HR, HR.y) annotation (Line(
        points={{-8.6,75.6},{-109,75.6},{-109,76}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(RE.Pi, rightVentricle.externalPressure) annotation (Line(
        points={{7,59},{7,52.5},{10,52.5},{10,42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Le.Pi, leftVentricle.externalPressure) annotation (Line(
        points={{11,-42.9},{11,-36.45},{20.2,-36.45},{20.2,-27.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(HR.y, Le.HR) annotation (Line(
        points={{-109,76},{-108,76},{-108,64},{-118,64},{-118,-58},{-62,-58},{
            -62,-57.84},{-4.6,-57.84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
        points={{32,-20},{24,-20},{24,-19},{13,-19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(venaCava.q_in, tricupsidValve.q_in) annotation (Line(
        points={{-104,34},{-46,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.q_in, pulmonaryValve.q_in) annotation (Line(
        points={{2,34},{58,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, mitralValve.q_in) annotation (Line(
        points={{110,-20},{52,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(leftVentricle.q_in, aorticValve.q_in) annotation (Line(
        points={{13,-19},{-16.5,-19},{-16.5,-20},{-46,-20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
              -100},{120,100}}),      graphics), Icon(coordinateSystem(extent={
              {-120,-100},{120,100}})));
  end Hemodynamics_flat2;
  annotation (uses(Modelica(version="3.2.1"), Physiolibrary(version=
            "2.3.0-beta")),
    version="1",
    conversion(noneFromVersion=""));
end Hann2006Model;
