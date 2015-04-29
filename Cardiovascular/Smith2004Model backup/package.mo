within ;
package Smith2004Model
  model Hemodynamics_flat
    Physiolibrary.Hydraulic.Components.ElasticVessel aorta
      annotation (Placement(transformation(extent={{-74,-32},{-54,-12}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel venaCava
      annotation (Placement(transformation(extent={{-74,24},{-54,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve aorticValve
      annotation (Placement(transformation(extent={{-26,-32},{-46,-12}})));
    Physiolibrary.Hydraulic.Components.Conductor systemic annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,4})));
    Physiolibrary.Hydraulic.Components.IdealValve tricupsidValve
      annotation (Placement(transformation(extent={{-40,26},{-20,46}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle
      annotation (Placement(transformation(extent={{-2,26},{18,46}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle
      annotation (Placement(transformation(extent={{8,-32},{28,-12}})));
    Physiolibrary.Hydraulic.Components.Inertia inertiaAV annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-10,-22})));
    Physiolibrary.Hydraulic.Components.Inertia inertiaPV
      annotation (Placement(transformation(extent={{24,24},{44,44}})));
    Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve
      annotation (Placement(transformation(extent={{50,24},{70,44}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries
      annotation (Placement(transformation(extent={{80,26},{100,46}})));
    Physiolibrary.Hydraulic.Components.Conductor pulmonary annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={94,2})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins
      annotation (Placement(transformation(extent={{82,-34},{102,-14}})));
    Physiolibrary.Hydraulic.Components.IdealValve mitralValve
      annotation (Placement(transformation(extent={{60,-32},{40,-12}})));
    VentricularInteraction ventricularInteraction
      annotation (Placement(transformation(extent={{8,-4},{28,16}})));
  equation
    connect(aorticValve.q_out, aorta.q_in) annotation (Line(
        points={{-46,-22},{-64,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorta.q_in, systemic.q_in) annotation (Line(
        points={{-64,-22},{-68,-22},{-68,-6},{-70,-6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(systemic.q_out, venaCava.q_in) annotation (Line(
        points={{-70,14},{-72,14},{-72,34},{-64,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(venaCava.q_in, tricupsidValve.q_in) annotation (Line(
        points={{-64,34},{-52,34},{-52,36},{-40,36}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricupsidValve.q_out, rightVentricle.q_in) annotation (Line(
        points={{-20,36},{8,36}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.q_in, inertiaPV.q_in) annotation (Line(
        points={{8,36},{16,36},{16,34},{24,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(inertiaPV.q_out, pulmonaryValve.q_in) annotation (Line(
        points={{44,34},{50,34}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryValve.q_out, pulmonaryArteries.q_in) annotation (Line(
        points={{70,34},{80,34},{80,36},{90,36}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, pulmonary.q_in) annotation (Line(
        points={{90,36},{94,36},{94,12}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonary.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{94,-8},{92,-8},{92,-24}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, mitralValve.q_in) annotation (Line(
        points={{92,-24},{78,-24},{78,-22},{60,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
        points={{40,-22},{18,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(leftVentricle.q_in, inertiaAV.q_in) annotation (Line(
        points={{18,-22},{0,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(inertiaAV.q_out, aorticValve.q_in) annotation (Line(
        points={{-20,-22},{-26,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
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
  annotation (uses(Modelica(version="3.2.1"), Physiolibrary(version="2.1.1")));
end Smith2004Model;
