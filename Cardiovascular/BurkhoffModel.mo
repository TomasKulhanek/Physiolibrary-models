within ;
package BurkhoffModel
  package Parts
    model ElasticVesselWithSVandP
      "elastic vessel computes aditionally stressed volume and pressure"
      extends Physiolibrary.Hydraulic.Components.ElasticVessel;
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {-88,-100}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation=90,    origin={-44,102})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {92,-86}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {84,-100})));
    equation
      StressedVolume = volume - zpv;
      pressure = q_in.pressure;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end ElasticVesselWithSVandP;

    model BloodVolume
    //  Physiolibrary.Types.RealIO.VolumeInput DesiredBloodVolume; //(start=0.005);
      parameter Physiolibrary.Types.Time flowspeed(start=0.1);
      Physiolibrary.Types.RealIO.VolumeInput HeartBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={20,92})));
      Physiolibrary.Types.RealIO.VolumeInput HeartStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={46,92})));
      Physiolibrary.Types.RealIO.VolumeInput PulmonaryBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={-90,92})));
      Physiolibrary.Types.RealIO.VolumeInput PulmonaryStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={-64,92})));
      Physiolibrary.Types.RealIO.VolumeInput SystemicBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation=180, origin={114,56})));
      Physiolibrary.Types.RealIO.VolumeInput SystemicStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation=180, origin={114,82})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,16},{108,36}})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodStressedVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,-6},{108,14}})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodUnstressedVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,-30},{108,-10}})));
      Physiolibrary.Types.RealIO.VolumeInput DesiredBloodVolume annotation (
          Placement(transformation(extent={{-90,70},{-50,110}}), iconTransformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-108,42})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation (
          Placement(transformation(extent={{-4,-34},{16,-14}}), iconTransformation(
              extent={{16,-90},{36,-70}})));
    equation
      TotalBloodVolume = HeartBloodVolume + PulmonaryBloodVolume + SystemicBloodVolume;
      TotalBloodStressedVolume = HeartStressedVolume + PulmonaryStressedVolume + SystemicStressedVolume;
      TotalBloodUnstressedVolume = TotalBloodVolume - TotalBloodStressedVolume;
      //DesiredBloodVolume =
      port_b.q = - (DesiredBloodVolume-TotalBloodVolume)/flowspeed;//flowrate in one second
        annotation (Placement(transformation(extent={{-58,12},{-38,32}})),
                 Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},
                {100,100}}),                                                                           graphics={
            Rectangle(
              extent={{-94,46},{-32,-20}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0},
              radius=4),
            Rectangle(
              extent={{-90,-18},{-86,-52}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0}),
            Rectangle(
              extent={{-36,-16},{-32,-52}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0}),
            Polygon(
              points={{-60,-20},{-60,-28},{-58,-30},{-54,-36},{-56,-38},{-54,-42},{-52,
                  -44},{-50,-46},{-52,-48},{-54,-52},{-52,-54},{-48,-56},{-46,-58},{
                  -44,-64},{-42,-66},{-38,-70},{-32,-72},{-26,-76},{-18,-80},{-12,-82},
                  {-6,-84},{-2,-84},{14,-86},{22,-86},{22,-86},{20,-84},{14,-82},{8,
                  -82},{-2,-80},{-4,-80},{-10,-76},{-20,-74},{-26,-70},{-30,-68},{-36,
                  -66},{-40,-60},{-42,-58},{-44,-54},{-48,-50},{-44,-44},{-50,-40},{
                  -50,-36},{-48,-34},{-54,-28},{-56,-24},{-56,-20},{-60,-20}},
              lineColor={127,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              smooth=Smooth.None,
              fillColor={190,0,0}),
            Rectangle(
              extent={{-94,72},{-32,66}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={170,255,255}),
            Rectangle(
              extent={{-94,66},{-32,42}},
              lineColor={0,0,0},
              fillColor={170,255,255},
              fillPattern=FillPattern.Sphere,
              radius=2,
              lineThickness=1),                                                                                                    Text(extent={{
                  -66,40},{110,22}},                                                                                                    lineColor = {0,0,0}, fillColor = {85,170,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Total Blood Volume"),Text(extent={{
                  -92,24},{86,-4}},                                                                                                    lineColor = {0,0,0}, fillColor = {85,170,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Total Blood Stressed Volume"),Text(extent={{
                  -110,4},{88,-30}},                                                                                                    lineColor = {0,0,0}, fillColor = {85,170,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Total Blood Unstressed Volume")}));
    end BloodVolume;

    partial model HeartElastance
      "Elastance of heart atria and ventricules by Burkhoff"
    //  extends BurkhoffModel.Parts.EtTimingBurkhoff;
        Physiolibrary.Types.RealIO.VolumeInput Vs "Stressed volume" annotation(Placement(visible = true, transformation(origin={-163.397,
                -51.3719},                                                                                                    extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin={-90,-30},   extent = {{-9.999980000000001,-10},{10,9.99995}}, rotation = 0)));
      parameter Real Alpha "coefficient of end diastolic pressure-volume curve";
      parameter Real Beta "coefficient of end diastolic pressure-volume curve";
      parameter Physiolibrary.Types.HydraulicElastance Ees
        "coefficient of end-systolic elastance";
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput Ct "compliance" annotation(Placement(transformation(extent = {{94.0,16.0},{114.0,36.0}}, origin = {0.0,0.0}, rotation = 0), iconTransformation(extent = {{100.0,20.0},{120.0,40.0}}, origin = {2,40}, rotation = 0), visible = true));
      Physiolibrary.Types.HydraulicElastance Et "Elastance";
      Physiolibrary.Types.Time Tsyst; //need to define in extended model
      parameter Physiolibrary.Types.Time Tmax "duration of systole ";
      parameter Physiolibrary.Types.Time Tau
        "time constant of myocardial relaxation ";
      Real Et0 "Relative elastance value (Elastance/End-Systolic Elastance)";
    equation
      if Tsyst <= 3 / 2 * Tmax then
        Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * Tsyst - Modelica.Constants.pi / 2) + 1);
      else
        Et0 = 0.5 * exp(-(Tsyst - 3 * Tmax / 2) / Tau);
      end if;
      //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
      //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;
        Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs  * 133.322368 + Et0 * Ees;
        Ct = 1/Et;
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                        graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics={
            Rectangle(
              extent={{-52,94},{94,-76}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),                                                       Line(points = {{-42,90},{-42,-60},{82,-60}}, color = {0,0,0}, smooth = Smooth.None),Line(points = {{-38,-58},{26,-56},{50,-54},{66,-52},{72,-50},{78,-48},{82,-46},{86,-44}}, color = {0,0,0}, smooth = Smooth.None),Line(points = {{-38,-60},{4,88}}, color = {0,0,0}, smooth = Smooth.None),Line(points = {{-38,-60},{84,56}}, color = {255,0,0}, smooth = Smooth.None),Polygon(points = {{72,48},{68,56},{76,52},{72,48}}, lineColor = {255,0,0}, smooth = Smooth.None, fillColor = {255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid),Polygon(points = {{0,-4},{-4,4},{4,0},{0,-4}}, lineColor = {255,0,0}, smooth = Smooth.None, fillColor = {255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid, origin = {80,45}, rotation = 180),
                                                                                                    Text(extent={{
                  -92,-26},{-38,-42}},                                                                                                    lineColor = {0,0,255}, fillColor = {255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Vs"), Text(extent = {{50,90},{104,52}}, lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {255,0,0},
                fillPattern=FillPattern.Solid,
              textString="Ct"),                                                                                                    Text(extent = {{-100,-108},{100,-124}}, lineColor = {0,0,255}, fillColor = {170,213,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "%name")}));
    end HeartElastance;

    model HeartIntervals
      discrete Physiolibrary.Types.Time HP(start = 0)
        "heart period - duration of cardiac cycle";
      Boolean b(start = false);
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation(Placement(transformation(extent = {{-134.0,8.0},{-94.0,48.0}}, origin = {1.3363,-48.0}, rotation = 0), iconTransformation(extent={{
                -73.7009,4.4},{-51.7009,26.4}},                                                                                                    origin={-26.2991,
                67.6},                                                                                                    rotation = 0), visible = true));
      Physiolibrary.Types.Time Tasyst
        "time elapsed from the beginning of atrial systole";
      Physiolibrary.Types.Time Tvsyst
        "time elapsed from the beginning of ventricular systole";
      parameter Physiolibrary.Types.Time AVDelay=0.160 "AV interval";
      Physiolibrary.Types.Time T0 "start time of cardiac cycle";
      Physiolibrary.Types.Time EDTV "Ventricular end Diastolic Time";
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
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
      annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                      graphics={                                                                                                    Text(visible = true, origin={
                  -18.5625,68},                                                                                                    lineColor = {0,0,255}, extent={{
                  -73.4375,6.00004},{-23.4375,24}},                                                                                                    textString = "HR", fontName = "Arial")}));
    end HeartIntervals;

    model SideOfHeart "abstract model for heart side"
      import BurkhoffModel;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent={{-110,
                -10},{-90,10}}),                                                                                                    iconTransformation(extent = {{-14,-8},{6,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
              extent={{-18,54},{2,74}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "Intrathoracic Pressure" annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-56,50}), iconTransformation(extent={{-16,-16},
                {16,16}},                                                                                                    rotation=90,    origin={-8,-102})));
      BurkhoffModel.Parts.AtrialElastance atrialElastance(
        Alpha=0.04,
        Beta=0.3,
        Ees=26664477.483,
        Tmax(displayUnit="ms") = 0.125,
        Tau(displayUnit="ms") = 0.02)
        annotation (Placement(transformation(extent={{-100,28},{-66,54}})));
      BurkhoffModel.Parts.VentricularElastance ventricularElastance(
        Alpha=0.024,
        Beta=0.34,
        Ees=50662507.2177,
        Tmax(displayUnit="ms") = 0.2,
        Tau(displayUnit="ms") = 0.03)
        annotation (Placement(transformation(extent={{0,28},{34,54}})));
      ElasticVesselWithSVandP atrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-05)
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent={{-6,-6},
                {6,6}},                                                                                  rotation=180,   origin={-38,32})));
      Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin={-52,18})));
      ElasticVesselWithSVandP ventricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=6e-05)
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
      Physiolibrary.Hydraulic.Components.IdealValve    atrioVentricularValve(
          useLimitationInputs=true)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      Physiolibrary.Hydraulic.Components.IdealValve    ventriculoArteryValve(
          useLimitationInputs=true)
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxABackflow(k = 0) annotation(Placement(transformation(extent={{-18,28},
                {-8,36}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst Rxv(k(displayUnit = "(mmHg.s)/ml") = 333305.9685375) annotation(Placement(transformation(extent={{-24,16},
                {-16,24}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst xR(k(displayUnit = "(mmHg.s)/ml") = 266644.77483) annotation(Placement(transformation(extent={{60,16},
                {68,24}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxVBackflow(k = 0) annotation(Placement(transformation(extent={{60,28},
                {70,36}})));
      Physiolibrary.Types.Constants.VolumeConst VxAU(k=5e-06)    annotation(Placement(transformation(extent={{-80,14},
                {-72,22}})));
      Physiolibrary.Types.Constants.VolumeConst VxVU(k=5e-06)    annotation(Placement(transformation(extent={{22,16},
                {30,24}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-102,52},{-82,72}}),  iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=270,
            origin={-9,115})));
      Modelica.Blocks.Sources.Constant AVGain(k=0.02)
        annotation (Placement(transformation(extent={{-5,-5},{5,5}},
            rotation=180,
            origin={-23,47})));
    equation
      connect(atrium.externalPressure, add.y) annotation (Line(
          points={{-52,8},{-52,11.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH,add.u2) annotation(Line(points={{-56,50},{-55.6,50},{-55.6,
              25.2}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(product.y,add.u1) annotation(Line(points={{-44.6,32},{-41.5,32},{
              -41.5,25.2},{-48.4,25.2}},                                                                      color = {0,0,127}, smooth = Smooth.None));
      connect(ventricle.pressure, product.u1) annotation (Line(
          points={{48.4,-10},{48,-10},{48,-16},{-26,-16},{-26,28},{-30,28},{-30,
              28.4},{-30.8,28.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow,atrium. q_in) annotation (Line(
          points={{-100,4.44089e-16},{-80,4.44089e-16},{-80,0},{-60,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PTH,ventricle. externalPressure) annotation (Line(
          points={{-56,50},{-56,56},{48,56},{48,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(VxAU.y,atrium. zeroPressureVolume) annotation (Line(
          points={{-71,18},{-70,18},{-70,8},{-68,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow,inflow) annotation(Line(points={{-100,4.44089e-16},{-100,
              4.44089e-16}},                                               color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(atrium.q_in, atrioVentricularValve.q_in) annotation (Line(
          points={{-60,0},{-20,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(atrioVentricularValve.q_out, ventricle.q_in) annotation (Line(
          points={{0,0},{40,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rxv.y, atrioVentricularValve.Gon) annotation (Line(
          points={{-15,20},{-16,20},{-16,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CxABackflow.y, atrioVentricularValve.Goff) annotation (Line(
          points={{-6.75,32},{-6.75,19.5},{-4,19.5},{-4,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, ventriculoArteryValve.q_in) annotation (Line(
          points={{40,0},{66,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventriculoArteryValve.q_out, outflow) annotation (Line(
          points={{86,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CxVBackflow.y, ventriculoArteryValve.Goff) annotation (Line(
          points={{71.25,32},{82,32},{82,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(xR.y, ventriculoArteryValve.Gon) annotation (Line(
          points={{69,20},{68,20},{68,10},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVGain.y, product.u2) annotation (Line(
          points={{-28.5,47},{-30.8,47},{-30.8,35.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance.Ct, atrium.compliance) annotation (Line(
          points={{-63.96,50.1},{-63.96,34.05},{-60,34.05},{-60,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrium.StressedVolume, atrialElastance.Vs) annotation (Line(
          points={{-64.4,10.2},{-64.4,28},{-98.3,28},{-98.3,37.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.compliance, ventricularElastance.Ct) annotation (Line(
          points={{40,8},{38,8},{38,50.1},{36.04,50.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.zeroPressureVolume, VxVU.y) annotation (Line(
          points={{32,8},{32,14},{32,20},{31,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.StressedVolume, ventricularElastance.Vs) annotation (
          Line(
          points={{35.6,10.2},{35.6,28},{1.7,28},{1.7,37.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance.HR, HR) annotation (Line(
          points={{-98.13,51.79},{-98.13,55.895},{-92,55.895},{-92,62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance.HR, HR) annotation (Line(
          points={{1.87,51.79},{1.87,62},{-92,62}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics={
                                                                                                    Text(extent={{
                  -10,-84},{36,-102}},                                                                                                 lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {85,170,255},
                fillPattern=FillPattern.Solid,
              textString="PTh"),                                                                                                    Text(extent={{
                  -32,102},{14,84}},                                                                                                   lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {85,170,255},
                fillPattern=FillPattern.Solid,
              textString="HR")}),                                                                                                    Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end SideOfHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      extends SideOfHeart(
        atrialElastance(
          Alpha=0.04,
          Beta=0.3,
          Tmax(displayUnit="ms") = 0.125,
          Tau(displayUnit="ms") = 0.02,
          AVDelay(displayUnit="ms"),
          Ees=33330596.85375),
        ventricularElastance(
          Alpha=0.024,
          Beta=0.34,
          Tmax(displayUnit="ms") = 0.2,
          Tau(displayUnit="ms") = 0.03,
          Ees=205316476.6191),
        VxAU(k=5e-06),
        VxVU(k=5e-06),
        Rxv(k=333305.9685375),
        CxABackflow(k=0),
        xR(k=266644.77483),
        CxVBackflow(k=0),
        atrium(volume_start=8.1e-05),
        ventricle(volume_start=0.000125));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end LeftHeart;

    model RightHeart
      extends Physiolibrary.Icons.RightHeart;
      extends SideOfHeart(
        VxAU(k=5e-06),
        VxVU(k=5e-06),
        atrialElastance(
          Alpha=0.04,
          Beta=0.3,
          Tmax(displayUnit="ms") = 0.125,
          Tau(displayUnit="ms") = 0.02,
          AVDelay(displayUnit="ms"),
          Ees=26664477.483),
        ventricularElastance(
          Alpha=0.024,
          Beta=0.34,
          Tmax(displayUnit="ms") = 0.2,
          Tau(displayUnit="ms") = 0.03,
          Ees=50662507.2177),
        Rxv(k=333305.9685375),
        CxABackflow(k=0),
        xR(k=266644.77483),
        CxVBackflow(k=0),
        atrium(volume_start=7.3e-05),
        ventricle(volume_start=0.000112));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end RightHeart;

    model SystemicCirculation
      extends Cardiovascular.SystemicCirculation;                     //Physiolibrary.Icons.SystemicCirculation;
      /*Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
      Placement(transformation(extent={{90,-12},{110,8}}),
        iconTransformation(extent={{-106,-12},{-86,8}})));
  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
      Placement(transformation(extent={{-108,-12},{-88,8}}),
        iconTransformation(extent={{88,-12},{108,8}})));
  */
        Parts.ElasticVesselWithSVandP AortaProximal(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=3.8e-05)
        annotation (Placement(transformation(extent={{42,-10},{62,10}})));
      Parts.ElasticVesselWithSVandP SystemicArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.000834)
        annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      Parts.ElasticVesselWithSVandP SystemicVeins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.002701)
        annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicProximalImpedance(useConductanceInput = true) annotation(Placement(transformation(extent={{88,-10},
                {66,10}})));
      Physiolibrary.Hydraulic.Components.Conductor ProximalAortaResistance(useConductanceInput = true) annotation(Placement(transformation(extent={{34,-10},
                {18,8}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicArterialResistance(useConductanceInput = true) annotation(Placement(transformation(extent={{-16,-10},
                {-34,10}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicVenousResistance(useConductanceInput = true) annotation(Placement(transformation(extent={{-86,-10},
                {-66,10}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsProx(k(
            displayUnit="(mmHg.s)/ml") = 2666447.7483)                                                                           annotation(Placement(transformation(extent={{66,24},
                {74,32}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsSys(k(displayUnit = "(mmHg.s)/ml") = 3199737.29796) annotation(Placement(transformation(extent={{18,12},
                {26,20}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RaSys(k(displayUnit = "(mmHg.s)/ml") = 99991790.56125) annotation(Placement(transformation(extent={{-36,16},
                {-28,24}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RvSys(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483)
        "Systemic Venous Characteristic Impedance"                                                                                                     annotation(Placement(transformation(extent={{-88,14},
                {-80,22}})));
      Physiolibrary.Types.Constants.VolumeConst UVaproxSys(k=3e-05)
        "Unstressed volume in proximal aorta"                                                                annotation(Placement(transformation(extent={{32,22},
                {40,30}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaproxSys(k=
            7.5006157584566e-10) "Pulmonary Proximal Aortic Capacitance"                                                                 annotation(Placement(transformation(extent={{40,32},
                {48,40}})));
      Physiolibrary.Types.Constants.VolumeConst UVaSys(k=0.0007)
        "Unstressed volume in systemic arteries"                                                            annotation(Placement(transformation(extent={{-20,16},
                {-12,24}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaSys(k(
            displayUnit="ml/mmHg") = 1.2751046789376e-08)
        "Systemic Artery Capacitance"                                                                                      annotation(Placement(transformation(extent={{-12,32},
                {-4,40}})));
      Physiolibrary.Types.Constants.VolumeConst UVvSys(k=0.00223)
        "Unstressed volume in systemic veins"                                                             annotation(Placement(transformation(extent={{-68,22},
                {-60,30}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CvSys(k(
            displayUnit="ml/mmHg") = 5.2504310309196e-07)
        "Systemnic Venous Capacitance "                                                                                      annotation(Placement(transformation(extent={{-64,34},
                {-56,42}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{50,44},
                {58,52}})));
      Physiolibrary.Types.Constants.PressureConst Pext(
                                                      k = 0) annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=180,
            origin={16,40})));
    equation
      connect(SystemicProximalImpedance.q_out,AortaProximal.q_in) annotation(Line(points={{66,0},{
              52,0}},                                                                                                    color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(RcsProx.y,SystemicProximalImpedance.cond) annotation(Line(points={{75,28},
              {77,28},{77,6}},                                                                                color = {0,0,127}, smooth = Smooth.None));
      connect(RcsSys.y,ProximalAortaResistance.cond) annotation(Line(points={{27,16},
              {26,16},{26,4.4}},                                                                           color = {0,0,127}, smooth = Smooth.None));
      connect(RaSys.y,SystemicArterialResistance.cond) annotation(Line(points={{-27,20},
              {-25,20},{-25,6}},                                                                          color = {0,0,127}, smooth = Smooth.None));
      connect(RvSys.y,SystemicVenousResistance.cond) annotation(Line(points={{-79,18},
              {-78,18},{-78,6},{-76,6}},                                                                       color = {0,0,127}, smooth = Smooth.None));
      connect(UVaproxSys.y,AortaProximal.zeroPressureVolume) annotation(Line(points={{41,26},
              {42,26},{42,8},{44,8}},                                                                                      color = {0,0,127}, smooth = Smooth.None));
      connect(CaproxSys.y,AortaProximal.compliance) annotation(Line(points={{49,36},
              {50,36},{50,8},{52,8}},                                                                             color = {0,0,127}, smooth = Smooth.None));
      connect(UVaSys.y,SystemicArteries.zeroPressureVolume) annotation(Line(points={{-11,20},
              {-10,20},{-10,8}},                                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(CaSys.y,SystemicArteries.compliance) annotation(Line(points={{-3,36},
              {-2,36},{-2,8}},                                                                        color = {0,0,127}, smooth = Smooth.None));
      connect(UVvSys.y,SystemicVeins.zeroPressureVolume) annotation(Line(points={{-59,26},
              {-62,26},{-62,8}},                                                                            color = {0,0,127}, smooth = Smooth.None));
      connect(CvSys.y,SystemicVeins.compliance) annotation(Line(points={{-55,38},
              {-54,38},{-54,8}},                                                                   color = {0,0,127}, smooth = Smooth.None));
      connect(PTH.y, AortaProximal.externalPressure) annotation (Line(
          points={{59,48},{60,48},{60,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AortaProximal.q_in, ProximalAortaResistance.q_in) annotation (
          Line(
          points={{52,0},{44,0},{44,-1},{34,-1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ProximalAortaResistance.q_out, SystemicArteries.q_in) annotation (
         Line(
          points={{18,-1},{10,-1},{10,0},{-2,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicArterialResistance.q_out, SystemicVeins.q_in) annotation (
         Line(
          points={{-34,0},{-54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicVenousResistance.q_out, SystemicVeins.q_in) annotation (
          Line(
          points={{-66,0},{-54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicArterialResistance.q_in, SystemicArteries.q_in)
        annotation (Line(
          points={{-16,0},{-2,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Pext.y, SystemicArteries.externalPressure) annotation (Line(
          points={{11,40},{6,40},{6,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVeins.externalPressure, Pext.y) annotation (Line(
          points={{-46,8},{-46,42},{11,42},{11,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVenousResistance.q_in, q_out) annotation (Line(
          points={{-86,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicProximalImpedance.q_in, q_in) annotation (Line(
          points={{88,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics),                                        Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end SystemicCirculation;

    model PulmonaryCirculation
      extends Cardiovascular.PulmonaryCirculation;                     //Physiolibrary.Icons.PulmonaryCirculation;
    /*  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
      Placement(transformation(extent={{-110,-12},{-90,8}}),
        iconTransformation(extent={{-110,-12},{-90,8}})));
  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
      Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  */
        Parts.ElasticVesselWithSVandP arteryProximal(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=3e-05)
        annotation (Placement(transformation(extent={{-62,12},{-42,32}})));
      Physiolibrary.Hydraulic.Components.Conductor proximalArteryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-38,-12},{-18,8}})));
      Parts.ElasticVesselWithSVandP artery(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.000802)
        annotation (Placement(transformation(extent={{-12,10},{8,30}})));
      Physiolibrary.Hydraulic.Components.Conductor arterialResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{10,-12},{30,8}})));
      Physiolibrary.Hydraulic.Components.Conductor proximalImpedance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));
      Parts.ElasticVesselWithSVandP veins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.000154)
        annotation (Placement(transformation(extent={{36,14},{56,34}})));
      Physiolibrary.Hydraulic.Components.Conductor venousResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{64,-10},{84,10}})));
      Physiolibrary.Types.Constants.VolumeConst UVap(k=2e-05)    annotation(Placement(transformation(extent={{-72,36},
                {-64,44}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaproxPulm(k=
            7.5006157584566e-09)                                                                  annotation(Placement(transformation(extent={{-60,48},
                {-52,56}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcPulm(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483) annotation(Placement(transformation(extent={{-40,14},
                {-32,22}})));
      Physiolibrary.Types.Constants.VolumeConst UVaP(k=0.0006)                  annotation(Placement(transformation(extent={{-22,38},
                {-14,46}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaPulm(k=
            1.5001231516913e-07)                                                              annotation(Placement(transformation(extent={{-14,52},
                {-6,60}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RaPulm(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483) annotation(Placement(transformation(extent = {{10,36},{18,44}})));
      Physiolibrary.Types.Constants.VolumeConst UVvP(k=0.0001)   annotation(Placement(transformation(extent={{28,40},
                {36,48}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CvPulm(k(
            displayUnit="ml/mmHg") = 5.2504310309196e-08)                                     annotation(Placement(transformation(extent={{36,54},
                {44,62}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RvPulm(k(
            displayUnit="(mmHg.s)/ml") = 1999835.811225)                                                                          annotation(Placement(transformation(extent = {{64,34},{72,42}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsPulm(k(
            displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{-92,14},{-84,22}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{-70,62},
                {-62,70}})));
    equation
      connect(UVap.y, arteryProximal.zeroPressureVolume) annotation (Line(
          points={{-63,40},{-62,40},{-62,30},{-60,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CaproxPulm.y, arteryProximal.compliance) annotation (Line(
          points={{-51,52},{-52,52},{-52,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(proximalArteryResistance.cond, RcPulm.y) annotation (Line(
          points={{-28,4},{-28,18},{-31,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(artery.zeroPressureVolume, UVaP.y) annotation (Line(
          points={{-10,28},{-12,28},{-12,42},{-13,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CaPulm.y, artery.compliance) annotation (Line(
          points={{-5,56},{-4,56},{-4,28},{-2,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arterialResistance.cond, RaPulm.y) annotation (Line(
          points={{20,4},{20,40},{19,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.zeroPressureVolume, UVvP.y) annotation (Line(
          points={{38,32},{36,32},{36,44},{37,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CvPulm.y, veins.compliance) annotation (Line(
          points={{45,58},{46,58},{46,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(proximalImpedance.q_out, arteryProximal.q_in) annotation (Line(
          points={{-68,-2},{-68,22},{-52,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteryProximal.q_in, proximalArteryResistance.q_in) annotation (
          Line(
          points={{-52,22},{-46,22},{-46,-2},{-38,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(proximalArteryResistance.q_out, artery.q_in) annotation (Line(
          points={{-18,-2},{-10,-2},{-10,20},{-2,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(artery.q_in, arterialResistance.q_in) annotation (Line(
          points={{-2,20},{4,20},{4,-2},{10,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arterialResistance.q_out, veins.q_in) annotation (Line(
          points={{30,-2},{38,-2},{38,24},{46,24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, venousResistance.q_in) annotation (Line(
          points={{46,24},{56,24},{56,0},{64,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venousResistance.cond, RvPulm.y) annotation (Line(
          points={{74,6},{74,38},{73,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RcsPulm.y, proximalImpedance.cond) annotation (Line(
          points={{-83,18},{-80,18},{-80,4},{-78,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, arteryProximal.externalPressure) annotation (Line(
          points={{-61,66},{-44,66},{-44,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, artery.externalPressure) annotation (Line(
          points={{-61,66},{6,66},{6,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, veins.externalPressure) annotation (Line(
          points={{-61,66},{54,66},{54,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(proximalImpedance.q_in, q_in) annotation (Line(
          points={{-88,-2},{-96,-2},{-96,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venousResistance.q_out, q_out) annotation (Line(
          points={{84,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics),                                                                      Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end PulmonaryCirculation;

    model AtrialElastance
      extends HeartIntervals;
      extends HeartElastance;
    equation
       Tsyst = Tasyst;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end AtrialElastance;

    model VentricularElastance
      extends HeartIntervals; //produces tvsyst and tasyst
      extends HeartElastance; //consumes tsyst from above
    equation
      Tsyst = Tvsyst;
    end VentricularElastance;

    model Heart
      extends Cardiovascular.Heart;
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-18,-32},{44,24}})));
      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-62,-32},{2,28}})));
      Physiolibrary.Types.Constants.FrequencyConst heartRate(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-76,40},{-68,48}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k=0)
        annotation (Placement(transformation(extent={{-64,-46},{-56,-38}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        bloodFlowMeasurement
        annotation (Placement(transformation(extent={{48,10},{68,30}})));
    equation
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-100,-20},{-66,-20},{-66,-1.4},{-31.28,-1.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-32.56,17.2},{-65.28,17.2},{-65.28,20},{-100,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.inflow, leftHeartInflow) annotation (Line(
          points={{11.76,-3.44},{55.88,-3.44},{55.88,-20},{100,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartRate.y, rightHeart.HR) annotation (Line(
          points={{-67,44},{-32.88,44},{-32.88,32.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, leftHeart.HR) annotation (Line(
          points={{-67,44},{10.21,44},{10.21,28.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, rightHeart.PTH) annotation (Line(
          points={{-55,-42},{-32.56,-42},{-32.56,-32.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, leftHeart.PTH) annotation (Line(
          points={{-55,-42},{10.52,-42},{10.52,-32.56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, bloodFlowMeasurement.q_in) annotation (Line(
          points={{10.52,13.92},{29.26,13.92},{29.26,20},{48,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{68,20},{100,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.HR, heartRate.y) annotation (Line(
          points={{58,29.4},{58,44},{-67,44}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Heart;
  end Parts;

  package Test
    model TestRightHeart "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.RightHeart;
      OldParts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-46,-36},{-6,6}})));
      OldParts.HeartElasticities heartElasticities
        annotation (Placement(transformation(extent={{-76,10},{-54,30}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent = {{-62,36},{-54,44}})));
      OldParts.GainConst AVGain(k=0.02)
        annotation (Placement(transformation(extent={{-94,-44},{-86,-36}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.1666666666667) annotation(Placement(transformation(extent = {{-94,84},{-86,92}})));
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit = "ms") = 0.16) annotation(Placement(transformation(extent = {{-102,14},{-94,22}})));
      OldParts.GainConst gain(k=0.02)
        annotation (Placement(transformation(extent={{-64,-2},{-56,6}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst hydraulicResistance2conductance(k(displayUnit = "(mmHg.s)/ml") = 1333.22387415) annotation(Placement(transformation(extent = {{-94,-32},{-86,-24}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 933.256711905) annotation(Placement(transformation(extent = {{-104,-20},{-84,0}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(useConductanceInput = true) annotation(Placement(transformation(extent = {{-62,-26},{-42,-6}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P = 3333.059685375) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {24,-2})));
    equation
      connect(heartElasticities.VEt0,rightHeart.VEt0) annotation(Line(points = {{-54.44,26.6},{-34.4,26.6},{-34.4,1.38}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(PTH.y,rightHeart.PTH) annotation(Line(points = {{-53,40},{-40,40},{-40,30},{-26,30},{-26,1.38}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(AVGain.y,rightHeart.AVGain) annotation(Line(points = {{-85,-40},{-64,-40},{-64,-28.02},{-42,-28.02}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(HeartRate.y,heartElasticities.HeartRate) annotation(Line(points = {{-85,88},{-82,88},{-82,26.4},{-75.34,26.4}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(AVDelay.y,heartElasticities.AVDelay) annotation(Line(points = {{-93,18},{-74.45999999999999,18}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(gain.y,rightHeart.AEt0) annotation(Line(points = {{-55,2},{-48,2},{-48,1.38},{-42.8,1.38}}, color = {0,0,127}, smooth = Smooth.None));
      connect(unlimitedVolume.y,conductor.q_in) annotation(Line(points = {{-84,-10},{-74,-10},{-74,-16},{-62,-16}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_out,rightHeart.port_a) annotation(Line(points = {{-42,-16},{-34,-16},{-34,-14.58},{-26.8,-14.58}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(hydraulicResistance2conductance.y,conductor.cond) annotation(Line(points = {{-85,-28},{-68,-28},{-68,-10},{-52,-10}}, color = {0,0,127}, smooth = Smooth.None));
      connect(unlimitedVolume1.y,rightHeart.port_b) annotation(Line(points = {{14,-2},{14,-2.4},{-16.8,-2.4}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestRightHeart;

    model TestElastance
      import BurkhoffModel;
      BurkhoffModel.Parts.HeartElastance AtrialElastance
        annotation (Placement(transformation(extent={{36,42},{70,68}})));
      BurkhoffModel.OldParts.GainConst RAAlpha(k=0.04)
        annotation (Placement(transformation(extent={{-6,58},{2,64}})));
      BurkhoffModel.OldParts.GainConst RABeta(k=0.3)
        annotation (Placement(transformation(extent={{2,52},{14,60}})));
      Physiolibrary.Types.Constants.HydraulicElastanceConst RAEes(k = 26664477.483) annotation(Placement(transformation(extent = {{8,66},{16,74}})));
      Modelica.Blocks.Sources.Ramp ramp(duration = 150, height = 0.00015, offset = 2e-005) annotation(Placement(transformation(extent = {{-70,0},{-50,20}})));
      BurkhoffModel.OldParts.GainConst AEt0(k=0.5)
        annotation (Placement(transformation(extent={{8,32},{20,42}})));
    equation
      connect(RAAlpha.y,AtrialElastance.Alpha) annotation(Line(points={{3,61},{
              22,61},{22,63.97},{34.81,63.97}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(RABeta.y,AtrialElastance.Beta) annotation(Line(points={{15.5,56},
              {24.5,56},{24.5,59.94},{34.64,59.94}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(RAEes.y,AtrialElastance.Ees) annotation(Line(points={{17,70},{26,
              70},{26,66.83},{34.81,66.83}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(ramp.y,AtrialElastance.Vs) annotation(Line(points={{-49,10},{-12,
              10},{-12,48},{30,48},{30,56.3},{34.64,56.3}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(AEt0.y,AtrialElastance.Et0) annotation(Line(points={{21.5,37},{
              21.5,43.5},{34.64,43.5},{34.64,50.06}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Text(extent=  {{-112,60},{-54,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AEt0"),Text(extent=  {{-62,60},{-4,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0"),Text(extent=  {{-16,60},{42,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "PTH"),Text(extent=  {{-76,-34},{26,-60}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVGain"),Text(extent=  {{-84,-84},{-42,-94}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Volume"),Text(extent=  {{-20,-84},{40,-92}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Stressed Volume")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestElastance;

    model TestPulmonary "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.CardioVascular;
      OldParts.PulmonaryCirculation1 pulmonaryCirculation
        annotation (Placement(transformation(extent={{-26,58},{18,110}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent = {{-62,36},{-54,44}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 933.256711905) annotation(Placement(transformation(extent = {{-86,72},{-66,92}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P = 3333.059685375) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {54,84})));
    equation
      connect(PTH.y,pulmonaryCirculation.intraThoracicPressure) annotation(Line(points = {{-53,40},{-48,40},{-48,94},{-4,94},{-4,96.48}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(unlimitedVolume.y,pulmonaryCirculation.bloodFlowInflow) annotation(Line(points = {{-66,82},{-48,82},{-48,83.48},{-26,83.48}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(unlimitedVolume1.y,pulmonaryCirculation.bloodFlowOutflow) annotation(Line(points = {{44,84},{18,84}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestPulmonary;

    model TestSystemic "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.SystemicCirculation;
      OldParts.SystemicCirculation1 systemicCirculation
        annotation (Placement(transformation(extent={{-46,-94},{4,-54}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent = {{-62,36},{-54,44}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 3333.059685375) annotation(Placement(transformation(extent = {{-84,-86},{-64,-66}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P = 933.256711905) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {52,-74})));
    equation
      connect(PTH.y,systemicCirculation.IntrathoracicPressure) annotation(Line(points = {{-53,40},{-38,40},{-38,30},{36,30},{36,-63.4},{-4.25,-63.4}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(unlimitedVolume.y,systemicCirculation.bloodflowOutflow) annotation(Line(points = {{-64,-76},{-54,-76},{-54,-74.40000000000001},{-45,-74.40000000000001}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(systemicCirculation.bloodflowInflow,unlimitedVolume1.y) annotation(Line(points = {{3.5,-74.40000000000001},{22.75,-74.40000000000001},{22.75,-74},{42,-74}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestSystemic;

    model TestLeftHeart "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.CardioVascular;
      OldParts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-14,-36},{28,4}})));
      OldParts.HeartElasticities heartElasticities
        annotation (Placement(transformation(extent={{-76,10},{-54,30}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent = {{-62,36},{-54,44}})));
      OldParts.GainConst AVGain(k=0.02)
        annotation (Placement(transformation(extent={{-94,-30},{-86,-22}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.1666666666667) annotation(Placement(transformation(extent = {{-94,84},{-86,92}})));
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit = "ms") = 0.16) annotation(Placement(transformation(extent = {{-102,14},{-94,22}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 933.256711905) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {62,-8})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P = 3333.059685375) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 0, origin = {-48,-6})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(useConductanceInput = true) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {30,-12})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst hydraulicResistance2conductance(k(displayUnit = "(mmHg.s)/ml") = 1333.22387415) annotation(Placement(transformation(extent = {{46,-58},{54,-50}})));
    equation
      connect(heartElasticities.AEt0,leftHeart.AEt0) annotation(Line(points = {{-54.22,22.2},{4.9,22.2},{4.9,1.2}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(heartElasticities.VEt0,leftHeart.VEt0) annotation(Line(points = {{-54.44,26.6},{14.56,26.6},{14.56,1.2}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(PTH.y,leftHeart.PTH) annotation(Line(points = {{-53,40},{-40,40},{-40,30},{24.22,30},{24.22,1.2}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(AVGain.y,leftHeart.AVGain) annotation(Line(points = {{-85,-26},{24.22,-26},{24.22,-26.4}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(HeartRate.y,heartElasticities.HeartRate) annotation(Line(points = {{-85,88},{-82,88},{-82,26.4},{-75.34,26.4}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(AVDelay.y,heartElasticities.AVDelay) annotation(Line(points = {{-93,18},{-74.45999999999999,18}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(unlimitedVolume1.y,leftHeart.outflow) annotation(Line(points = {{-38,-6},{-22,-6},{-22,2.8},{-4.34,2.8}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_out,leftHeart.inflow) annotation(Line(points = {{20,-12},{12,-12},{12,-12.4},{3.22,-12.4}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_in,unlimitedVolume.y) annotation(Line(points = {{40,-12},{46,-12},{46,-8},{52,-8}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(hydraulicResistance2conductance.y,conductor.cond) annotation(Line(points = {{55,-54},{42,-54},{42,-18},{30,-18}}, color = {0,0,127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestLeftHeart;

    model TestHeartElasticities
      "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.CardioVascular;
      OldParts.HeartElasticities heartElasticities
        annotation (Placement(transformation(extent={{-76,10},{-54,30}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.1666666666667) annotation(Placement(transformation(extent = {{-94,84},{-86,92}})));
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit = "ms") = 0.16) annotation(Placement(transformation(extent = {{-102,14},{-94,22}})));
    equation
      connect(HeartRate.y,heartElasticities.HeartRate) annotation(Line(points = {{-85,88},{-82,88},{-82,26.4},{-75.34,26.4}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(AVDelay.y,heartElasticities.AVDelay) annotation(Line(points = {{-93,18},{-74.45999999999999,18}}, color = {0,0,127}, smooth = Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end TestHeartElasticities;

    model Hemodynamics_pure
      "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.CardioVascular;
      OldParts.PulmonaryCirculation1 pulmonaryCirculation
        annotation (Placement(transformation(extent={{-16,58},{14,98}})));
      OldParts.SystemicCirculation1 systemicCirculation
        annotation (Placement(transformation(extent={{-14,-18},{12,2}})));
      OldParts.Heart_HI heart
        annotation (Placement(transformation(extent={{-30,16},{18,48}})));
    equation
      connect(pulmonaryCirculation.inflow, heart.rightHeartOutflow) annotation (
          Line(
          points={{-16,77.6},{-20,77.6},{-20,39.7714},{-9.42857,39.7714}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.outflow, heart.leftHeartInflow) annotation (Line(
          points={{14,78},{22,78},{22,33.8286},{7.02857,33.8286}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.leftHeartOutflow, systemicCirculation.inflow) annotation (Line(
          points={{2.91429,41.1429},{16,41.1429},{16,-8.2},{11.74,-8.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (Line(
          points={{-13.48,-8.2},{-16.2857,-8.2},{-16.2857,32.4571}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),            graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Hemodynamics_pure;
  end Test;

  package OldParts
    model RightHeart
      import BurkhoffModel;
      extends Physiolibrary.Icons.RightHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a annotation(Placement(transformation(extent = {{-114,-10},{-94,10}}), iconTransformation(extent = {{-14,-8},{6,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation(Placement(transformation(extent = {{90,-10},{110,10}}), iconTransformation(extent = {{36,50},{56,70}})));
      Modelica.Blocks.Interfaces.RealInput AEt0
        "VAtrial Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{-104,60},{-82,82}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {-84,78})));
      Modelica.Blocks.Interfaces.RealInput VEt0
        "Ventricular Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{-8,52},{22,82}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {-42,78})));
      Physiolibrary.Types.RealIO.PressureInput PTH "Intrathoracic Pressure" annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-56,50}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {0,78})));
      Modelica.Blocks.Interfaces.RealInput AVGain
        "Ventricular-Atrial Interconnection Gain"                                           annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin = {-38,52}), iconTransformation(extent = {{-100,-82},{-60,-42}})));
      Physiolibrary.Types.RealIO.VolumeOutput Volume annotation(Placement(transformation(extent = {{44,-88},{64,-68}}), iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {-62,-108})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent = {{-44,-90},{-24,-70}}), iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {6,-108})));
      BurkhoffModel.Parts.HeartElastance AtrialElastance
        annotation (Placement(transformation(extent={{-50,68},{-16,94}})));
      BurkhoffModel.Parts.HeartElastance VentricularElastance
        annotation (Placement(transformation(extent={{42,68},{76,94}})));
      BurkhoffModel.OldParts.GainConst RAAlpha(k=0.04)
        annotation (Placement(transformation(extent={{-92,84},{-84,90}})));
      BurkhoffModel.OldParts.GainConst RABeta(k=0.3)
        annotation (Placement(transformation(extent={{-80,80},{-72,86}})));
      Physiolibrary.Types.Constants.HydraulicElastanceConst RVEes(k=
            50662507.2177)                                                           annotation(Placement(transformation(extent = {{14,90},{22,96}})));
      BurkhoffModel.OldParts.GainConst RVAlpha(k=0.024)
        annotation (Placement(transformation(extent={{2,84},{10,90}})));
      BurkhoffModel.OldParts.GainConst RVBeta(k=0.34)
        annotation (Placement(transformation(extent={{14,78},{22,84}})));
      BurkhoffModel.Parts.ElasticVesselWithSVandP RightAtrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-005)
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 270, origin = {-35,37})));
      Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin = {-52,22})));
      BurkhoffModel.Parts.ElasticVesselWithSVandP RightVentricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=6e-005)
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {-64,24})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {40,26})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve tricupsidValve annotation(Placement(transformation(extent = {{-20,-10},{0,10}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve pulmonicValve annotation(Placement(transformation(extent = {{66,-10},{86,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRABackflow(k = 0) annotation(Placement(transformation(extent = {{-24,16},{-18,22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst Rtv(k(displayUnit = "(mmHg.s)/ml") = 333305.9685375) annotation(Placement(transformation(extent = {{-14,26},{-6,34}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RR(k(displayUnit = "(mmHg.s)/ml") = 266644.77483) annotation(Placement(transformation(extent = {{60,28},{68,36}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRVBackflow(k = 0) annotation(Placement(transformation(extent = {{52,18},{60,26}})));
      Physiolibrary.Types.Constants.VolumeConst VRAU(k = 5e-006) annotation(Placement(transformation(extent = {{-82,16},{-74,24}})));
      Physiolibrary.Types.Constants.VolumeConst VRVU(k=5e-06)    annotation(Placement(transformation(extent = {{16,20},{24,28}})));
      Modelica.Blocks.Math.Add stressedVolume annotation(Placement(transformation(extent = {{-74,-88},{-54,-68}})));
      Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent = {{14,-86},{34,-66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceConst RAEes(k = 26664477.483) annotation(Placement(transformation(extent = {{-78,92},{-70,100}})));
    equation
      connect(Volume,Volume) annotation(Line(points = {{54,-78},{54,-78}}, color = {0,0,127}, smooth = Smooth.None));
      connect(AEt0,AtrialElastance.Et0) annotation(Line(points={{-93,71},{-72.5,
              71},{-72.5,76.06},{-51.36,76.06}},                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(VEt0,VentricularElastance.Et0) annotation(Line(points={{7,67},{
              26.5,67},{26.5,76.06},{40.64,76.06}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(RAAlpha.y,AtrialElastance.Alpha) annotation(Line(points={{-83,87},
              {-64,87},{-64,89.97},{-51.19,89.97}},                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(RABeta.y,AtrialElastance.Beta) annotation(Line(points={{-71,83},{
              -61.5,83},{-61.5,85.94},{-51.36,85.94}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(VentricularElastance.Ees,RVEes.y) annotation(Line(points={{40.81,
              92.83},{32,92.83},{32,93},{23,93}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(VentricularElastance.Alpha,RVAlpha.y) annotation(Line(points={{40.81,
              89.97},{26,89.97},{26,87},{11,87}},                                                                        color = {0,0,127}, smooth = Smooth.None));
      connect(RVBeta.y,VentricularElastance.Beta) annotation(Line(points={{23,81},
              {31.5,81},{31.5,85.94},{40.64,85.94}},                                                                       color = {0,0,127}, smooth = Smooth.None));
      connect(AVGain,product.u2) annotation(Line(points = {{-38,52},{-38,43}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightAtrium.externalPressure,add.y) annotation(Line(points = {{-52,8},{-52,15.4}}, color = {0,0,127}, smooth = Smooth.None));
      connect(PTH,add.u2) annotation(Line(points = {{-56,50},{-55.6,50},{-55.6,29.2}}, color = {0,0,127}, smooth = Smooth.None));
      connect(product.y,add.u1) annotation(Line(points = {{-35,31.5},{-41.5,31.5},{-41.5,29.2},{-48.4,29.2}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightVentricle.pressure,product.u1) annotation(Line(points = {{48.4,-10},{60,-10},{60,-24},{-26,-24},{-26,46},{-32,46},{-32,43}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance.y,RightAtrium.compliance) annotation(Line(points = {{-64,19},{-62,19},{-62,8},{-60,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance.hydraulicelastance,AtrialElastance.Et) annotation(Line(points = {{-64.09999999999999,28.1},{-64.09999999999999,60},{-8,60},{-8,90.09999999999999},{-13.96,90.09999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance1.y,RightVentricle.compliance) annotation(Line(points = {{40,21},{40,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance1.hydraulicelastance,VentricularElastance.Et) annotation(Line(points = {{39.9,30.1},{39.9,60},{82,60},{82,90.09999999999999},{78.04000000000001,90.09999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(port_a,RightAtrium.q_in) annotation(Line(points = {{-104,0},{-60,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(RightAtrium.q_in,tricupsidValve.bloodFlowInflow) annotation(Line(points = {{-60,0},{-40,0},{-40,-0.2},{-19.8,-0.2}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(tricupsidValve.bloodFlowOutflow,RightVentricle.q_in) annotation(Line(points = {{0,0},{40,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(RightVentricle.q_in,pulmonicValve.bloodFlowInflow) annotation(Line(points = {{40,0},{54,0},{54,-0.2},{66.2,-0.2}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(pulmonicValve.bloodFlowOutflow,port_b) annotation(Line(points = {{86,0},{100,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(CRABackflow.y,tricupsidValve.inflowConductance) annotation(Line(points = {{-17.25,19},{-17.4,19},{-17.4,7.6}}, color = {0,0,127}, smooth = Smooth.None));
      connect(Rtv.y,tricupsidValve.outflowResistance) annotation(Line(points = {{-5,30},{-4,30},{-4,8.800000000000001},{-4.8,8.800000000000001}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RR.y,pulmonicValve.outflowResistance) annotation(Line(points = {{69,32},{82,32},{82,8.800000000000001},{81.2,8.800000000000001}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CRVBackflow.y,pulmonicValve.inflowConductance) annotation(Line(points = {{61,22},{64,22},{64,7.6},{68.59999999999999,7.6}}, color = {0,0,127}, smooth = Smooth.None));
      connect(PTH,RightVentricle.externalPressure) annotation(Line(points = {{-56,50},{-56,56},{48,56},{48,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(VRAU.y,RightAtrium.zeroPressureVolume) annotation(Line(points = {{-73,20},{-70,20},{-70,8},{-68,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(VRVU.y,RightVentricle.zeroPressureVolume) annotation(Line(points = {{25,24},{28,24},{28,8},{32,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(stressedVolume.y,StressedVolume) annotation(Line(points = {{-53,-78},{-46,-78},{-46,-80},{-34,-80}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightVentricle.StressedVolume,VentricularElastance.Vs) annotation(Line(points={{32,
              -10.2},{22,-10.2},{22,-10},{2,-10},{2,74},{24,74},{24,78},{36,78},
              {36,77.62},{39.96,77.62}},                                                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(RightVentricle.StressedVolume,stressedVolume.u1) annotation(Line(points = {{32,-10.2},{18,-10.2},{18,-10},{2,-10},{2,-60},{-80,-60},{-80,-72},{-76,-72}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightAtrium.StressedVolume,stressedVolume.u2) annotation(Line(points = {{-68,-10.2},{-68,-20},{-90,-20},{-90,-84},{-76,-84}}, color = {0,0,127}, smooth = Smooth.None));
      connect(add1.y,Volume) annotation(Line(points = {{35,-76},{40,-76},{40,-78},{54,-78}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightVentricle.volume,add1.u1) annotation(Line(points = {{40,-10},{40,-60},{12,-60},{12,-70}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightAtrium.volume,add1.u2) annotation(Line(points = {{-60,-10},{-60,-36},{-12,-36},{-12,-82},{12,-82}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RightAtrium.StressedVolume,AtrialElastance.Vs) annotation(Line(points={{-68,
              -10.2},{-78,-10.2},{-78,-10},{-96,-10},{-96,78},{-58,78},{-58,
              77.62},{-52.04,77.62}},                                                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(port_a,port_a) annotation(Line(points = {{-104,0},{-104,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(RAEes.y,AtrialElastance.Ees) annotation(Line(points={{-69,96},{
              -60,96},{-60,92.83},{-51.19,92.83}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Text(extent=  {{-112,60},{-54,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AEt0"),Text(extent=  {{-62,60},{-4,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0"),Text(extent=  {{-16,60},{42,38}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "PTH"),Text(extent=  {{-76,-34},{26,-60}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVGain"),Text(extent=  {{-84,-84},{-42,-94}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Volume"),Text(extent=  {{-20,-84},{40,-92}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Stressed Volume")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end RightHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}), iconTransformation(extent = {{-28,8},{-8,28}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}}), iconTransformation(extent = {{-64,84},{-44,104}})));
      Modelica.Blocks.Interfaces.RealInput AEt0
        "VAtrial Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{-72,68},{-60,80}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {-10,86})));
      Modelica.Blocks.Interfaces.RealInput VEt0
        "Ventricular Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{20,52},{36,68}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {36,86})));
      Physiolibrary.Types.RealIO.PressureInput PTH "Intrathoracic Pressure" annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-58,56}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {82,86})));
      Modelica.Blocks.Interfaces.RealInput AVGain
        "Ventricular-Atrial Interconnection Gain"                                           annotation(Placement(transformation(extent = {{-8,-8},{8,8}}, rotation = 270, origin = {-46,46}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 180, origin = {82,-52})));
      Physiolibrary.Types.RealIO.VolumeOutput Volume annotation(Placement(transformation(extent = {{62,-100},{82,-80}}), iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {10,-100})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent = {{-30,-96},{-10,-76}}), iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {66,-102})));
      Parts.ElasticVesselWithSVandP LeftAtrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-05)
        annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve MitralValve annotation(Placement(transformation(extent = {{-42,-38},{-22,-18}})));
      Parts.ElasticVesselWithSVandP LeftVentricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=6e-05)
        annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve aorticValve annotation(Placement(transformation(extent = {{32,-10},{52,10}})));
      Parts.HeartElastance AtrialElastance
        annotation (Placement(transformation(extent={{-52,64},{-10,94}})));
      Parts.HeartElastance VentricularElastance
        annotation (Placement(transformation(extent={{38,64},{78,94}})));
      GainConst LAAlpha(k=0.04)
        annotation (Placement(transformation(extent={{-100,78},{-92,86}})));
      GainConst LABeta(k=0.3)
        annotation (Placement(transformation(extent={{-100,66},{-92,74}})));
      GainConst LVAlpha(k=0.024)
        annotation (Placement(transformation(extent={{2,80},{12,88}})));
      GainConst LVBeta(k=0.34)
        annotation (Placement(transformation(extent={{0,68},{8,76}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 270, origin = {-41,29})));
      Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {-56,16})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {-64,30})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {4,32})));
      Physiolibrary.Types.Constants.VolumeConst VRAU(k=5e-06)    annotation(Placement(transformation(extent = {{-92,28},{-82,40}})));
      Physiolibrary.Types.Constants.VolumeConst VRVU(k=5e-06)    annotation(Placement(transformation(extent = {{-14,22},{-6,30}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RAorticValve(k(displayUnit = "(mmHg.s)/ml") = 266644.77483) annotation(Placement(transformation(extent = {{36,30},{44,38}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CAorticValveBackflow(k = 0) annotation(Placement(transformation(extent = {{24,18},{32,26}})));
      Modelica.Blocks.Math.Add stressedVolume annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 0, origin = {-42,-86})));
      Modelica.Blocks.Math.Add volume annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 0, origin = {44,-86})));
      Physiolibrary.Types.Constants.HydraulicElastanceConst LAEes(k=
            33330596.85375)                                                           annotation(Placement(transformation(extent = {{-96,90},{-88,98}})));
      Physiolibrary.Types.Constants.HydraulicElastanceConst LVEes(k=
            205316476.6191)                                                           annotation(Placement(transformation(extent = {{2,94},{10,102}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst Rmv(k(displayUnit = "(mmHg.s)/ml") = 333305.9685375) annotation(Placement(transformation(extent = {{-36,8},{-28,16}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CmitralValveBackflow(k(displayUnit = "ml/(mmHg.s)") = 0) annotation(Placement(transformation(extent = {{-46,-6},{-38,2}})));
    equation
      connect(StressedVolume,StressedVolume) annotation(Line(points = {{-20,-86},{-20,-86}}, color = {0,0,127}, smooth = Smooth.None));
      connect(Volume,Volume) annotation(Line(points = {{72,-90},{72,-90}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(inflow,LeftAtrium.q_in) annotation(Line(points = {{-100,0},{-64,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(LeftAtrium.q_in,MitralValve.bloodFlowInflow) annotation(Line(points = {{-64,0},{-52,0},{-52,-28.2},{-41.8,-28.2}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(MitralValve.bloodFlowOutflow,LeftVentricle.q_in) annotation(Line(points = {{-22,-28},{-10,-28},{-10,0},{4,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(LeftVentricle.q_in,aorticValve.bloodFlowInflow) annotation(Line(points = {{4,0},{20,0},{20,-0.2},{32.2,-0.2}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(aorticValve.bloodFlowOutflow,outflow) annotation(Line(points = {{52,0},{100,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(AEt0,AtrialElastance.Et0) annotation(Line(points={{-66,74},{-64,
              74},{-64,73.3},{-53.68,73.3}},                                                                   color = {0,0,127}, smooth = Smooth.None));
      connect(VEt0,VentricularElastance.Et0) annotation(Line(points={{28,60},{
              30,60},{30,73.3},{36.4,73.3}},                                                                   color = {0,0,127}, smooth = Smooth.None));
      connect(LAAlpha.y,AtrialElastance.Alpha) annotation(Line(points={{-91,82},
              {-76,82},{-76,90},{-64,90},{-64,89.35},{-53.47,89.35}},                                                                                             color = {0,0,127}, smooth = Smooth.None));
      connect(LABeta.y,AtrialElastance.Beta) annotation(Line(points={{-91,70},{
              -74,70},{-74,84.7},{-53.68,84.7}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(LVAlpha.y,VentricularElastance.Alpha) annotation(Line(points={{13.25,
              84},{26,84},{26,89.35},{36.6,89.35}},                                                                                                color = {0,0,127}, smooth = Smooth.None));
      connect(LVBeta.y,VentricularElastance.Beta) annotation(Line(points={{9,72},{
              18,72},{18,82},{28,82},{28,84.7},{36.4,84.7}},                                                                       color = {0,0,127}, smooth = Smooth.None));
      connect(AVGain,product.u2) annotation(Line(points = {{-46,46},{-46,35},{-44,35}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LeftVentricle.pressure,product.u1) annotation(Line(points = {{12.4,-10},{12,-10},{12,-22},{-18,-22},{-18,38},{-38,38},{-38,35}}, color = {0,0,127}, smooth = Smooth.None));
      connect(product.y,add.u1) annotation(Line(points = {{-41,23.5},{-52.5,23.5},{-52.5,20.8},{-53.6,20.8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(add.y,LeftAtrium.externalPressure) annotation(Line(points = {{-56,11.6},{-56,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(PTH,add.u2) annotation(Line(points = {{-58,56},{-58,20.8},{-58.4,20.8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(PTH,LeftVentricle.externalPressure) annotation(Line(points = {{-58,56},{12,56},{12,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance.y,LeftAtrium.compliance) annotation(Line(points = {{-64,25},{-64,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance.hydraulicelastance,AtrialElastance.Et) annotation(Line(points = {{-64.09999999999999,34.1},{-64.09999999999999,60},{-7.48,60},{-7.48,89.5}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance1.y,LeftVentricle.compliance) annotation(Line(points = {{4,27},{4,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance1.hydraulicelastance,VentricularElastance.Et) annotation(Line(points = {{3.9,36.1},{3.9,44},{80.40000000000001,44},{80.40000000000001,89.5}}, color = {0,0,127}, smooth = Smooth.None));
      connect(VRAU.y,LeftAtrium.zeroPressureVolume) annotation(Line(points = {{-80.75,34},{-74,34},{-74,8},{-72,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(VRVU.y,LeftVentricle.zeroPressureVolume) annotation(Line(points = {{-5,26},{-4,26},{-4,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RAorticValve.y,aorticValve.outflowResistance) annotation(Line(points = {{45,34},{46,34},{46,8.800000000000001},{47.2,8.800000000000001}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CAorticValveBackflow.y,aorticValve.inflowConductance) annotation(Line(points = {{33,22},{34,22},{34,7.6},{34.6,7.6}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LeftVentricle.StressedVolume,VentricularElastance.Vs) annotation(Line(points={{-4,
              -10.2},{-4,-18},{18,-18},{18,70},{26,70},{26,80.5},{36.4,80.5}},                                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(LeftAtrium.StressedVolume,AtrialElastance.Vs) annotation(Line(points={{-72,
              -10.2},{-72,-22},{-94,-22},{-94,60},{-70,60},{-70,80.5},{-53.68,
              80.5}},                                                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(LeftAtrium.StressedVolume,stressedVolume.u2) annotation(Line(points = {{-72,-10.2},{-72,-88.40000000000001},{-46.8,-88.40000000000001}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LeftVentricle.StressedVolume,stressedVolume.u1) annotation(Line(points = {{-4,-10.2},{-4,-74},{-50,-74},{-50,-83.59999999999999},{-46.8,-83.59999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LeftAtrium.volume,volume.u2) annotation(Line(points = {{-64,-10},{-64,-64},{14,-64},{14,-88.40000000000001},{39.2,-88.40000000000001}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LeftVentricle.volume,volume.u1) annotation(Line(points = {{4,-10},{4,-62},{20,-62},{20,-83.59999999999999},{39.2,-83.59999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(stressedVolume.y,StressedVolume) annotation(Line(points = {{-37.6,-86},{-20,-86}}, color = {0,0,127}, smooth = Smooth.None));
      connect(volume.y,Volume) annotation(Line(points = {{48.4,-86},{58,-86},{58,-90},{72,-90}}, color = {0,0,127}, smooth = Smooth.None));
      connect(LAEes.y,AtrialElastance.Ees) annotation(Line(points={{-87,94},{
              -70,94},{-70,92.65},{-53.47,92.65}},                                                                                          color = {0,0,127}, smooth = Smooth.None));
      connect(LVEes.y,VentricularElastance.Ees) annotation(Line(points={{11,98},
              {24,98},{24,92.65},{36.6,92.65}},                                                                                             color = {0,0,127}, smooth = Smooth.None));
      connect(Rmv.y,MitralValve.outflowResistance) annotation(Line(points = {{-27,12},{-26.8,12},{-26.8,-19.2}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CmitralValveBackflow.y,MitralValve.inflowConductance) annotation(Line(points = {{-37,-2},{-32,-2},{-32,-10},{-39.4,-10},{-39.4,-20.4}}, color = {0,0,127}, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Text(extent=  {{-40,66},{18,44}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AEt0"),Text(extent=  {{8,66},{66,44}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0"),Text(extent=  {{52,68},{110,46}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "PTH"),Text(extent=  {{-28,-32},{70,-52}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVGain"),Text(extent=  {{-40,-72},{28,-82}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Volume"),Text(extent=  {{30,-74},{102,-84}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Stressed Volume")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end LeftHeart;

    model Hemodynamics "model of hemodynamics by Burkhoff in Physiolibrary"
      extends Physiolibrary.Icons.CardioVascular;
      PulmonaryCirculation1 pulmonaryCirculation
        annotation (Placement(transformation(extent={{-26,58},{18,110}})));
      PressureFlowMeasurement MeasurementPumlonaryArtery annotation (Placement(
            transformation(
            origin={-38.5,52.5},
            extent={{-12.5,17.5},{12.5,-17.5}},
            rotation=90)));
      PressureFlowMeasurement MeasurementPulmonaryVein annotation (Placement(
            transformation(
            origin={23,54},
            extent={{-10,19},{10,-19}},
            rotation=270)));
      SystemicCirculation1 systemicCirculation
        annotation (Placement(transformation(extent={{-46,-94},{4,-54}})));
      PressureFlowMeasurement MeasurementVein annotation (Placement(
            transformation(
            origin={-58.5,-50.5},
            extent={{-15.5,-20.5},{15.5,20.5}},
            rotation=90)));
      PressureFlowMeasurement MeasurementAorta annotation (Placement(
            transformation(
            origin={43.5,-56.5},
            extent={{-15.5,-20.5},{15.5,20.5}},
            rotation=270)));
      HeartElasticities heartElasticities annotation (Placement(transformation(
            extent={{-11,-10},{11,10}},
            rotation=270,
            origin={-7,32})));
      OldParts.BloodVolume bloodVolume
        annotation (Placement(transformation(extent={{14,-112},{44,-88}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{-90,58},
                {-82,66}})));
      GainConst AVGain(k=0.02)
        annotation (Placement(transformation(extent={{-56,-28},{-48,-20}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.1666666666667) annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=270,
            origin={-2,66})));
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit = "ms") = 0.16) annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=270,
            origin={-8,52})));
      OldParts.RightHeart rightHeart annotation (Placement(visible=true,
            transformation(
            origin={-23,-17},
            extent={{-23,-23},{23,23}},
            rotation=0)));
      OldParts.LeftHeart leftHeart annotation (Placement(visible=true,
            transformation(
            origin={15,-18},
            extent={{-19,-22},{19,22}},
            rotation=0)));
    equation
      connect(leftHeart.Volume,bloodVolume.LeftHeartBloodVolume) annotation(Line(points={{16.9,
              -40},{10,-40},{10,-48},{10,-50},{23.6,-50},{23.6,-88.72}},                                                                                                color = {0,0,127}, pattern = LinePattern.Dot, smooth = Smooth.Bezier));
      connect(leftHeart.StressedVolume,bloodVolume.LeftHeartStressedVolume) annotation(Line(points={{27.54,
              -40.44},{20.86,-40.44},{27.5,-40.44},{27.5,-88.96}},                                                                                                    color = {0,0,127}, pattern = LinePattern.Dot, smooth = Smooth.Bezier));
      connect(AVGain.y,leftHeart.AVGain) annotation(Line(points={{-47,-24},{
              30.58,-24},{30.58,-29.44}},                                                                    color = {0,0,127}, smooth = Smooth.Bezier));
      connect(PTH.y,leftHeart.PTH) annotation(Line(points={{-81,62},{-40,62},{
              -40,30},{30.58,30},{30.58,0.92}},                                                                     color = {0,0,127}, pattern = LinePattern.Dash, smooth = Smooth.Bezier));
      connect(heartElasticities.VEt0,leftHeart.VEt0) annotation(Line(points={{-0.4,
              21.44},{21.84,21.44},{21.84,0.92}},                                                                        color = {0,0,127}, smooth = Smooth.Bezier));
      connect(heartElasticities.AEt0,leftHeart.AEt0) annotation(Line(points={{-4.8,
              21.22},{13.1,21.22},{13.1,0.92}},                                                                       color = {0,0,127}, smooth = Smooth.Bezier));
      connect(MeasurementPulmonaryVein.Outflow,leftHeart.inflow) annotation(Line(points={{23,44.2},
              {24,44.2},{24,22},{40,22},{40,-12.4},{11.58,-12.4},{11.58,-14.04}},                                                                                            thickness=1,   smooth=Smooth.
              Bezier,
          color={127,0,0}));
      connect(rightHeart.StressedVolume,bloodVolume.RightHeartStressedVolume) annotation(Line(points = {{-21.62,-41.84},{-24,-41.84},{-24,-52},{19.4,-52},{19.4,-88.95999999999999}}, color = {0,0,127}, pattern = LinePattern.Dot, smooth = Smooth.Bezier));
      connect(rightHeart.Volume,bloodVolume.RightHeartBloodVolume) annotation(Line(points = {{-37.26,-41.84},{-38.4,-41.84},{15.8,-56},{15.8,-88.95999999999999}}, color = {0,0,127}, pattern = LinePattern.Dot, smooth = Smooth.Bezier));
      connect(AVGain.y,rightHeart.AVGain) annotation(Line(points={{-47,-24},{
              -47,-24},{-41.4,-24},{-41.4,-31.26}},                                                                     color = {0,0,127}, smooth = Smooth.Bezier));
      connect(PTH.y,rightHeart.PTH) annotation(Line(points={{-81,62},{-40,62},{
              -40,30},{-40,0.94},{-23,0.94}},                                                                                                color = {0,0,127}, pattern = LinePattern.Dash, smooth = Smooth.Bezier));
      connect(heartElasticities.VEt0,rightHeart.VEt0) annotation(Line(points={{-0.4,
              21.44},{-32.66,21.44},{-32.66,0.94}},                                                                                                    color = {0,0,127}, smooth = Smooth.Bezier));
      connect(heartElasticities.AEt0,rightHeart.AEt0) annotation(Line(points={{-4.8,
              21.22},{-4.8,22},{-42,22},{-42,12},{-42.32,12},{-42.32,0.94}},                                                                                          color = {0,0,127}, smooth = Smooth.Bezier));
      connect(MeasurementVein.Outflow,rightHeart.port_a) annotation(Line(points = {{-58.5,-35.31},{-58.5,-26},{-58.5,-16.54},{-23.92,-16.54}}, thickness=1,   smooth=Smooth.
              Bezier,
          color={127,0,0}));
      connect(rightHeart.port_b,MeasurementPumlonaryArtery.Inflow) annotation(Line(points={{-12.42,
              -3.2},{-16.8,-3.2},{-16.8,4},{-16.8,10},{-38.15,10},{-38.15,40.25}},                                                                                    thickness=1,   smooth=Smooth.
              Bezier,
          color={127,0,0}));
      connect(pulmonaryCirculation.PulmonaryBloodVolume,bloodVolume.PulmonaryBloodVolume) annotation(Line(points = {{-17.64,74.12},{-17.64,66},{8,66},{8,8},{32,8},{32,-88.95999999999999}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dot));
      connect(pulmonaryCirculation.PulmonaryStressedVolume,bloodVolume.PulmonaryStressedVolume) annotation(Line(points = {{9.199999999999999,75.16},{9.199999999999999,12},{35.6,12},{35.6,-88.95999999999999}}, color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dot));
      connect(PTH.y,pulmonaryCirculation.intraThoracicPressure) annotation(Line(points={{-81,62},
              {-48,62},{-48,94},{-4,94},{-4,96.48}},                                                                                      color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(bloodVolume.SystemicStressedVolume,systemicCirculation.SystemicStressedVolume) annotation(Line(points = {{12.2,-92.56},{5.1,-92.56},{5.1,-87.2},{-2,-87.2}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(bloodVolume.SystemicBloodVolume,systemicCirculation.SystemicBloodVolume) annotation(Line(points = {{12.2,-96.16},{-13.9,-96.16},{-13.9,-86.8},{-40,-86.8}}, color = {0,0,127}, smooth = Smooth.Bezier));
      connect(PTH.y,systemicCirculation.IntrathoracicPressure) annotation(Line(points={{-81,62},
              {-38,62},{-38,30},{36,30},{36,-63.4},{-4.25,-63.4}},                                                                                     color = {0,0,127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(HeartRate.y, heartElasticities.HeartRate) annotation (Line(
          points={{-2,61},{-2,42.34},{-0.6,42.34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVDelay.y, heartElasticities.AVDelay) annotation (Line(
          points={{-8,47},{-8,50},{-9,50},{-9,41.46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, MeasurementAorta.HR) annotation (Line(
          points={{-2,61},{10,61},{10,32},{72,32},{72,-56.5},{57.44,-56.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, MeasurementAorta.Inflow) annotation (Line(
          points={{4.74,2.68},{4.74,12},{43.91,12},{43.91,-41.31}},
          color={127,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(systemicCirculation.bloodflowOutflow, MeasurementVein.Inflow)
        annotation (Line(
          points={{-45,-74.4},{-58.91,-74.4},{-58.91,-65.69}},
          color={127,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(systemicCirculation.bloodflowInflow, MeasurementAorta.Outflow)
        annotation (Line(
          points={{3.5,-74.4},{43.5,-74.4},{43.5,-71.69}},
          color={127,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(MeasurementPumlonaryArtery.Outflow, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{-38.5,64.75},{-38.5,83.48},{-26,83.48}},
          color={127,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pulmonaryCirculation.bloodFlowOutflow, MeasurementPulmonaryVein.Inflow)
        annotation (Line(
          points={{18,84},{18,84},{18,63.8},{22.62,63.8}},
          color={127,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(HeartRate.y, MeasurementPulmonaryVein.HR) annotation (Line(
          points={{-2,61},{10.08,61},{10.08,54}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(HeartRate.y, MeasurementVein.HR) annotation (Line(
          points={{-2,61},{-40,61},{-40,22},{-72.44,22},{-72.44,-50.5}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(HeartRate.y, MeasurementPumlonaryArtery.HR) annotation (Line(
          points={{-2,61},{-12,61},{-12,60},{-20,60},{-20,52.5},{-26.6,52.5}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end Hemodynamics;

    model BloodVolume
      Physiolibrary.Types.RealIO.VolumeInput RightHeartBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin = {-88,92})));
      Physiolibrary.Types.RealIO.VolumeInput RightHeartStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin = {-64,92})));
      Physiolibrary.Types.RealIO.VolumeInput LeftHeartBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={-36,94})));
      Physiolibrary.Types.RealIO.VolumeInput LeftHeartStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin={-10,92})));
      Physiolibrary.Types.RealIO.VolumeInput PulmonaryBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin = {20,92})));
      Physiolibrary.Types.RealIO.VolumeInput PulmonaryStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 270, origin = {44,92})));
      Physiolibrary.Types.RealIO.VolumeInput SystemicBloodVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 0, origin = {-112,32})));
      Physiolibrary.Types.RealIO.VolumeInput SystemicStressedVolume annotation(Placement(transformation(extent = {{-90,70},{-50,110}}), iconTransformation(extent = {{-12,-12},{12,12}}, rotation = 0, origin = {-112,62})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,16},{108,36}})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodStressedVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,-6},{108,14}})));
      Physiolibrary.Types.RealIO.VolumeOutput TotalBloodUnstressedVolume annotation(Placement(transformation(extent = {{88,16},{108,36}}), iconTransformation(extent = {{88,-30},{108,-10}})));
    equation
      TotalBloodVolume = RightHeartBloodVolume +LeftHeartBloodVolume+ PulmonaryBloodVolume + SystemicBloodVolume;
      TotalBloodStressedVolume = RightHeartStressedVolume + LeftHeartStressedVolume + PulmonaryStressedVolume + SystemicStressedVolume;
      TotalBloodUnstressedVolume = TotalBloodVolume - TotalBloodStressedVolume;
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-100,40},{80,20}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Total Blood Volume"),Text(extent=  {{-98,22},{80,-6}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Total Blood Stressed Volume"),Text(extent=  {{-98,-4},{80,-32}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Total Blood Unstressed Volume")}));
    end BloodVolume;

    model SideOfHeart "abstract model for heart side"
      import BurkhoffModel;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-114,-10},{-94,10}}), iconTransformation(extent = {{-14,-8},{6,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
              extent={{-18,54},{2,74}})));
      Modelica.Blocks.Interfaces.RealInput AEt0
        "VAtrial Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{-104,60},{-82,82}}), iconTransformation(extent={{-16,-16},
                {16,16}},                                                                                                    rotation = 270, origin={-72,124})));
      Modelica.Blocks.Interfaces.RealInput VEt0
        "Ventricular Elastance - realative value from 0 to 1 (Current Elastance/Maximal Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{-8,52},{22,82}}), iconTransformation(extent={{-16,-16},
                {16,16}},                                                                                                    rotation = 270, origin={-38,124})));
      Physiolibrary.Types.RealIO.PressureInput PTH "Intrathoracic Pressure" annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-56,50}), iconTransformation(extent={{-16,-16},
                {16,16}},                                                                                                    rotation = 270, origin={-6,124})));
      Modelica.Blocks.Interfaces.RealInput AVGain
        "Ventricular-Atrial Interconnection Gain"                                           annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin = {-38,52}), iconTransformation(extent={{-15,-15},
                {15,15}},
            rotation=270,
            origin={25,125})));
      Physiolibrary.Types.RealIO.VolumeOutput Volume annotation(Placement(transformation(extent={{44,-70},
                {64,-50}}),                                                                                             iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {-62,-108})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent={{-44,-72},
                {-24,-52}}),                                                                                                    iconTransformation(extent = {{-16,-16},{16,16}}, rotation = 270, origin = {6,-108})));
      BurkhoffModel.Parts.HeartElastance AtrialElastance
        annotation (Placement(transformation(extent={{-50,68},{-16,94}})));
      BurkhoffModel.Parts.HeartElastance VentricularElastance
        annotation (Placement(transformation(extent={{42,68},{76,94}})));
      BurkhoffModel.OldParts.GainConst xAAlpha(k=0.04)
        annotation (Placement(transformation(extent={{-92,84},{-84,90}})));
      BurkhoffModel.OldParts.GainConst xABeta(k=0.3)
        annotation (Placement(transformation(extent={{-80,80},{-72,86}})));
      Cardiovascular.Types.Constants.HydraulicElastanceConst xVEes(k=50662507.2177)   annotation(Placement(transformation(extent = {{14,90},{22,96}})));
      BurkhoffModel.OldParts.GainConst xVAlpha(k=0.024)
        annotation (Placement(transformation(extent={{2,84},{10,90}})));
      BurkhoffModel.OldParts.GainConst xVBeta(k=0.34)
        annotation (Placement(transformation(extent={{14,78},{22,84}})));
      BurkhoffModel.Parts.ElasticVesselWithSVandP atrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-05)
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 270, origin = {-35,37})));
      Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin = {-52,22})));
      BurkhoffModel.Parts.ElasticVesselWithSVandP ventricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=6e-05)
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {-64,24})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-4,-4},{4,4}}, rotation = 270, origin = {40,26})));
      Physiolibrary.Hydraulic.Components.IdealValve    atrioVentricularValve(
          useLimitationInputs=true)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      Physiolibrary.Hydraulic.Components.IdealValve    ventriculoArteryValve(
          useLimitationInputs=true)
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxABackflow(k = 0) annotation(Placement(transformation(extent={{-10,28},
                {-4,34}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst xtv(k(displayUnit = "(mmHg.s)/ml") = 333305.9685375) annotation(Placement(transformation(extent={{-26,22},
                {-18,30}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst xR(k(displayUnit = "(mmHg.s)/ml") = 266644.77483) annotation(Placement(transformation(extent={{56,20},
                {64,28}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxVBackflow(k = 0) annotation(Placement(transformation(extent={{72,38},
                {80,46}})));
      Physiolibrary.Types.Constants.VolumeConst VxAU(k=5e-06)    annotation(Placement(transformation(extent = {{-82,16},{-74,24}})));
      Physiolibrary.Types.Constants.VolumeConst VxVU(k=5e-06)    annotation(Placement(transformation(extent = {{16,20},{24,28}})));
      Modelica.Blocks.Math.Add stressedVolume annotation(Placement(transformation(extent={{-74,-72},
                {-54,-52}})));
      Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent={{12,-70},
                {32,-50}})));
      Cardiovascular.Types.Constants.HydraulicElastanceConst xAEes(k=26664477.483)   annotation(Placement(transformation(extent = {{-78,92},{-70,100}})));
    equation
      connect(Volume,Volume) annotation(Line(points={{54,-60},{54,-60}},   color = {0,0,127}, smooth = Smooth.None));
      connect(AEt0,AtrialElastance.Et0) annotation(Line(points={{-93,71},{-72.5,
              71},{-72.5,76.06},{-51.36,76.06}},                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(VEt0,VentricularElastance.Et0) annotation(Line(points={{7,67},{
              26.5,67},{26.5,76.06},{40.64,76.06}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(xAAlpha.y,AtrialElastance.Alpha) annotation(Line(points={{-83,87},
              {-64,87},{-64,89.97},{-51.19,89.97}},                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(xABeta.y,AtrialElastance.Beta) annotation(Line(points={{-71,83},{
              -61.5,83},{-61.5,85.94},{-51.36,85.94}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(VentricularElastance.Ees,xVEes.y) annotation(Line(points={{40.81,
              92.83},{32,92.83},{32,93},{23,93}},                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(VentricularElastance.Alpha,xVAlpha.y) annotation(Line(points={{40.81,
              89.97},{26,89.97},{26,87},{11,87}},                                                                        color = {0,0,127}, smooth = Smooth.None));
      connect(xVBeta.y,VentricularElastance.Beta) annotation(Line(points={{23,81},
              {31.5,81},{31.5,85.94},{40.64,85.94}},                                                                       color = {0,0,127}, smooth = Smooth.None));
      connect(AVGain,product.u2) annotation(Line(points = {{-38,52},{-38,43}}, color = {0,0,127}, smooth = Smooth.None));
      connect(atrium.externalPressure, add.y) annotation (Line(
          points={{-52,8},{-52,15.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH,add.u2) annotation(Line(points = {{-56,50},{-55.6,50},{-55.6,29.2}}, color = {0,0,127}, smooth = Smooth.None));
      connect(product.y,add.u1) annotation(Line(points = {{-35,31.5},{-41.5,31.5},{-41.5,29.2},{-48.4,29.2}}, color = {0,0,127}, smooth = Smooth.None));
      connect(ventricle.pressure, product.u1) annotation (Line(
          points={{48.4,-10},{60,-10},{60,-24},{-26,-24},{-26,46},{-32,46},{-32,43}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance.y,atrium. compliance) annotation (Line(
          points={{-64,19},{-62,19},{-62,8},{-60,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance.hydraulicelastance,AtrialElastance.Et) annotation(Line(points = {{-64.09999999999999,28.1},{-64.09999999999999,60},{-8,60},{-8,90.09999999999999},{-13.96,90.09999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(hydrauliccompliance1.y,ventricle. compliance) annotation (Line(
          points={{40,21},{40,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance1.hydraulicelastance,VentricularElastance.Et) annotation(Line(points = {{39.9,30.1},{39.9,60},{82,60},{82,90.09999999999999},{78.04000000000001,90.09999999999999}}, color = {0,0,127}, smooth = Smooth.None));
      connect(inflow,atrium. q_in) annotation (Line(
          points={{-104,0},{-60,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PTH,ventricle. externalPressure) annotation (Line(
          points={{-56,50},{-56,56},{48,56},{48,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(VxAU.y,atrium. zeroPressureVolume) annotation (Line(
          points={{-73,20},{-70,20},{-70,8},{-68,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(VxVU.y,ventricle. zeroPressureVolume) annotation (Line(
          points={{25,24},{28,24},{28,8},{32,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(stressedVolume.y,StressedVolume) annotation(Line(points={{-53,-62},{-34,
              -62}},                                                                                               color = {0,0,127}, smooth = Smooth.None));
      connect(ventricle.StressedVolume, VentricularElastance.Vs) annotation (Line(
          points={{32,-10.2},{22,-10.2},{22,-10},{2,-10},{2,74},{24,74},{24,78},
              {36,78},{36,77.62},{39.96,77.62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrium.StressedVolume, stressedVolume.u2) annotation (Line(
          points={{-68,-10.2},{-68,-20},{-90,-20},{-90,-68},{-76,-68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y,Volume) annotation(Line(points={{33,-60},{54,-60}},                     color = {0,0,127}, smooth = Smooth.None));
      connect(atrium.volume, add1.u2) annotation (Line(
          points={{-60,-10},{-60,-36},{-12,-36},{-12,-66},{10,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrium.StressedVolume, AtrialElastance.Vs) annotation (Line(
          points={{-68,-10.2},{-78,-10.2},{-78,-10},{-96,-10},{-96,78},{-58,78},
              {-58,77.62},{-52.04,77.62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow,inflow) annotation(Line(points = {{-104,0},{-104,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(xAEes.y,AtrialElastance.Ees) annotation(Line(points={{-69,96},{
              -60,96},{-60,92.83},{-51.19,92.83}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(stressedVolume.u1,ventricle. StressedVolume) annotation (Line(
          points={{-76,-56},{-84,-56},{-84,-44},{32,-44},{32,-10.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1,ventricle. volume) annotation (Line(
          points={{10,-54},{2,-54},{2,-46},{40,-46},{40,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrium.q_in, atrioVentricularValve.q_in) annotation (Line(
          points={{-60,0},{-20,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(atrioVentricularValve.q_out, ventricle.q_in) annotation (Line(
          points={{0,0},{40,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(xtv.y, atrioVentricularValve.Gon) annotation (Line(
          points={{-17,26},{-16,26},{-16,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CxABackflow.y, atrioVentricularValve.Goff) annotation (Line(
          points={{-3.25,31},{-3.25,19.5},{-4,19.5},{-4,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, ventriculoArteryValve.q_in) annotation (Line(
          points={{40,0},{66,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventriculoArteryValve.q_out, outflow) annotation (Line(
          points={{86,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CxVBackflow.y, ventriculoArteryValve.Goff) annotation (Line(
          points={{81,42},{82,42},{82,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(xR.y, ventriculoArteryValve.Gon) annotation (Line(
          points={{65,24},{68,24},{68,10},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics={  Text(extent={{
                  -96,106},{-46,92}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AEt0"),Text(extent={{
                  -66,108},{-14,92}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0"),Text(extent={{
                  -28,108},{20,92}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "PTH"),Text(extent={{
                  -8,112},{76,94}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVGain"),Text(extent={{
                  -84,-84},{-44,-90}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Volume"),Text(extent={{
                  -30,-72},{38,-78}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Stressed Volume")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end SideOfHeart;

    model PulmonaryCirculation1
      extends Physiolibrary.Icons.PulmonaryCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-110,-12},{-90,8}}),
            iconTransformation(extent={{-110,-12},{-90,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Physiolibrary.Types.RealIO.VolumeOutput Volume annotation (Placement(
            transformation(extent={{52,-94},{72,-74}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,-38})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-32,-80}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={60,-34})));
      Parts.ElasticVesselWithSVandP arteryProximal(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=3e-05)
        annotation (Placement(transformation(extent={{-62,12},{-42,32}})));
      Physiolibrary.Hydraulic.Components.Conductor proximalArteryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-38,-12},{-18,8}})));
      Parts.ElasticVesselWithSVandP artery(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00081)
        annotation (Placement(transformation(extent={{-12,12},{8,32}})));
      Physiolibrary.Hydraulic.Components.Conductor arterialResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{10,-12},{30,8}})));
      Physiolibrary.Hydraulic.Components.Conductor proximalImpedance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));
      Parts.ElasticVesselWithSVandP veins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00024)
        annotation (Placement(transformation(extent={{36,14},{56,34}})));
      Physiolibrary.Hydraulic.Components.Conductor venousResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{64,-10},{84,10}})));
      Physiolibrary.Types.Constants.VolumeConst UVap(k = 2e-005) annotation(Placement(transformation(extent = {{-72,46},{-64,54}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaproxPulm(k=
            7.5006157584566e-09)                                                                  annotation(Placement(transformation(extent = {{-60,58},{-52,66}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcPulm(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483) annotation(Placement(transformation(extent = {{-40,40},{-32,48}})));
      Physiolibrary.Types.Constants.VolumeConst UVaP(k=0.0006)                  annotation(Placement(transformation(extent = {{-22,50},{-14,58}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaPulm(k = 1.5001231516913e-007) annotation(Placement(transformation(extent={{-14,64},
                {-6,72}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RaPulm(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483) annotation(Placement(transformation(extent = {{10,36},{18,44}})));
      Physiolibrary.Types.Constants.VolumeConst UVvP(k = 0.0001) annotation(Placement(transformation(extent = {{26,50},{34,58}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CvPulm(k(
            displayUnit="ml/mmHg") = 5.2504310309196e-08)                                     annotation(Placement(transformation(extent = {{36,62},{44,70}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RvPulm(k(
            displayUnit="(mmHg.s)/ml") = 1999835.811225)                                                                          annotation(Placement(transformation(extent = {{64,34},{72,42}})));
      Modelica.Blocks.Math.Add3 Add3SV annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-64,-48})));
      Modelica.Blocks.Math.Add3 Add3V annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={42,-44})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsPulm(k(
            displayUnit="(mmHg.s)/ml") = 2666447.7483)
        annotation (Placement(transformation(extent={{-92,40},{-84,48}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{-70,78},
                {-62,86}})));
    equation
      connect(inflow, inflow) annotation (Line(
          points={{-100,-2},{-100,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inflow, proximalImpedance.q_in) annotation (Line(
          points={{-100,-2},{-88,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(UVap.y, arteryProximal.zeroPressureVolume) annotation (Line(
          points={{-63,50},{-62,50},{-62,30},{-60,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CaproxPulm.y, arteryProximal.compliance) annotation (Line(
          points={{-51,62},{-52,62},{-52,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(proximalArteryResistance.cond, RcPulm.y) annotation (Line(
          points={{-28,4},{-28,44},{-31,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(artery.zeroPressureVolume, UVaP.y) annotation (Line(
          points={{-10,30},{-12,30},{-12,54},{-13,54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CaPulm.y, artery.compliance) annotation (Line(
          points={{-5,68},{-4,68},{-4,30},{-2,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arterialResistance.cond, RaPulm.y) annotation (Line(
          points={{20,4},{20,40},{19,40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.zeroPressureVolume, UVvP.y) annotation (Line(
          points={{38,32},{36,32},{36,54},{35,54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CvPulm.y, veins.compliance) annotation (Line(
          points={{45,66},{46,66},{46,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(proximalImpedance.q_out, arteryProximal.q_in) annotation (Line(
          points={{-68,-2},{-68,22},{-52,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteryProximal.q_in, proximalArteryResistance.q_in) annotation (
          Line(
          points={{-52,22},{-46,22},{-46,-2},{-38,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(proximalArteryResistance.q_out, artery.q_in) annotation (Line(
          points={{-18,-2},{-10,-2},{-10,22},{-2,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(artery.q_in, arterialResistance.q_in) annotation (Line(
          points={{-2,22},{4,22},{4,-2},{10,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arterialResistance.q_out, veins.q_in) annotation (Line(
          points={{30,-2},{38,-2},{38,24},{46,24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, venousResistance.q_in) annotation (Line(
          points={{46,24},{56,24},{56,0},{64,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venousResistance.q_out, outflow) annotation (Line(
          points={{84,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venousResistance.cond, RvPulm.y) annotation (Line(
          points={{74,6},{74,38},{73,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteryProximal.volume, Add3V.u3) annotation (Line(
          points={{-52,12},{-54,12},{-54,-26},{34,-26},{34,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(artery.volume, Add3V.u2) annotation (Line(
          points={{-2,12},{-2,-18},{42,-18},{42,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.volume, Add3V.u1) annotation (Line(
          points={{46,14},{48,14},{48,-32},{50,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteryProximal.StressedVolume, Add3SV.u3) annotation (Line(
          points={{-60,11.8},{-60,-16},{-72,-16},{-72,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(artery.StressedVolume, Add3SV.u2) annotation (Line(
          points={{-10,11.8},{-8,11.8},{-8,-20},{-64,-20},{-64,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(veins.StressedVolume, Add3SV.u1) annotation (Line(
          points={{38,13.8},{42,13.8},{42,-14},{-56,-14},{-56,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Add3SV.y, StressedVolume) annotation (Line(
          points={{-64,-59},{-64,-80},{-32,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Add3V.y, Volume) annotation (Line(
          points={{42,-55},{42,-84},{62,-84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RcsPulm.y, proximalImpedance.cond) annotation (Line(
          points={{-83,44},{-80,44},{-80,4},{-78,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, arteryProximal.externalPressure) annotation (Line(
          points={{-61,82},{-44,82},{-44,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, artery.externalPressure) annotation (Line(
          points={{-61,82},{6,82},{6,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, veins.externalPressure) annotation (Line(
          points={{-61,82},{54,82},{54,32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics={  Text(extent=  {{-72,28},{76,18}}, lineColor=  {0,0,255},
                lineThickness=                                                                                                    0.5, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Intrathoracic pressure"),Text(extent=  {{-82,18},{-36,-56}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    0.5, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "blood volume"),Text(extent=  {{40,-10},{88,-28}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    0.5, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "stressed volume")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end PulmonaryCirculation1;

    model SystemicCirculation1
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{90,-12},{110,8}}),
            iconTransformation(extent={{-106,-12},{-86,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-108,-12},{-88,8}}),
            iconTransformation(extent={{88,-12},{108,8}})));
      Physiolibrary.Types.RealIO.VolumeOutput BloodVolume annotation (Placement(
            transformation(extent={{74,-66},{94,-46}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-76,-64})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation (
          Placement(transformation(extent={{-44,-68},{-24,-48}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={76,-66})));
      Parts.ElasticVesselWithSVandP AortaProximal(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=3.5e-005)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Parts.ElasticVesselWithSVandP SystemicArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.000835)
        annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      Parts.ElasticVesselWithSVandP SystemicVeins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00283)
        annotation (Placement(transformation(extent={{36,-10},{56,10}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicProximalImpedance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-86,-12},{-66,8}})));
      Physiolibrary.Hydraulic.Components.Conductor ProximalAortaResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-34,-10},{-14,10}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicArterialResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{12,-12},{32,8}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicVenousResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{66,-10},{86,10}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsProx(k(
            displayUnit="(Pa.s)/m3") = 2666447.7483)                                                                             annotation(Placement(transformation(extent = {{-86,14},{-78,22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RcsSys(k(displayUnit = "(mmHg.s)/ml") = 3199737.29796) annotation(Placement(transformation(extent = {{-34,16},{-26,24}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RaSys(k(displayUnit = "(mmHg.s)/ml") = 99991790.56125) annotation(Placement(transformation(extent = {{14,16},{22,24}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RvSys(k(displayUnit = "(mmHg.s)/ml") = 2666447.7483)
        "Systemic Venous Characteristic Impedance"                                                                                                     annotation(Placement(transformation(extent={{64,16},
                {72,24}})));
      Physiolibrary.Types.Constants.VolumeConst UVaproxSys(k=3e-05)
        "Unstressed volume in proximal aorta"                                                                annotation(Placement(transformation(extent = {{-70,22},{-62,30}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaproxSys(k = 7.5006157584566e-010)
        "Pulmonary Proximal Aortic Capacitance"                                                                                          annotation(Placement(transformation(extent = {{-62,32},{-54,40}})));
      Physiolibrary.Types.Constants.VolumeConst UVaSys(k = 0.0007)
        "Unstressed volume in systemic arteries"                                                            annotation(Placement(transformation(extent = {{-20,30},{-12,38}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CaSys(k(
            displayUnit="m3/Pa") = 1.2751046789376e-08)
        "Systemic Artery Capacitance"                                                                                      annotation(Placement(transformation(extent = {{-14,40},{-6,48}})));
      Physiolibrary.Types.Constants.VolumeConst UVvSys(k = 0.00223)
        "Unstressed volume in systemic veins"                                                             annotation(Placement(transformation(extent = {{30,22},{38,30}})));
      Physiolibrary.Types.Constants.HydraulicComplianceConst CvSys(k(
            displayUnit="m3/Pa") = 5.2504310309196e-07)
        "Systemnic Venous Capacitance "                                                                                      annotation(Placement(transformation(extent = {{36,34},{44,42}})));
      Modelica.Blocks.Math.Add3 Add3SV
        annotation (Placement(transformation(extent={{-86,-68},{-66,-48}})));
      Modelica.Blocks.Math.Add3 Add3BV
        annotation (Placement(transformation(extent={{12,-72},{32,-52}})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{-86,44},
                {-78,52}})));
      Physiolibrary.Types.Constants.PressureConst Pext(
                                                      k = 0) annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=180,
            origin={72,44})));
    equation
      connect(inflow, SystemicProximalImpedance.q_in) annotation (Line(
          points={{-98,-2},{-86,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicProximalImpedance.q_out,AortaProximal.q_in) annotation(Line(points = {{-66,-2},{-58,-2},{-58,0},{-50,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(RcsProx.y,SystemicProximalImpedance.cond) annotation(Line(points = {{-77,18},{-76,18},{-76,4}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RcsSys.y,ProximalAortaResistance.cond) annotation(Line(points = {{-25,20},{-24,20},{-24,6}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RaSys.y,SystemicArterialResistance.cond) annotation(Line(points = {{23,20},{22,20},{22,4}}, color = {0,0,127}, smooth = Smooth.None));
      connect(RvSys.y,SystemicVenousResistance.cond) annotation(Line(points={{73,20},
              {74,20},{74,6},{76,6}},                                                                          color = {0,0,127}, smooth = Smooth.None));
      connect(UVaproxSys.y,AortaProximal.zeroPressureVolume) annotation(Line(points = {{-61,26},{-60,26},{-60,8},{-58,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CaproxSys.y,AortaProximal.compliance) annotation(Line(points = {{-53,36},{-52,36},{-52,8},{-50,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(UVaSys.y,SystemicArteries.zeroPressureVolume) annotation(Line(points = {{-11,34},{-10,34},{-10,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CaSys.y,SystemicArteries.compliance) annotation(Line(points = {{-5,44},{-2,44},{-2,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(AortaProximal.q_in,ProximalAortaResistance.q_in) annotation(Line(points = {{-50,0},{-34,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(ProximalAortaResistance.q_out,SystemicArteries.q_in) annotation(Line(points = {{-14,0},{-2,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(SystemicArteries.q_in,SystemicArterialResistance.q_in) annotation(Line(points = {{-2,0},{6,0},{6,-2},{12,-2}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(SystemicArterialResistance.q_out,SystemicVeins.q_in) annotation(Line(points = {{32,-2},{40,-2},{40,0},{46,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(SystemicVeins.q_in,SystemicVenousResistance.q_in) annotation(Line(points = {{46,0},{66,0}}, color = {0,0,0}, thickness = 1, smooth = Smooth.None));
      connect(SystemicVenousResistance.q_out,outflow)  annotation (Line(
          points={{86,0},{94,0},{94,-2},{100,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(UVvSys.y,SystemicVeins.zeroPressureVolume) annotation(Line(points = {{39,26},{38,26},{38,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(CvSys.y,SystemicVeins.compliance) annotation(Line(points = {{45,38},{46,38},{46,8}}, color = {0,0,127}, smooth = Smooth.None));
      connect(Add3SV.y, StressedVolume) annotation (Line(
          points={{-65,-58},{-34,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Add3BV.y, BloodVolume) annotation (Line(
          points={{33,-62},{36,-62},{36,-56},{84,-56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVeins.volume, Add3BV.u1) annotation (Line(
          points={{46,-10},{46,-28},{44,-28},{44,-46},{0,-46},{0,-54},{10,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicArteries.volume, Add3BV.u2) annotation (Line(
          points={{-2,-10},{-2,-64},{10,-64},{10,-62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AortaProximal.volume, Add3BV.u3) annotation (Line(
          points={{-50,-10},{-50,-20},{-4,-20},{-4,-62},{-10,-62},{-10,-70},{10,
              -70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicVeins.StressedVolume, Add3SV.u1) annotation (Line(
          points={{38,-10.2},{38,-40},{-94,-40},{-94,-50},{-88,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SystemicArteries.StressedVolume, Add3SV.u2) annotation (Line(
          points={{-10,-10.2},{-26,-10.2},{-26,-38},{-96,-38},{-96,-58},{-88,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AortaProximal.StressedVolume, Add3SV.u3) annotation (Line(
          points={{-58,-10.2},{-58,-36},{-98,-36},{-98,-66},{-88,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, AortaProximal.externalPressure) annotation (Line(
          points={{-77,48},{-42,48},{-42,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pext.y, SystemicVeins.externalPressure) annotation (Line(
          points={{67,44},{54,44},{54,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pext.y, SystemicArteries.externalPressure) annotation (Line(
          points={{67,44},{6,44},{6,8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                     graphics),                                        Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end SystemicCirculation1;

    model Heart
      Parts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-16},{2,30}})));
      Parts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-14,-16},{38,28}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-66,-4},{-46,16}}),
            iconTransformation(extent={{-50,2},{-30,22}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-62,10},{-42,30}}),
            iconTransformation(extent={{-30,34},{-10,54}})));
      Physiolibrary.Types.RealIO.VolumeOutput Volume annotation(Placement(transformation(extent={{-6,-44},
                {14,-24}}),                                                                                             iconTransformation(extent={{-6,-6},
                {6,6}},                                                                                                    rotation = 270, origin={-14,-38})));
      Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent={{28,-48},
                {48,-28}}),                                                                                                    iconTransformation(extent={{-7,-7},
                {7,7}},                                                                                                    rotation = 270, origin={15,-39})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{26,50},{46,70}}),
            iconTransformation(extent={{6,40},{26,60}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{22,-10},{42,10}}),
            iconTransformation(extent={{18,8},{38,28}})));
      HeartElasticities heartElasticities annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-48,62})));
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit="ms")=
          0.16)                                                                     annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=180,
            origin={-54,44})));
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{-18,-40},{-8,-30}})));
      Modelica.Blocks.Math.Add add1
        annotation (Placement(transformation(extent={{14,-52},{24,-42}})));
      GainConst AVGain(k=0.02) annotation (Placement(transformation(
            extent={{6,-4},{-6,4}},
            rotation=90,
            origin={20,54})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement_Old
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{18,8},{38,28}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k=1.1666666666667)   annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=0,
            origin={-70,68})));
      Physiolibrary.Types.Constants.PressureConst PTH(k = 0) annotation(Placement(transformation(extent={{-34,54},
                {-26,62}})));
    equation
      connect(heartElasticities.VEt0, rightHeart.VEt0) annotation (Line(
          points={{-38.4,68.6},{-35.26,68.6},{-35.26,35.52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartElasticities.VEt0, leftHeart.VEt0) annotation (Line(
          points={{-38.4,68.6},{2.12,68.6},{2.12,33.28}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartElasticities.AEt0, leftHeart.AEt0) annotation (Line(
          points={{-38.2,64.2},{-6.72,64.2},{-6.72,33.28}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Volume, add.y) annotation (Line(
          points={{4,-34},{2,-34},{2,-35},{-7.5,-35}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, leftHeart.Volume) annotation (Line(
          points={{-19,-32},{-20,-32},{-20,-26},{-4.12,-26},{-4.12,-17.76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, rightHeart.Volume) annotation (Line(
          points={{-19,-38},{-41.74,-38},{-41.74,-17.84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.u1, leftHeart.StressedVolume) annotation (Line(
          points={{13,-44},{16,-44},{16,-17.76},{13.56,-17.76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVGain.y, leftHeart.AVGain) annotation (Line(
          points={{20,46.5},{18.5,46.5},{18.5,33.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVGain.y, rightHeart.AVGain) annotation (Line(
          points={{20,46.5},{-18.25,46.5},{-18.25,35.75}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-56,6},{-42,6},{-42,7.46},{-26.08,7.46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeartInflow, rightHeartInflow) annotation (Line(
          points={{-56,6},{-56,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeartOutflow, rightHeart.outflow) annotation (Line(
          points={{-52,20},{-40,20},{-40,21.72},{-27.16,21.72}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{32,0},{22,0},{22,6.44},{10.96,6.44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartElasticities.AEt0, rightHeart.AEt0) annotation (Line(
          points={{-38.2,64.2},{-36,64.2},{-36,48},{-44.44,48},{-44.44,35.52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartElasticities.AVDelay, AVDelay.y) annotation (Line(
          points={{-56.6,60},{-60,60},{-60,44},{-59,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{9.92,20.08},{13.96,20.08},{13.96,18},{18,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{38,18},{38,60},{36,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(rightHeart.StressedVolume, add1.u2) annotation (Line(
          points={{-23.38,-17.84},{-23.38,-50},{13,-50}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(add1.y, StressedVolume) annotation (Line(
          points={{24.5,-47},{38,-47},{38,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, heartElasticities.HeartRate) annotation (Line(
          points={{-65,68},{-66,68},{-66,68.4},{-57.4,68.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, rightHeart.PTH) annotation (Line(
          points={{-25,58},{-26.62,58},{-26.62,35.52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, leftHeart.PTH) annotation (Line(
          points={{-25,58},{10.44,58},{10.44,33.28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, flowPressureMeasurement.HR) annotation (Line(
          points={{-65,68},{-64,68},{-64,72},{28,72},{28,24.6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80,-60},
                {60,80}}),              graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-80,-60},{60,80}}),
            graphics={
            Bitmap(extent={{-20,50},{44,-30}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"),
            Bitmap(extent={{-44,42},{8,-30}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}));
    end Heart;

    model PressureFlowMeasurement
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a Inflow annotation(Placement(transformation(extent = {{-108,-8},{-88,12}}), iconTransformation(extent = {{-108,-8},{-88,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b Outflow annotation(Placement(transformation(extent = {{88,-10},{108,10}}), iconTransformation(extent = {{88,-10},{108,10}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR "Heart rate " annotation(Placement(transformation(extent = {{-36,28},{4,68}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {0,68})));
      Physiolibrary.Types.RealIO.PressureOutput Ps
        "Systolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-72,-42},{-52,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-80,-30})));
      Physiolibrary.Types.RealIO.PressureOutput Pd
        "Diastolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-50,-40},{-30,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-60,-30})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean
        "Mean pressure during heart cycle"                                               annotation(Placement(transformation(extent = {{-10,-36},{10,-16}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-38,-30})));
      Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume" annotation(Placement(transformation(extent = {{22,-42},{42,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {30,-30})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output" annotation(Placement(transformation(extent = {{50,-40},{70,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {50,-30})));
      Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
      Physiolibrary.Types.Pressure Pmin(start = 200);
      Physiolibrary.Types.Pressure Pmax(start = 0);
      Physiolibrary.Types.Volume Volume(start = 0)
        "sum of volume through cyrdiac cycle";
      Boolean b "event condition";
      Physiolibrary.Types.Time T0 "start of cardiac cycle ";
      discrete Physiolibrary.Types.Time HP "length of cardiac cycle";
    initial equation
      T0 = 0;
      HP = 1 / HR;
      CO = 0;
      SV = 0;
      Ps = 0;
      Pd = 0;
      Pmean = 0;
    equation
      Inflow.q + Outflow.q = 0;
      Inflow.pressure = Outflow.pressure;
      Pmax = max(Pmax, Inflow.pressure);
      Pmin = min(Pmin, Inflow.pressure);
      b = time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
      when {b} then
        T0 = time "initial time of current cardiac cycle";
        HP = 1 / HR "calculation od time lenght of current cardiac cycle";
        SV = Volume
          "systolic volume is equal of total volume passed through this block";
        CO = SV * HR
          "cardiac output calculation from systolic volume and heart rate (l/min)";
        Pmean = SumPressure / pre(HP)
          "mean pressure (torr) = summ pressure through cardiac cycle divided by length of previous cardiac cycle";
        Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
        Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
        reinit(Volume, 0) "reinitialisation of volume";
        reinit(SumPressure, 0) "reinitialisation of sum pressure";
        reinit(Pmax, Pmean)
          "reinitialisation of maximal pressure to mean pressure";
        reinit(Pmin, Pmean)
          "reinitialisation minimal pressure to mean pressure";
      end when;
      der(Volume) = Inflow.q;
      der(SumPressure) = Inflow.pressure;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Polygon(points=  {{-92,52},{-92,14},{-92,-20},{62,-20},{102,0},{70,52},{40,52},{-92,52}}, lineColor=  {0,0,255}, smooth=  Smooth.None, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-32,46},{26,32}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HR"),Text(extent=  {{-18,12},{18,-12}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {-76,-4}, rotation=  90, textString=  "Ps"),Text(extent=  {{-19,12},{19,-12}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {-54,-3}, rotation=  90, textString=  "Pd"),Text(extent=  {{-35,12},{35,-12}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {-32,15}, rotation=  90, textString=  "Pmean"),Text(extent=  {{-29,12},{29,-12}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {34,7}, rotation=  90, textString=  "SV"),Text(extent=  {{-30,11},{30,-11}}, lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {55,8}, rotation=  90, textString=  "CO")}));
    end PressureFlowMeasurement;

    block GainConst "Constant signal of type Gain"
      parameter Real k "Constant Gain output value";
      Modelica.Blocks.Interfaces.RealOutput y "Gain constant" annotation(Placement(transformation(extent = {{40,-10},{60,10}}), iconTransformation(extent = {{40,-10},{60,10}})));
    equation
      y = k;
      annotation(defaultComponentName = "gain", Diagram(coordinateSystem(extent = {{-40,-40},{40,40}})), Icon(coordinateSystem(extent = {{-40,-40},{40,40}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-40,40},{40,-40}}, lineColor=  {0,0,0}, radius=  10, fillColor=  {236,236,236},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-100,-44},{100,-64}}, lineColor=  {0,0,0}, fillColor=  {236,236,236},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name"),Text(extent=  {{-40,32},{40,12}}, lineColor=  {0,0,0}, fillColor=  {236,236,236},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Const"),Text(extent=  {{-40,6},{40,-32}}, lineColor=  {0,0,255}, fillColor=  {170,213,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%k")}));
    end GainConst;

    model HeartElasticities
      Physiolibrary.Types.RealIO.FrequencyInput HeartRate
        "heart rates beats per time interval"                                                   annotation(Placement(transformation(extent = {{-106,2},{-66,42}}), iconTransformation(extent = {{-120,38},{-68,90}})));
      Physiolibrary.Types.RealIO.TimeInput AVDelay "Atrial-ventricular delay" annotation(Placement(transformation(extent = {{-106,-40},{-66,0}}), iconTransformation(extent = {{-106,-40},{-66,0}})));
      Modelica.Blocks.Interfaces.RealOutput VEt0
        "Relative elastance value of ventricles (Elastance/End-Systolic Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{86,56},{106,76}}), iconTransformation(extent = {{86,56},{106,76}})));
      Modelica.Blocks.Interfaces.RealOutput AEt0
        "Relative elastance value of atria (Elastance/End-Systolic Elastance)"                                          annotation(Placement(transformation(extent = {{-14,44},{6,64}}), iconTransformation(extent = {{88,12},{108,32}})));
      Physiolibrary.Types.RealIO.TimeOutput T0 "start time of cardiac cycle" annotation(Placement(transformation(extent = {{82,-52},{102,-32}}), iconTransformation(extent = {{82,-52},{102,-32}})));
      EtTimingBurkhoff etTimingAtrial annotation(Placement(transformation(extent = {{-50,62},{-30,82}})));
      EtTimingBurkhoff etTimingVentricular annotation(Placement(transformation(extent = {{34,64},{54,84}})));
      Physiolibrary.Types.Constants.TimeConst TmaxAtrial(k(displayUnit = "ms") = 0.125) annotation(Placement(transformation(extent = {{-88,78},{-80,86}})));
      Physiolibrary.Types.Constants.TimeConst TauAtrial(k(displayUnit = "ms") = 0.02)
        "Time constant of atrial relaxation"                                                                               annotation(Placement(transformation(extent = {{-86,62},{-78,70}})));
      Physiolibrary.Types.Constants.TimeConst TmaxVentricula(k(displayUnit = "ms") = 0.2)
        "Time to ventricular end systole"                                                                                   annotation(Placement(transformation(extent = {{4,86},{12,94}})));
      Physiolibrary.Types.Constants.TimeConst TauVentricular(k(displayUnit = "ms") = 0.03)
        "Time constant of ventricular relaxation"                                                                                    annotation(Placement(transformation(extent = {{2,72},{10,80}})));
    equation
      connect(etTimingVentricular.Et0,VEt0) annotation(Line(points = {{55,74.8},{72.5,74.8},{72.5,66},{96,66}}, color = {0,0,127}, smooth = Smooth.None));
      connect(etTimingAtrial.Et0,AEt0) annotation(Line(points = {{-29,72.8},{-20.5,72.8},{-20.5,54},{-4,54}}, color = {0,0,127}, smooth = Smooth.None));
      connect(TmaxAtrial.y,etTimingAtrial.Tmax) annotation(Line(points={{-79,82},
              {-66,82},{-66,66.3},{-51.3,66.3}},                                                                      color = {0,0,127}, smooth = Smooth.None));
      connect(TauAtrial.y,etTimingAtrial.Tau) annotation(Line(points={{-77,66},
              {-64,66},{-64,63.5},{-51.5,63.5}},                                                                                              color = {0,0,127}, smooth = Smooth.None));
      connect(TmaxVentricula.y,etTimingVentricular.Tmax) annotation(Line(points={{13,90},
              {22,90},{22,68.3},{32.7,68.3}},                                                                              color = {0,0,127}, smooth = Smooth.None));
      connect(TauVentricular.y,etTimingVentricular.Tau) annotation(Line(points={{11,76},
              {22,76},{22,65.5},{32.5,65.5}},                                                                                                    color = {0,0,127}, smooth = Smooth.None));
      connect(HeartRate, etTimingAtrial.HR) annotation (Line(
          points={{-86,22},{-70,22},{-70,81.9135},{-51.3,81.9135}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(HeartRate, etTimingVentricular.HR) annotation (Line(
          points={{-86,22},{-28,22},{-28,83.9135},{32.7,83.9135}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(AVDelay, etTimingAtrial.AVDelay) annotation (Line(
          points={{-86,-20},{-86,26},{-51.4,26},{-51.4,79.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(AVDelay, etTimingVentricular.AVDelay) annotation (Line(
          points={{-86,-20},{-27,-20},{-27,81.2},{32.6,81.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                        graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-64,80},{10,46}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HeartRate"),Text(extent=  {{-62,-4},{2,-42}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVDelay"),Text(extent=  {{-88,-72},{86,-102}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HeartElasticities"),Text(extent=  {{16,70},{90,44}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0
"),         Text(
              extent={{14,34},{90,8}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="AEt0"),
            Text(
              extent={{4,-28},{82,-58}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="T0")}));
    end HeartElasticities;

    model Heart_HI
      extends Cardiovascular.Heart;
      Parts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-16},{2,30}})));
      Parts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-14,-16},{38,28}})));
    /*  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
    annotation (Placement(transformation(extent={{-66,-4},{-46,16}}),
        iconTransformation(extent={{-50,2},{-30,22}})));
  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
    annotation (Placement(transformation(extent={{-62,10},{-42,30}}),
        iconTransformation(extent={{-30,34},{-10,54}})));
  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
    annotation (Placement(transformation(extent={{26,50},{46,70}}),
        iconTransformation(extent={{6,40},{26,60}})));
  Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
    annotation (Placement(transformation(extent={{22,-10},{42,10}}),
        iconTransformation(extent={{18,8},{38,28}})));
  */
      Physiolibrary.Types.Constants.TimeConst AVDelay(k(displayUnit="ms")=
          0.16)                                                                     annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=0,
            origin={-58,72})));
      OldParts.GainConst AVGain(k=0.02) annotation (Placement(transformation(
            extent={{4,-3},{-4,3}},
            rotation=180,
            origin={-20,47})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement_Old
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{18,8},{38,28}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k=1.1666666666667)   annotation(Placement(transformation(extent={{-4,-4},
                {4,4}},
            rotation=0,
            origin={-42,64})));
      Physiolibrary.Types.Constants.PressureConst PTH(k=0)   annotation(Placement(transformation(extent={{-34,52},
                {-26,60}})));
    equation
      connect(AVGain.y, leftHeart.AVGain) annotation (Line(
          points={{-15,47},{20.58,47},{20.58,31.74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVGain.y, rightHeart.AVGain) annotation (Line(
          points={{-15,47},{-16.09,47},{-16.09,33.91}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(rightHeartOutflow, rightHeart.outflow) annotation (Line(
          points={{-100,20},{-40,20},{-40,19.88},{-25,19.88}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{12,18.32},{13.96,18.32},{13.96,18},{18,18}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{38,18},{38,20},{100,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PTH.y, rightHeart.PTH) annotation (Line(
          points={{-25,56},{-24.46,56},{-24.46,33.68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH.y, leftHeart.PTH) annotation (Line(
          points={{-25,56},{12.52,56},{12.52,31.52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, flowPressureMeasurement.HR) annotation (Line(
          points={{-37,64},{28,64},{28,24.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{100,-20},{100,4},{13.04,4},{13.04,4.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-100,-20},{-23.92,-20},{-23.92,5.62}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.HR, HeartRate.y) annotation (Line(
          points={{-33.37,33.91},{-33.37,64},{-37,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVDelay.y, rightHeart.avDelay) annotation (Line(
          points={{-53,72},{-50,72},{-50,33.91},{-43.09,33.91}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVDelay.y, leftHeart.avDelay) annotation (Line(
          points={{-53,72},{-5.42,72},{-5.42,31.74}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{100,80}}),        graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{100,80}}),
            graphics));
    end Heart_HI;

    model HeartElasticities_HI
      Physiolibrary.Types.RealIO.FrequencyInput HeartRate
        "heart rates beats per time interval"                                                   annotation(Placement(transformation(extent = {{-106,2},{-66,42}}), iconTransformation(extent = {{-120,38},{-68,90}})));
      Physiolibrary.Types.RealIO.TimeInput AVDelay "Atrial-ventricular delay" annotation(Placement(transformation(extent = {{-106,-40},{-66,0}}), iconTransformation(extent = {{-106,-40},{-66,0}})));
      Modelica.Blocks.Interfaces.RealOutput VEt0
        "Relative elastance value of ventricles (Elastance/End-Systolic Elastance)"
                                                                                                            annotation(Placement(transformation(extent = {{86,56},{106,76}}), iconTransformation(extent = {{86,56},{106,76}})));
      Modelica.Blocks.Interfaces.RealOutput AEt0
        "Relative elastance value of atria (Elastance/End-Systolic Elastance)"                                          annotation(Placement(transformation(extent = {{-14,44},{6,64}}), iconTransformation(extent = {{88,12},{108,32}})));
      Physiolibrary.Types.RealIO.TimeOutput T0 "start time of cardiac cycle" annotation(Placement(transformation(extent = {{82,-52},{102,-32}}), iconTransformation(extent = {{82,-52},{102,-32}})));
      EtTimingBurkhoff_HI etTimingAtrial
        annotation (Placement(transformation(extent={{-50,62},{-30,82}})));
      EtTimingBurkhoff_HI etTimingVentricular
        annotation (Placement(transformation(extent={{34,64},{54,84}})));
      HeartIntervals_HI heartIntervals(HP(displayUnit="s"))
        annotation (Placement(transformation(extent={{-42,-26},{-4,10}})));
      Physiolibrary.Types.Constants.TimeConst TmaxAtrial(k(displayUnit = "ms") = 0.125) annotation(Placement(transformation(extent = {{-88,78},{-80,86}})));
      Physiolibrary.Types.Constants.TimeConst TauAtrial(k(displayUnit = "ms") = 0.02)
        "Time constant of atrial relaxation"                                                                               annotation(Placement(transformation(extent = {{-86,62},{-78,70}})));
      Physiolibrary.Types.Constants.TimeConst TmaxVentricula(k(displayUnit = "ms") = 0.2)
        "Time to ventricular end systole"                                                                                   annotation(Placement(transformation(extent={{4,84},{
                12,92}})));
      Physiolibrary.Types.Constants.TimeConst TauVentricular(k(displayUnit = "ms") = 0.03)
        "Time constant of ventricular relaxation"                                                                                    annotation(Placement(transformation(extent = {{2,72},{10,80}})));
    equation
      connect(AVDelay,heartIntervals.AVDelay) annotation(Line(points={{-86,-20},
              {-66,-20},{-66,-6.2},{-45.8,-6.2}},                                                                     color = {0,0,127}, smooth = Smooth.None));
      connect(HeartRate,heartIntervals.HR) annotation(Line(points={{-86,22},{
              -67,22},{-67,1.40871},{-45.8,1.40871}},                                                                  color = {0,0,127}, smooth = Smooth.None));
      connect(heartIntervals.Tasyst,etTimingAtrial.T0) annotation(Line(points = {{-2.1,0.187228},{-2.1,33.0936},{-51.3,33.0936},{-51.3,67.7}}, color = {0,0,127}, smooth = Smooth.None));
      connect(heartIntervals.Tvsyst,etTimingVentricular.T0) annotation(Line(points={{-2.1,
              -5.69422},{16,-5.69422},{16,70},{24,70},{24,69.7},{32.7,69.7}},                                                                               color = {0,0,127}, smooth = Smooth.None));
      connect(etTimingVentricular.Et0,VEt0) annotation(Line(points = {{55,74.8},{72.5,74.8},{72.5,66},{96,66}}, color = {0,0,127}, smooth = Smooth.None));
      connect(heartIntervals.T0,T0) annotation(Line(points={{-2.1,-14.611},{
              41.95,-14.611},{41.95,-42},{92,-42}},                                                                 color = {0,0,127}, smooth = Smooth.None));
      connect(etTimingAtrial.Et0,AEt0) annotation(Line(points = {{-29,72.8},{-20.5,72.8},{-20.5,54},{-4,54}}, color = {0,0,127}, smooth = Smooth.None));
      connect(TmaxAtrial.y,etTimingAtrial.Tmax) annotation(Line(points={{-79,82},
              {-66,82},{-66,79.3},{-51.3,79.3}},                                                                      color = {0,0,127}, smooth = Smooth.None));
      connect(TauAtrial.y,etTimingAtrial.Tau) annotation(Line(points={{-77,66},
              {-64,66},{-64,74.1},{-51.3,74.1}},                                                                                              color = {0,0,127}, smooth = Smooth.None));
      connect(TmaxVentricula.y,etTimingVentricular.Tmax) annotation(Line(points={{13,88},
              {22,88},{22,81.3},{32.7,81.3}},                                                                              color = {0,0,127}, smooth = Smooth.None));
      connect(TauVentricular.y,etTimingVentricular.Tau) annotation(Line(points={{11,76},
              {22,76},{22,76.1},{32.7,76.1}},                                                                                                    color = {0,0,127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                        graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-64,80},{10,46}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HeartRate"),Text(extent=  {{-62,-4},{2,-42}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVDelay"),Text(extent=  {{-88,-72},{86,-102}}, lineColor=  {0,0,0},
                lineThickness=                                                                                                    1, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HeartElasticities"),Text(extent=  {{16,70},{90,44}}, lineColor=  {0,0,0}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "VEt0
"),         Text(
              extent={{14,34},{90,8}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="AEt0"),
            Text(
              extent={{4,-28},{82,-58}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="T0")}));
    end HeartElasticities_HI;

    model EtTimingBurkhoff_HI
      Physiolibrary.Types.RealIO.TimeInput Tmax "duration of systole " annotation(Placement(transformation(extent = {{-120.0,12.0},{-80.0,52.0}}, origin = {14,-12}, rotation = 0), iconTransformation(extent = {{-126.0,62.0},{-100.0,88.0}}, origin = {0,-2}, rotation = 0), visible = true));
      Physiolibrary.Types.RealIO.TimeInput T0
        "elapsed time from the beginning of systole"                                       annotation(Placement(transformation(extent = {{-120.0,-30.0},{-80.0,10.0}}, origin = {8,-16.138}, rotation = 0), iconTransformation(extent = {{-126.0,-54.0},{-100.0,-28.0}}, origin = {0,-2}, rotation = 0), visible = true));
      Physiolibrary.Types.RealIO.TimeInput Tau
        "time constant of myocardial relaxation "                                        annotation(Placement(transformation(extent = {{-120.0,12.0},{-80.0,52.0}}, origin = {10,38}, rotation = 0), iconTransformation(extent = {{-126.0,24.0},{-100.0,50.0}}, origin = {0,-16}, rotation = 0), visible = true));
      Modelica.Blocks.Interfaces.RealOutput Et0
        "Relative elastance value (Elastance/End-Systolic Elastance)"                                         annotation(Placement(visible = true, transformation(origin = {114.0867,9.431800000000001}, extent = {{-14.0867,-14.0867},{14.0867,14.0867}}, rotation = 0), iconTransformation(origin = {110,8}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
    equation
      if T0 <= 3 / 2 * Tmax then
        Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * T0 - Modelica.Constants.pi / 2) + 1);
      else
        Et0 = 0.5 * exp(-(T0 - 3 * Tmax / 2) / Tau);
      end if;
      annotation(Icon(graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255},
                fillPattern=                                                                                       FillPattern.Solid, fillColor=  {170,213,255}),Text(extent=  {{-112,120},{148,96}}, lineColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,0}, textString=  "%name"),Text(extent=  {{-122,-36},{-48,-54}}, lineColor=  {0,0,255}, textString=  "T0"),Text(extent=  {{-108,26},{-56,12}}, lineColor=  {0,0,255}, textString=  "Tau"),Text(extent=  {{-102,80},{-50,66}}, lineColor=  {0,0,255}, textString=  "Tmax"),Text(extent=  {{50,16},{118,4}}, lineColor=  {0,0,255}, textString=  "Et0"),Text(extent=  {{-54,60},{114,78}}, lineColor=  {0,0,255}, textString=  "Elastance"),Line(points=  {{-66,-62},{-54,-34},{-36,-2},{0,44},{28,46},{40,-2},{56,-62}}, color=  {0,0,255}, smooth=  Smooth.Bezier),Line(points=  {{56,-62},{90,-62},{100,-62}}, color=  {0,0,255}, smooth=  Smooth.Bezier)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
    end EtTimingBurkhoff_HI;

    model HeartElastanceBurkhoff_HI
      "Elastance of heart artia and ventricules by Burkhoff"
      import BurkhoffModel;
      Modelica.Blocks.Interfaces.RealInput Et0
        "Relative elastance value (Elastance/EndSystolic Elastance)"                                        annotation(Placement(visible = true, transformation(origin = {-167.3974,74.6281}, extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin = {-108,-38}, extent = {{-9.999930000000001,-10},{10.0002,10}}, rotation = 0)));
      Physiolibrary.Types.RealIO.VolumeInput Vs "Stressed volume" annotation(Placement(visible = true, transformation(origin = {-167.3974,74.6281}, extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin = {-108,10}, extent = {{-9.999980000000001,-10},{10,9.99995}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Alpha
        "coefficient of end diastolic pressure-volume curve"                                          annotation(Placement(visible = true, transformation(origin = {-167.3974,74.6281}, extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin = {-107,69.0001}, extent = {{-8.99991,-9.0001},{9.00027,8.999919999999999}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Beta
        "coefficient of end diastolic pressure-volume curve"                                         annotation(Placement(visible = true, transformation(origin = {-167.3974,74.6281}, extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin = {-108,38}, extent = {{-9.99994,-10},{10.0002,10}}, rotation = 0)));
      Cardiovascular.Types.RealIO.HydraulicElastanceInput Ees
        "coefficient of end-systolic elastance"                                                               annotation(Placement(visible = true, transformation(origin = {-167.3974,74.6281}, extent = {{-20.0,-20.0},{20.0,20.0}}, rotation = 0), iconTransformation(origin = {-107,91}, extent = {{-8.99994,-9},{9.00018,9}}, rotation = 0)));
      Cardiovascular.Types.RealIO.HydraulicElastanceOutput Et "elasticity" annotation(Placement(transformation(extent = {{94.0,16.0},{114.0,36.0}}, origin = {0.0,0.0}, rotation = 0), iconTransformation(extent = {{100.0,20.0},{120.0,40.0}}, origin = {2,40}, rotation = 0), visible = true));
    equation
      //  Etpom = ((1 - Et0)*(Beta*(exp(Alpha*Vs*1e+6) - 1)))/(Vs*1e+6);
      //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
      //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;
        Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs  * 133.322368 + Et0 * Ees;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}, fillColor=  {170,213,255},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-42,90},{-42,-60},{82,-60}}, color=  {0,0,0}, smooth=  Smooth.None),Line(points=  {{-38,-58},{26,-56},{50,-54},{66,-52},{72,-50},{78,-48},{82,-46},{86,-44}}, color=  {0,0,0}, smooth=  Smooth.None),Line(points=  {{-38,-60},{4,88}}, color=  {0,0,0}, smooth=  Smooth.None),Line(points=  {{-38,-60},{84,56}}, color=  {255,0,0}, smooth=  Smooth.None),Polygon(points=  {{72,48},{68,56},{76,52},{72,48}}, lineColor=  {255,0,0}, smooth=  Smooth.None, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid),Polygon(points=  {{0,-4},{-4,4},{4,0},{0,-4}}, lineColor=  {255,0,0}, smooth=  Smooth.None, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, origin=  {80,45}, rotation=  180),Text(extent=  {{-98,102},{-48,76}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Ees"),Text(extent=  {{-98,54},{-38,24}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Beta"),Text(extent=  {{-104,78},{-32,54}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Alpha"),Text(extent=  {{-116,24},{-40,-8}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Vs"),Text(extent=  {{-112,-24},{-42,-52}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Et0"),Text(extent=  {{50,90},{104,52}}, lineColor=  {0,0,255}, fillColor=  {255,0,0},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Et"),Text(extent=  {{-100,-108},{100,-124}}, lineColor=  {0,0,255}, fillColor=  {170,213,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name")}));
    end HeartElastanceBurkhoff_HI;

    model HeartIntervals_HI
      discrete Physiolibrary.Types.Time HP(start = 0)
        "heart period - duration of cardiac cycle";
      Boolean b(start = false);
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation(Placement(transformation(extent = {{-134.0,8.0},{-94.0,48.0}}, origin = {1.3363,-48.0}, rotation = 0), iconTransformation(extent = {{-134.0,8.0},{-94.0,48.0}}, origin = {-6,24.2706}, rotation = 0), visible = true));
      Physiolibrary.Types.RealIO.TimeOutput Tasyst
        "time elapsed from the beginning of atrial systole"                                            annotation(Placement(visible = true, transformation(origin = {110.0,76.63339999999999}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0), iconTransformation(origin = {110,45.4846}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeOutput Tvsyst
        "time elapsed from the beginning of ventricular systole"                                            annotation(Placement(visible = true, transformation(origin = {110.0,30.0}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0), iconTransformation(origin = {110,12.8099}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeInput AVDelay "AV interval" annotation(Placement(visible = true, transformation(origin = {-0.0177,33.9592}, extent = {{-134.0,8.0},{-94.0,48.0}}, rotation = 0), iconTransformation(origin = {-6,-18}, extent = {{-134.0,8.0},{-94.0,48.0}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeOutput T0 "start time of cardiac cycle" annotation(Placement(visible = true, transformation(origin = {110.0,-23.4743}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0), iconTransformation(origin = {110,-36.728}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeOutput EDTV
        "Ventricular end Diastolic Time"                                          annotation(Placement(visible = true, transformation(origin = {110.0,-23.4743}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0), iconTransformation(origin = {110,-61.728}, extent = {{-10.0,-10.0},{10.0,10.0}}, rotation = 0)));
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
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
      annotation(Icon(graphics={  Rectangle(fillColor=  {170,213,255},
                fillPattern=                                                         FillPattern.Solid, extent=  {{-100,-100},{100,100}}, lineColor=  {0,0,0}),Text(visible=  true, origin=  {-22.8148,-7.7778}, lineColor=  {127,0,0}, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{42.8148,37.7778},{110.8148,75.5556}}, textString=  "Tasyst", fontName=  "Arial"),Text(visible=  true, origin=  {6.1844,12.2128}, lineColor=  {0,0,255}, extent=  {{-122.1844,53.5603},{113.8156,82.0142}}, textString=  "Heart Intervals", fontName=  "Arial"),Text(visible=  true, origin=  {-8,20}, lineColor=  {0,0,255}, extent=  {{-94.0,12.0},{-30.0,48.0}}, textString=  "HR", fontName=  "Arial"),Line(visible=  true, points=  {{-80,-6},{-80,-80}}, color=  {0,0,255}, thickness=  0.5),Line(visible=  true, points=  {{-70,-6},{-70,-80}}, color=  {0,0,255}, thickness=  0.5),Line(visible=  true, points=  {{-60,-6},{-60,-80}}, color=  {0,0,255}, thickness=  0.5),Line(visible=  true, points=  {{-32,-6},{-32,-80}}, color=  {0,0,255}, thickness=  0.5),Line(visible=  true, points=  {{30,-6},{30,-80}}, color=  {0,0,255}, thickness=  0.5),Line(visible=  true, points=  {{0,-6},{0,-80}}, color=  {0,0,255}, thickness=  0.5),Text(visible=  true, origin=  {-27.1481,39.1028}, lineColor=  {127,0,0}, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{47.1481,-42.1852},{114.1481,-4.963}}, textString=  "Tvsyst", fontName=  "Arial"),Text(lineColor=  {127,0,0}, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{34,-48},{88,-18}}, fontName=  "Arial", textString=  "T0"),Text(visible=  true, origin=  {57.0182,-15.6217}, lineColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-155.3698,12.0},{-49.5861,48.0}}, textString=  "AVDelay", fontName=  "Arial"),Text(lineColor=  {127,0,0}, fillColor=  {0,0,255},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{34,-78},{88,-48}}, fontName=  "Arial", textString=  "EDTV")}));
    end HeartIntervals_HI;

    model SideOfHeart_measured
      Parts.SideOfHeart side
        annotation (Placement(transformation(extent={{-34,-28},{58,46}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent={{-84,0},
                {-64,20}}),                                                                                                    iconTransformation(extent={{-6,-16},
                {14,4}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,22},{108,42}}),  iconTransformation(
              extent={{-10,46},{10,66}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "Intrathoracic Pressure" annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin={10,84}),    iconTransformation(extent={{-16,-16},
                {16,16}},                                                                                                    rotation = 270, origin={2,116})));
      Modelica.Blocks.Interfaces.RealInput AVGain
        "Ventricular-Atrial Interconnection Gain"                                           annotation(Placement(transformation(extent = {{-6,-6},{6,6}}, rotation = 270, origin={26,82}),    iconTransformation(extent={{-15,-15},
                {15,15}},
            rotation=270,
            origin={33,117})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-6,98}),                              iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=270,
            origin={-31,117})));
      Physiolibrary.Types.RealIO.TimeInput avDelay annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-22,80}),                            iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=270,
            origin={-67,117})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        bloodFlowMeasurement
        annotation (Placement(transformation(extent={{-58,0},{-38,20}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        bloodFlowMeasurement1
        annotation (Placement(transformation(extent={{64,22},{84,42}})));
    equation
      connect(AVGain, side.AVGain) annotation (Line(
          points={{26,82},{26,55.25},{23.5,55.25}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH, side.PTH) annotation (Line(
          points={{10,84},{10,54.88},{9.24,54.88}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(avDelay, side.avDelay) annotation (Line(
          points={{-22,80},{-22,55.25},{-22.5,55.25}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HR, side.HR) annotation (Line(
          points={{-6,98},{-6,55.25},{-5.94,55.25}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, bloodFlowMeasurement.q_in) annotation (Line(
          points={{-74,10},{-58,10}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_out, side.inflow) annotation (Line(
          points={{-38,10},{-8,10},{-8,9.74},{10.16,9.74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(side.outflow, bloodFlowMeasurement1.q_in) annotation (Line(
          points={{8.32,32.68},{23.16,32.68},{23.16,32},{64,32}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement1.q_out, outflow) annotation (Line(
          points={{84,32},{98,32}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.HR, HR) annotation (Line(
          points={{-48,17.6},{-48,90},{-6,90},{-6,98}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bloodFlowMeasurement1.HR, HR) annotation (Line(
          points={{74,39.6},{74,90},{-6,90},{-6,98}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(graphics={                                                                                                    Text(extent={{0,
                  104},{84,86}},                                                                                                    lineColor=  {0,0,255}, fillColor=  {85,170,255},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "AVGain"),
                                                                                                    Text(extent={{
                  -20,100},{26,82}},                                                                                                   lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {85,170,255},
                fillPattern=FillPattern.Solid,
              textString="PTh"),                                                                                                    Text(extent={{
                  -52,100},{-6,82}},                                                                                                   lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {85,170,255},
                fillPattern=FillPattern.Solid,
              textString="HR"),                                                                                                    Text(extent={{
                  -96,98},{-50,80}},                                                                                                   lineColor=
                  {0,0,255},                                                                                                    fillColor=
                  {85,170,255},
                fillPattern=FillPattern.Solid,
              textString="AvDelay")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
    end SideOfHeart_measured;
  end OldParts;

  package Models
    model HemodynamicsBurkhoff
      extends Cardiovascular.System(
        redeclare BurkhoffModel.Parts.Heart heart,
        redeclare BurkhoffModel.Parts.PulmonaryCirculation pulmonaryCirculation,
        redeclare BurkhoffModel.Parts.SystemicCirculation systemicCirculation);
      annotation (Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}})));
    end HemodynamicsBurkhoff;

    model HemodynamicsBurkhoffVolumeControl
      extends Cardiovascular.Control.SystemVolume(
        redeclare Parts.PulmonaryCirculation pulmonaryCirculation,
        redeclare Parts.Heart heart,
        redeclare Parts.SystemicCirculation systemicCirculation,
        volumeControl(enabled=true),
        desiredVolume(k=0.00495));
    equation
      volume = pulmonaryCirculation.arteryProximal.volume
      + pulmonaryCirculation.artery.volume
      + pulmonaryCirculation.veins.volume
      + systemicCirculation.AortaProximal.volume
      + systemicCirculation.SystemicArteries.volume
      + systemicCirculation.SystemicVeins.volume
      + heart.leftHeart.side.atrium.volume
      + heart.leftHeart.side.ventricle.volume
      + heart.rightHeart.side.atrium.volume
      + heart.rightHeart.side.ventricle.volume;
    end HemodynamicsBurkhoffVolumeControl;

    model HemodynamicsBurkhoff_flat
      Physiolibrary.Hydraulic.Components.ElasticVessel Cvs(
        volume_start=0.002701,
        ZeroPressureVolume=0.00223,
        Compliance=5.2504310309196e-07)
        annotation (Placement(transformation(extent={{-72,12},{-52,32}})));
      Physiolibrary.Hydraulic.Components.Conductor Ras(Conductance(displayUnit=
              "ml/(mmHg.s)") = 1.000057099075e-08)
        annotation (Placement(transformation(extent={{-46,12},{-26,32}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Cas(
        volume_start=0.000834,
        ZeroPressureVolume=0.0007,
        Compliance=1.2751046789376e-08)
        annotation (Placement(transformation(extent={{-24,12},{-4,32}})));
      Physiolibrary.Hydraulic.Components.Conductor Rcs(Conductance(displayUnit=
              "ml/(mmHg.s)") = 3.1252815680761e-07)
        annotation (Placement(transformation(extent={{-2,12},{18,32}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Caprox(
        volume_start=3.8e-05,
        ZeroPressureVolume=3e-05,
        Compliance=7.5006157584566e-10)
        annotation (Placement(transformation(extent={{20,12},{40,32}})));
      Physiolibrary.Hydraulic.Components.Conductor Rcprox(Conductance(
            displayUnit="ml/(mmHg.s)") = 3.7503078792283e-07)
        annotation (Placement(transformation(extent={{42,12},{62,32}})));
      Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-06)     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={80,2})));
      Parts.ElasticVesselWithSVandP                    LV(
        useComplianceInput=true,
        volume_start=0.000125,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{92,-8},{112,12}})));
      Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.0002463033826e-06)    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={122,0})));
      Parts.ElasticVesselWithSVandP                    LA(
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=8.1e-05,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{158,-10},{178,10}})));
      Physiolibrary.Hydraulic.Components.Conductor RVP(Conductance(displayUnit=
              "ml/(mmHg.s)") = 5.0004355076902e-07)
        annotation (Placement(transformation(extent={{186,-2},{206,18}})));
      Physiolibrary.Hydraulic.Components.Conductor Rvs(Conductance(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-07)
        annotation (Placement(transformation(extent={{-84,-36},{-64,-16}})));
      Parts.ElasticVesselWithSVandP                    RA(
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=7.3e-05,
        ZeroPressureVolume=5e-06)
        annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
      Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.0002463033826e-06)    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={4,-40})));
      Parts.ElasticVesselWithSVandP                    RV(
        useComplianceInput=true,
        volume_start=0.000112,
        ZeroPressureVolume=5e-06,
        ExternalPressure=0)
        annotation (Placement(transformation(extent={{16,-50},{36,-30}})));
      Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-06)    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={50,-40})));
      Physiolibrary.Hydraulic.Components.Conductor Rcsp(Conductance(displayUnit=
             "ml/(mmHg.s)") = 3.7503078792283e-07)
        annotation (Placement(transformation(extent={{70,-50},{90,-30}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Cap(
        volume_start=0.000802,
        ZeroPressureVolume=0.0006,
        Compliance=1.5001231516913e-07)
        annotation (Placement(transformation(extent={{144,-48},{164,-28}})));
      Physiolibrary.Hydraulic.Components.Conductor Rcp(Conductance(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-07)
        annotation (Placement(transformation(extent={{122,-48},{142,-28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Cvp(
        volume_start=0.000154,
        ZeroPressureVolume=0.0001,
        Compliance=5.2504310309196e-08)
        annotation (Placement(transformation(extent={{184,-48},{204,-28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel Capprox(
        volume_start=3e-05,
        ZeroPressureVolume=2e-05,
        Compliance=7.5006157584566e-09)
        annotation (Placement(transformation(extent={{98,-48},{118,-28}})));
      Physiolibrary.Hydraulic.Components.Conductor Rap(Conductance(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-07)
        annotation (Placement(transformation(extent={{164,-48},{184,-28}})));
      Parts.AtrialElastance               atrialElastance(
        Alpha=0.04,
        Beta=0.3,
        Tmax(displayUnit="ms") = 0.125,
        Tau(displayUnit="ms") = 0.02,
        Ees=26664477.483)
        annotation (Placement(transformation(extent={{-54,-20},{-20,6}})));
      Parts.VentricularElastance               ventricularElastance(
        Alpha=0.024,
        Beta=0.34,
        Tmax(displayUnit="ms") = 0.2,
        Tau(displayUnit="ms") = 0.03,
        Ees=50662507.2177)
        annotation (Placement(transformation(extent={{4,-24},{38,2}})));
      Parts.AtrialElastance               atrialElastance1(
        Alpha=0.04,
        Beta=0.3,
        Tmax(displayUnit="ms") = 0.125,
        Tau(displayUnit="ms") = 0.02,
        Ees=33330596.85375)
        annotation (Placement(transformation(extent={{-17,-13},{17,13}},
            rotation=0,
            origin={153,31})));
      Parts.VentricularElastance               ventricularElastance1(
        Alpha=0.024,
        Beta=0.34,
        Tmax(displayUnit="ms") = 0.2,
        Tau(displayUnit="ms") = 0.03,
        Ees=205316476.6191)
        annotation (Placement(transformation(extent={{78,20},{112,46}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation=180,   origin={-29,-59})));
      Modelica.Blocks.Sources.Constant AVGain(k=0.02)
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
            rotation=180,
            origin={-14,-54})));
      Modelica.Blocks.Math.Product product1
                                           annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation=0,     origin={137,-21})));
      Modelica.Blocks.Sources.Constant AVGain1(
                                              k=0.02)
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
            rotation=0,
            origin={120,-16})));
      Physiolibrary.Types.Constants.FrequencyConst heartRate(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-94,42},{-84,52}})));
    equation
      connect(Cvs.q_in, Ras.q_in) annotation (Line(
          points={{-62,22},{-46,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Ras.q_out, Cas.q_in) annotation (Line(
          points={{-26,22},{-14,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cas.q_in, Rcs.q_in) annotation (Line(
          points={{-14,22},{-2,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcs.q_out, Caprox.q_in) annotation (Line(
          points={{18,22},{30,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcprox.q_in, Caprox.q_in) annotation (Line(
          points={{42,22},{30,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AOV.q_out, Rcprox.q_out) annotation (Line(
          points={{70,2},{66,2},{66,22},{62,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(AOV.q_in, LV.q_in) annotation (Line(
          points={{90,2},{102,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LV.q_in, MV.q_out) annotation (Line(
          points={{102,2},{108,2},{108,1.55431e-15},{112,1.55431e-15}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LA.q_in, RVP.q_in) annotation (Line(
          points={{168,8.88178e-16},{178,8.88178e-16},{178,8},{186,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rvs.q_in, Cvs.q_in) annotation (Line(
          points={{-84,-26},{-84,22},{-62,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rvs.q_out, RA.q_in) annotation (Line(
          points={{-64,-26},{-58,-26},{-58,-40},{-50,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(TV.q_out, RV.q_in) annotation (Line(
          points={{14,-40},{26,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RV.q_in, PV.q_in) annotation (Line(
          points={{26,-40},{40,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PV.q_out, Rcsp.q_in) annotation (Line(
          points={{60,-40},{70,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cvp.q_in, RVP.q_out) annotation (Line(
          points={{194,-38},{206,-38},{206,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcsp.q_out, Capprox.q_in) annotation (Line(
          points={{90,-40},{98,-40},{98,-38},{108,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Capprox.q_in, Rcp.q_in) annotation (Line(
          points={{108,-38},{122,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rcp.q_out, Cap.q_in) annotation (Line(
          points={{142,-38},{154,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Cap.q_in, Rap.q_in) annotation (Line(
          points={{154,-38},{164,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Rap.q_out, Cvp.q_in) annotation (Line(
          points={{184,-38},{194,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RA.compliance, atrialElastance.Ct) annotation (Line(
          points={{-50,-32},{-50,-24},{-18,-24},{-18,-10},{-17.96,-10},{-17.96,
              2.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance.Ct, RV.compliance) annotation (Line(
          points={{40.04,-1.9},{46,-1.9},{46,-28},{26,-28},{26,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LA.compliance, atrialElastance1.Ct) annotation (Line(
          points={{168,8},{172.04,8},{172.04,40.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance1.Ct, LV.compliance) annotation (Line(
          points={{114.04,42.1},{114.04,31.05},{102,31.05},{102,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RV.pressure, product.u1) annotation (Line(
          points={{34.4,-50},{36,-50},{36,-62},{-23,-62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, RA.externalPressure) annotation (Line(
          points={{-34.5,-59},{-38,-59},{-38,-32},{-42,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.u2, AVGain.y) annotation (Line(
          points={{-23,-56},{-20,-56},{-20,-54},{-18.4,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LV.pressure, product1.u2) annotation (Line(
          points={{110.4,-8},{110,-8},{110,-24},{131,-24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVGain1.y, product1.u1) annotation (Line(
          points={{124.4,-16},{128,-16},{128,-18},{131,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, LA.externalPressure) annotation (Line(
          points={{142.5,-21},{182,-21},{182,8},{176,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, atrialElastance.HR) annotation (Line(
          points={{-82.75,47},{-78,47},{-78,6},{-66,6},{-66,3.79},{-52.13,3.79}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(ventricularElastance.HR, atrialElastance.HR) annotation (Line(
          points={{5.87,-0.21},{-2,-0.21},{-2,6},{-58,6},{-58,3.79},{-52.13,
              3.79}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(atrialElastance1.HR, heartRate.y) annotation (Line(
          points={{137.87,41.79},{128,41.79},{128,47},{-82.75,47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance1.HR, heartRate.y) annotation (Line(
          points={{79.87,43.79},{62,43.79},{62,47},{-82.75,47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RA.StressedVolume, atrialElastance.Vs) annotation (Line(
          points={{-54.4,-29.8},{-54.4,-19.9},{-52.3,-19.9},{-52.3,-10.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LV.StressedVolume, ventricularElastance1.Vs) annotation (Line(
          points={{97.6,12.2},{97.6,16},{79.7,16},{79.7,29.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RV.StressedVolume, ventricularElastance.Vs) annotation (Line(
          points={{21.6,-29.8},{21.6,-28},{6,-28},{6,-22},{5.7,-22},{5.7,-14.9}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(LA.StressedVolume, atrialElastance1.Vs) annotation (Line(
          points={{163.6,10.2},{137.7,10.2},{137.7,27.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RA.q_in, TV.q_in) annotation (Line(
          points={{-50,-40},{-6,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LA.q_in, MV.q_in) annotation (Line(
          points={{168,8.88178e-16},{156,8.88178e-16},{156,-8.88178e-16},{132,
              -8.88178e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{220,100}}),      graphics), Icon(coordinateSystem(extent=
               {{-100,-100},{220,100}})));
    end HemodynamicsBurkhoff_flat;
  end Models;

  package Experiment
    model BurkhoffHemodynamics_volume_control
      extends MeursModel.Experiment.Hemodynamics_volume_control(redeclare
          BurkhoffModel.Experiment.HemodynamicsBurkhoff_with_catheter
          hemodynamics_with_catheter,
          desiredVolume(k=0.00515));
      annotation (Diagram(coordinateSystem(extent={{-80,-40},{100,60}})), Icon(
            coordinateSystem(extent={{-80,-40},{100,60}})));
    end BurkhoffHemodynamics_volume_control;

    model HemodynamicsBurkhoff_with_catheter
      extends Models.HemodynamicsBurkhoff;
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-32,22}),                         iconTransformation(extent={{-6,-6},
                {6,6}},
            rotation=180,
            origin={-24,24})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a catheter annotation (
          Placement(transformation(extent={{-34,-16},{-14,4}}), iconTransformation(
              extent={{-28,-10},{-14,4}})));
    equation
      volume = heart.rightHeart.atrium.volume
      +heart.rightHeart.ventricle.volume
      +heart.leftHeart.atrium.volume
      +heart.leftHeart.ventricle.volume
      + systemicCirculation.SystemicVeins.volume
      + systemicCirculation.SystemicArteries.volume
      + systemicCirculation.AortaProximal.volume
      + pulmonaryCirculation.arteryProximal.volume
      + pulmonaryCirculation.artery.volume
      + pulmonaryCirculation.veins.volume;
      connect(catheter, heart.rightHeartInflow) annotation (Line(
          points={{-24,-6},{-14,-6},{-14,-2.08},{-8,-2.08}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},
                {40,40}}),  graphics={Text(
              extent={{-12,38},{0,30}},
              lineColor={190,0,0},
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="=pulmonary.volume+
heart.volume+
systemic.volume")}),     Icon(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},
                {40,40}}),     graphics));
    end HemodynamicsBurkhoff_with_catheter;
  end Experiment;
  annotation(uses(                                                             MeursModel(version = "1"), HeamodynamicsDymola(version = "1"),
      Cardiovascular(version="1"),
      Physiolibrary(version="2.2.0"),
      Modelica(version="3.2.1")), Documentation(revisions="<html>
<p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Tomas Kulhanek, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"),
    version="1.2",
    conversion(noneFromVersion=""));
end BurkhoffModel;
