package Cardiovascular "Extension library of Physiolibrary"

  package Examples
    extends Modelica.Icons.ExamplesPackage;

    model pulses "example pulse flow generator"
      import Physiolibrary.Types.*;
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate
        annotation (Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));
      discrete Time T0 "begining of cardiac cycle";
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
        T0 = time "set begining of cardiac cycle";
        HP = 1/HR "update length of carciac cycle";
        TD2 = TD1 + (2/5)*HP "compute end time of systole";
      end when;
      tc = time - T0 "relative time in carciac cycle";
      volumeflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
        (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
      "zero before and after systole, otherwise sin up to peak flow";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
                  extent={{-80,80},{80,-80}},
                  lineColor={0,0,255},
                  fillColor={255,255,170},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,
                2},{-20,0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},
                {50,0},{74,0}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}));
    end pulses;
  end Examples;
  extends Modelica.Icons.Package;

  package Test
    extends Modelica.Icons.Package;

    model CollapsingCVS
    Physiolibrary.Hydraulic.Components.Pump pump(useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-16,6},{4,26}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel(volume_start
        =0.0001, Compliance=7.5006157584566e-09)
      annotation (Placement(transformation(extent={{22,8},{42,28}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance=
          1.2501026264094e-10)
      annotation (Placement(transformation(extent={{60,8},{80,28}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel1(
        volume_start=0.0001, Compliance=7.5006157584566e-09)
      annotation (Placement(transformation(extent={{62,-42},{82,-22}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor1(Conductance=
          1.2501026264094e-10)
      annotation (Placement(transformation(extent={{26,-42},{46,-22}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel2(
        volume_start=0.0008, Compliance=7.5006157584566e-09)
      annotation (Placement(transformation(extent={{-50,-44},{-30,-24}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor2(Conductance=
          1.2501026264094e-10)
      annotation (Placement(transformation(extent={{-84,-44},{-64,-24}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel3(
        volume_start=0.0012, Compliance=7.5006157584566e-09)
      annotation (Placement(transformation(extent={{-84,2},{-64,22}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor3(Conductance=
          1.2501026264094e-10)
      annotation (Placement(transformation(extent={{-52,4},{-32,24}})));
    Examples.pulses pulses(TD1(displayUnit="s"))
      annotation (Placement(transformation(extent={{-32,30},{-12,50}})));
    equation
    connect(pump.q_out, elasticVessel.q_in) annotation (Line(
        points={{4,16},{18,16},{18,18},{32,18}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel.q_in, conductor.q_in) annotation (Line(
        points={{32,18},{60,18}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor.q_out, elasticVessel1.q_in) annotation (Line(
        points={{80,18},{82,18},{82,-32},{72,-32}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel1.q_in, conductor1.q_out) annotation (Line(
        points={{72,-32},{46,-32}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor1.q_in, elasticVessel2.q_in) annotation (Line(
        points={{26,-32},{-8,-32},{-8,-34},{-40,-34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel2.q_in, conductor2.q_out) annotation (Line(
        points={{-40,-34},{-64,-34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor2.q_in, elasticVessel3.q_in) annotation (Line(
        points={{-84,-34},{-86,-34},{-86,12},{-74,12}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel3.q_in, conductor3.q_in) annotation (Line(
        points={{-74,12},{-64,12},{-64,14},{-52,14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor3.q_out, pump.q_in) annotation (Line(
        points={{-32,14},{-24,14},{-24,16},{-16,16}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulses.volumeflowrate, pump.solutionFlow) annotation (Line(
        points={{-13,40},{-6,40},{-6,20}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
    end CollapsingCVS;
  end Test;
  annotation (
    Documentation(info="<html>
<p>Cardiovascular is package extending the Physiolibrary <a href=\"http://www.physiolibrary.org\">http://www.physiolibrary.org</a> containing blocks and models which are useful to model cardiovascular system and related parts.  The blocks are in development stage and some of them may appear in Physiolibrary in future.</p>
</html>", revisions="<html>
  <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
  <p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
  <p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
  </html>"),
    uses(
      Physiolibrary(version="2.2.0"),
      Modelica(version="3.2.1")),
    version="1",
    conversion(noneFromVersion=""));
end Cardiovascular;
model Cardiovascular_Test_CollapsingCVS
 extends Cardiovascular.Test.CollapsingCVS;
  annotation(experiment(
    StopTime=1100,
    __Dymola_NumberOfIntervals=5000,
    Tolerance=0.01,
    __Dymola_Algorithm="dassl"),uses(Cardiovascular(version="1")));
end Cardiovascular_Test_CollapsingCVS;
