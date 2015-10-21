within ;
package Acoustical

  package Parts
      extends Modelica.Icons.UtilitiesPackage;
  partial model CochleaSection

    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a tympaniInflow
      annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b tympaniOutflow
      annotation (Placement(transformation(extent={{90,30},{110,50}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a vestibuliInflow
      annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b vestibuliOutflow
      annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end CochleaSection;

  model CochleaPartition
    extends CochleaSection;
    Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
          displayUnit="ml/(mmHg.s)") = 1.2000985213531e-07)
      annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
    Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
            "mmHg.s2/ml") = 93325.6711905)
      annotation (Placement(transformation(extent={{-70,52},{-50,72}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel(
      useExternalPressureInput=true,
      volume_start=5.5e-09,
      ZeroPressureVolume=1e-14,
      CollapsingPressureVolume=1e-15,
      Compliance=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-28,50},{-8,30}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor1(Conductance(
          displayUnit="ml/(mmHg.s)") = 7.5006157584566e-08)
      annotation (Placement(transformation(extent={{34,30},{54,50}})));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(extent={{-32,-32},{-12,-12}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor2(Conductance(
          displayUnit="ml/(mmHg.s)") = 1.2000985213531e-07)
      annotation (Placement(transformation(extent={{54,-50},{34,-30}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel1(
      useExternalPressureInput=false,
      volume_start=7.5e-09,
      ZeroPressureVolume=1e-14,
      CollapsingPressureVolume=1e-15,
      Compliance=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-8,-50},{12,-30}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor3(Conductance=
          1.2501026264094e-09)
      annotation (Placement(transformation(extent={{-50,-50},{-70,-30}})));
    Physiolibrary.Hydraulic.Components.Inertia inertia1(I(displayUnit=
            "mmHg.s2/ml") = 93325.6711905) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={44,-22})));
  equation
    connect(pressureMeasure.pressure, elasticVessel.externalPressure)
      annotation (Line(
        points={{-16,-26},{-10,-26},{-10,32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tympaniInflow, conductor.q_in) annotation (Line(
        points={{-100,40},{-70,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor.q_out, elasticVessel.q_in) annotation (Line(
        points={{-50,40},{-18,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor1.q_in, elasticVessel.q_in) annotation (Line(
        points={{34,40},{-18,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor1.q_out, tympaniOutflow) annotation (Line(
        points={{54,40},{100,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor.q_in, inertia.q_in) annotation (Line(
        points={{-70,40},{-70,62}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(inertia.q_out, conductor.q_out) annotation (Line(
        points={{-50,62},{-50,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(vestibuliInflow, conductor2.q_in) annotation (Line(
        points={{100,-40},{54,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor2.q_out, elasticVessel1.q_in) annotation (Line(
        points={{34,-40},{2,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel1.q_in, conductor3.q_in) annotation (Line(
        points={{2,-40},{-50,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor3.q_out, vestibuliOutflow) annotation (Line(
        points={{-70,-40},{-100,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pressureMeasure.q_in, conductor3.q_in) annotation (Line(
        points={{-26,-28},{-26,-40},{-50,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor2.q_in, inertia1.q_in) annotation (Line(
        points={{54,-40},{54,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(inertia1.q_out, conductor2.q_out) annotation (Line(
        points={{34,-22},{34,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={
          Polygon(
            points={{-100,40},{-82,0},{100,0},{100,40},{98,48},{60,54},{20,74},
                {-18,56},{-100,44},{-100,40}},
            lineColor={0,0,255},
            smooth=Smooth.Bezier,
            fillPattern=FillPattern.Solid,
            fillColor={165,165,255}),
          Polygon(
            points={{-100,-40},{-94,0},{0,0},{100,-10},{100,-40},{80,-76},{0,-100},
                {-30,-40},{-56,-32},{-100,-40}},
            lineColor={0,0,255},
            smooth=Smooth.Bezier,
            fillPattern=FillPattern.Solid,
            fillColor={255,165,165}),
          Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}));
  end CochleaPartition;

  model Helicotrema
    extends BoundarySection;
      CochlearResistor cochlearResistor(A=0.5e-6, L=0.001) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,0})));
  equation
      connect(tympaniInflow, cochlearResistor.q_in) annotation (Line(
          points={{-100,40},{4,40},{4,10},{6,10}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cochlearResistor.q_out, vestibuliOutflow) annotation (Line(
          points={{6,-10},{6,-40},{-100,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                                 graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Polygon(
            points={{-100,38},{-22,2},{0,-2},{0,-12},{-26,-6},{-100,-38},{-88,-62},
                {72,-56},{100,-20},{100,20},{16,42},{-94,44},{-100,38}},
            lineColor={255,165,165},
            smooth=Smooth.Bezier,
            fillPattern=FillPattern.Forward,
            fillColor={165,165,255}), Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,0},
            lineThickness=1,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}));
  end Helicotrema;

  model BasicCochlea

    CochleaPartition cochleaPartition
      annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
    CochleaPartition cochleaPartition1
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    CochleaPartition cochleaPartition2
      annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
    CochleaPartition cochleaPartition3
      annotation (Placement(transformation(extent={{28,-10},{48,10}})));
    Helicotrema helicotrema
      annotation (Placement(transformation(extent={{66,-10},{86,10}})));
    CochleaInput cochleaInput
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
    Modelica.Blocks.Sources.Sine sine(
      freqHz=110,
      startTime=10,
      amplitude=0.1)
      annotation (Placement(transformation(extent={{-86,32},{-66,52}})));
  equation
    connect(cochleaPartition.tympaniOutflow, cochleaPartition1.tympaniInflow)
      annotation (Line(
        points={{-54,4},{-40,4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition1.tympaniOutflow, cochleaPartition2.tympaniInflow)
      annotation (Line(
        points={{-20,4},{-4,4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition2.tympaniOutflow, cochleaPartition3.tympaniInflow)
      annotation (Line(
        points={{16,4},{28,4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition3.tympaniOutflow, helicotrema.tympaniInflow)
      annotation (Line(
        points={{48,4},{66,4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(helicotrema.vestibuliOutflow, cochleaPartition3.vestibuliInflow)
      annotation (Line(
        points={{66,-4},{48,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition3.vestibuliOutflow, cochleaPartition2.vestibuliInflow)
      annotation (Line(
        points={{28,-4},{16,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition2.vestibuliOutflow, cochleaPartition1.vestibuliInflow)
      annotation (Line(
        points={{-4,-4},{-20,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaPartition1.vestibuliOutflow, cochleaPartition.vestibuliInflow)
      annotation (Line(
        points={{-40,-4},{-54,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaInput.vestibuliInflow, cochleaPartition.vestibuliOutflow)
      annotation (Line(
        points={{-81,-4},{-74,-4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(cochleaInput.tympaniOutflow, cochleaPartition.tympaniInflow)
      annotation (Line(
        points={{-81,4},{-74,4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sine.y, cochleaInput.pressure) annotation (Line(
        points={{-65,42},{-54,42},{-54,20},{-94,20},{-94,7},{-88,7}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end BasicCochlea;

  partial model BoundarySection

    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a tympaniInflow
      annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b vestibuliOutflow
      annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end BoundarySection;

  model CochleaInput

    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b tympaniOutflow
      annotation (Placement(transformation(extent={{80,30},{100,50}}),
          iconTransformation(extent={{80,30},{100,50}})));
    Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a vestibuliInflow
      annotation (Placement(transformation(extent={{80,-50},{100,-30}}),
          iconTransformation(extent={{80,-50},{100,-30}})));
    Physiolibrary.Types.RealIO.PressureInput pressure annotation (Placement(
          transformation(extent={{0,50},{40,90}}), iconTransformation(extent={{
              0,50},{40,90}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel ovalWindow(
        useExternalPressureInput=true,
        volume_start=1.9e-09,
        ZeroPressureVolume=1e-14,
        CollapsingPressureVolume=1e-15,
        Compliance=1.5001231516913e-08)
        annotation (Placement(transformation(extent={{32,30},{52,50}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel roundWindow(
        volume_start=1.9e-09,
        ZeroPressureVolume=1e-14,
        CollapsingPressureVolume=1e-15,
        Compliance=1.5001231516913e-08)
        annotation (Placement(transformation(extent={{34,-50},{54,-30}})));
      CochlearResistor cochlearResistor(A=0.5e-6, L(displayUnit="mm") = 1e-06)
        annotation (Placement(transformation(extent={{60,30},{80,50}})));
      CochlearResistor cochlearResistor1(A=1e-6, L=0.001)
        annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
  equation
      connect(ovalWindow.externalPressure, pressure) annotation (Line(
          points={{50,48},{50,70},{20,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tympaniOutflow, cochlearResistor.q_out) annotation (Line(
          points={{90,40},{80,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cochlearResistor.q_in, ovalWindow.q_in) annotation (Line(
          points={{60,40},{42,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(vestibuliInflow, cochlearResistor1.q_out) annotation (Line(
          points={{90,-40},{80,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cochlearResistor1.q_in, roundWindow.q_in) annotation (Line(
          points={{60,-40},{44,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                           graphics={
          Ellipse(
            extent={{84,68},{58,2}},
            lineColor={0,0,0},
            fillColor={165,165,255},
            fillPattern=FillPattern.Forward),
          Ellipse(
            extent={{54,-26},{86,-68}},
            lineColor={0,0,0},
            fillColor={255,165,165},
            fillPattern=FillPattern.Solid),
          Ellipse(extent={{30,88},{100,-86}},   lineColor={0,0,0})}), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                      graphics));
  end CochleaInput;

  model CochleaTest2

    Modelica.Blocks.Sources.Sine sine(
      amplitude=1,
      freqHz=110,
      startTime=10)
      annotation (Placement(transformation(extent={{-86,30},{-66,50}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel(
      volume_start=5.5e-09,
      Compliance=1.5001231516913e-08,
      useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{-34,28},{-14,48}})));
    Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
          displayUnit="ml/(mmHg.s)") = 1.5001231516913e-08)
      annotation (Placement(transformation(extent={{14,28},{34,48}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel1(
        volume_start=7.5e-09, Compliance=1.5001231516913e-08)
      annotation (Placement(transformation(extent={{62,28},{82,48}})));
  equation
    connect(sine.y, elasticVessel.externalPressure) annotation (Line(
        points={{-65,40},{-50,40},{-50,52},{-16,52},{-16,46}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(elasticVessel.q_in, conductor.q_in) annotation (Line(
        points={{-24,38},{14,38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(conductor.q_out, elasticVessel1.q_in) annotation (Line(
        points={{34,38},{72,38}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end CochleaTest2;

  model CochleaPartitionSimple
    extends CochleaSection;
    CochlearResistor resistor(
      A=2.5e-6, L(displayUnit="m"))
      annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel(
        volume_start=5.5e-09,
        ZeroPressureVolume=1.1e-09,
        CollapsingPressureVolume=1e-09,
        Compliance=1.5001231516913e-11,
        useExternalPressureInput=true)
      annotation (Placement(transformation(extent={{-30,50},{-10,30}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel elasticVessel1(
      useExternalPressureInput=false,
        volume_start=7.5e-09,
        ZeroPressureVolume=1.1e-09,
        CollapsingPressureVolume=1e-09,
        Compliance=1.5001231516913e-11)
      annotation (Placement(transformation(extent={{-8,-50},{12,-30}})));
    CochlearResistor resistor1(
      A=2.5e-6, L(displayUnit="mm"))
      annotation (Placement(transformation(extent={{40,30},{60,50}})));
    CochlearResistor resistor2(
      A=1e-6, L(displayUnit="mm"))
              annotation (Placement(transformation(extent={{54,-50},{74,-30}})));
    CochlearResistor resistor3(
      A=1e-6, L(displayUnit="mm"))
              annotation (Placement(transformation(extent={{-62,-50},{-42,-30}})));
      Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
        annotation (Placement(transformation(extent={{-34,-34},{-14,-14}})));
      Physiolibrary.Blocks.Factors.DamagedFraction damagedFraction(
          DamagedAreaFraction=0.5) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-10,2})));
  equation
    connect(tympaniInflow, resistor.q_in) annotation (Line(
        points={{-100,40},{-70,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(resistor.q_out, elasticVessel.q_in) annotation (Line(
        points={{-50,40},{-20,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel.q_in, resistor1.q_in) annotation (Line(
        points={{-20,40},{40,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(resistor1.q_out, tympaniOutflow) annotation (Line(
        points={{60,40},{100,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(vestibuliInflow, resistor2.q_out) annotation (Line(
        points={{100,-40},{74,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(resistor2.q_in, elasticVessel1.q_in) annotation (Line(
        points={{54,-40},{2,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(elasticVessel1.q_in, resistor3.q_out) annotation (Line(
        points={{2,-40},{-42,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(resistor3.q_in, vestibuliOutflow) annotation (Line(
        points={{-62,-40},{-100,-40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(pressureMeasure.q_in, resistor3.q_out) annotation (Line(
          points={{-28,-30},{-28,-40},{-42,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(damagedFraction.y, elasticVessel.externalPressure) annotation (
          Line(
          points={{-10,6},{-12,6},{-12,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.pressure, damagedFraction.yBase) annotation (Line(
          points={{-18,-28},{-14,-28},{-14,0},{-10,0}},
          color={0,0,127},
          smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),    graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={
          Polygon(
            points={{-100,40},{-82,0},{100,0},{100,40},{98,48},{60,54},{20,74},
                {-18,56},{-100,44},{-100,40}},
            lineColor={0,0,255},
            smooth=Smooth.Bezier,
            fillPattern=FillPattern.Solid,
            fillColor={165,165,255}),
          Polygon(
            points={{-100,-40},{-94,0},{0,0},{100,-10},{100,-40},{80,-76},{0,-100},
                {-30,-40},{-56,-32},{-100,-40}},
            lineColor={0,0,255},
            smooth=Smooth.Bezier,
            fillPattern=FillPattern.Solid,
            fillColor={255,165,165}),
          Text(
            extent={{-100,100},{100,60}},
            lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}));
  end CochleaPartitionSimple;

  model CortiOrgan
    extends Physiolibrary.Hydraulic.Components.ElasticVessel(
      useExternalPressureInput=false,
      volume_start=5.5e-09,
      ZeroPressureVolume=1e-14,
      CollapsingPressureVolume=1e-10,
      Compliance=1.5001231516913e-08);
  end CortiOrgan;

  model ElasticCochlearPart
    extends Physiolibrary.Hydraulic.Components.ElasticVessel(final Compliance = 1/E);

  end ElasticCochlearPart;

    model CochlearResistor " G = Pi*R^4/(8*mi*L) = A^2/(8*Pi*mi*L)"
      extends Physiolibrary.Hydraulic.Components.Conductor(final Conductance = (A^2)/(8*Modelica.Constants.pi*mi*L));
    /*  parameter Physiolibrary.Types.HydraulicResistance R 
    "Hydraulic conductance if useConductanceInput=false";*/
      parameter Modelica.SIunits.Area A(nominal=1e-6) = 2.5e-6;
      parameter Modelica.SIunits.Length L(nominal=0.001) = 0.0025;
      parameter Modelica.SIunits.DynamicViscosity mi(nominal=1e-4) = 8.9e-4; //8.9e-4 for water
    end CochlearResistor;
  annotation (uses(Physiolibrary(version="2.3.1alpha"), Modelica(version=
            "3.2.1")));
  end Parts;

model CochleaTest

  Parts.CochleaInput cochleaInput
      annotation (Placement(transformation(extent={{-86,-12},{-66,8}})));
  Parts.Helicotrema helicotrema
      annotation (Placement(transformation(extent={{80,-12},{100,8}})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=110,
      startTime=30,
      amplitude=1)
    annotation (Placement(transformation(extent={{-92,22},{-72,42}})));
  Parts.CochleaPartitionSimple cochleaPartitionSimple
      annotation (Placement(transformation(extent={{-54,-12},{-34,8}})));
  Parts.CochleaPartitionSimple cochleaPartitionSimple1
      annotation (Placement(transformation(extent={{-28,-12},{-8,8}})));
  Parts.CochleaPartitionSimple cochleaPartitionSimple2
      annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
  Parts.CochleaPartitionSimple cochleaPartitionSimple3
      annotation (Placement(transformation(extent={{24,-12},{44,8}})));
  Parts.CochleaPartitionSimple cochleaPartitionSimple4
      annotation (Placement(transformation(extent={{52,-12},{72,8}})));
equation
  connect(sine.y, cochleaInput.pressure) annotation (Line(
      points={{-71,32},{-72,32},{-72,10},{-82,10},{-82,5},{-74,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cochleaInput.tympaniOutflow, cochleaPartitionSimple.tympaniInflow)
    annotation (Line(
      points={{-67,2},{-54,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple.vestibuliOutflow, cochleaInput.vestibuliInflow)
    annotation (Line(
      points={{-54,-6},{-67,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple.tympaniOutflow, cochleaPartitionSimple1.tympaniInflow)
    annotation (Line(
      points={{-34,2},{-28,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple1.tympaniOutflow, cochleaPartitionSimple2.tympaniInflow)
    annotation (Line(
      points={{-8,2},{-2,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple2.tympaniOutflow, cochleaPartitionSimple3.tympaniInflow)
    annotation (Line(
      points={{18,2},{22,2},{22,2},{24,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple3.tympaniOutflow, cochleaPartitionSimple4.tympaniInflow)
    annotation (Line(
      points={{44,2},{52,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple4.tympaniOutflow, helicotrema.tympaniInflow)
    annotation (Line(
      points={{72,2},{76,2},{76,2},{80,2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(helicotrema.vestibuliOutflow, cochleaPartitionSimple4.vestibuliInflow)
    annotation (Line(
      points={{80,-6},{72,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple4.vestibuliOutflow, cochleaPartitionSimple3.vestibuliInflow)
    annotation (Line(
      points={{52,-6},{44,-6},{44,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple3.vestibuliOutflow, cochleaPartitionSimple2.vestibuliInflow)
    annotation (Line(
      points={{24,-6},{18,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple2.vestibuliOutflow, cochleaPartitionSimple1.vestibuliInflow)
    annotation (Line(
      points={{-2,-6},{-8,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(cochleaPartitionSimple1.vestibuliOutflow, cochleaPartitionSimple.vestibuliInflow)
    annotation (Line(
      points={{-28,-6},{-34,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end CochleaTest;

  package Tests
  end Tests;
  annotation (uses(Modelica(version="3.2.1"), Physiolibrary(version=
            "2.3.1alpha")));
end Acoustical;
