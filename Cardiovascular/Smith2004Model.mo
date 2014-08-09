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
  annotation (uses(Modelica(version="3.2.1"), Physiolibrary(version="2.1.1")));
  model VentricularInteraction
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(extent={{-80,60},{80,-80}}, lineColor={0,0,255}),
          Polygon(
            points={{-80,0},{-66,4},{-50,6},{-32,2},{-14,-6},{-4,0},{12,4},{30,
                4},{56,2},{74,-2},{80,0},{80,-4},{74,-6},{64,-4},{52,-2},{28,0},
                {12,0},{2,-4},{-8,-8},{-20,-10},{-30,-4},{-48,0},{-68,-2},{-80,
                -6},{-80,0}},
            lineColor={0,0,255},
            smooth=Smooth.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-14,46},{-14,0},{-26,12},{-2,12},{-14,0}},
            color={0,0,255},
            smooth=Smooth.None),
          Line(
            points={{34,-66},{34,-8},{22,-22},{48,-22},{34,-10}},
            color={0,0,255},
            smooth=Smooth.None)}));
  end VentricularInteraction;
end Smith2004Model;
