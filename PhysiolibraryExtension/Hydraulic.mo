within PhysiolibraryExtension;
package Hydraulic
                   extends Modelica.Icons.Package;
  package Components
                      extends Modelica.Icons.Package;
    model IdealValve

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
        annotation (Placement(transformation(extent={{-110,-12},{-90,8}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));

      Physiolibrary.Types.VolumeFlowRate q;
       Physiolibrary.Types.Pressure dp;
       Boolean open(start=true);
       Real passableVariable;
    equation
      bloodFlowInflow.q + bloodFlowOutflow.q = 0;
      q = bloodFlowInflow.q;
      dp = bloodFlowInflow.pressure - bloodFlowOutflow.pressure;
      open = passableVariable > 0;
      if open then
        dp=0;
        q=passableVariable;
      else
        dp=passableVariable;
        q=0;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Polygon(
              points={{-76,66},{-76,-82},{34,-10},{34,12},{-66,68},{-76,82},{-76,66}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid), Rectangle(
              extent={{40,96},{68,-94}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-108,-88},{96,-106}},
              lineColor={255,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85},
              textString="%name")}));
    end IdealValve;

    model CardiacValve

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
        annotation (Placement(transformation(extent={{-110,-12},{-90,8}}),
            iconTransformation(extent={{-108,-12},{-88,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput inflowConductance
        "conductance of backflow in case of insufficiency"
        annotation (Placement(transformation(extent={{-26,-18},{14,22}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-74,76})));
      IdealValve outflowValve
        annotation (Placement(transformation(extent={{-44,32},{-24,52}})));
      IdealValve inflowValve(open(start=false))
                             annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-36,-38})));
      Physiolibrary.Hydraulic.Components.Conductor outflowBloodResistor(
          useConductanceInput=true) "from Conductor"
        annotation (Placement(transformation(extent={{26,28},{46,48}})));
      Physiolibrary.Hydraulic.Components.Conductor variableBloodConductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{54,-56},{18,-34}})));
      Types.RealIO.HydraulicResistanceInput
                               outflowResistance annotation (Placement(
            transformation(extent={{-36,66},{4,106}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={52,88})));
      Types.RealIO.HydraulicResistanceToConductance hydraulicresistancetoconductance
        annotation (Placement(transformation(extent={{18,60},{26,68}})));
    equation
      connect(variableBloodConductor.cond, inflowConductance) annotation (Line(
          points={{36,-38.4},{36,-38.4},{36,2},{-6,2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(bloodFlowInflow, outflowValve.bloodFlowInflow) annotation (Line(
          points={{-100,-2},{-98,-2},{-98,42},{-96,42},{-44,42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(outflowValve.bloodFlowOutflow, outflowBloodResistor.q_in)
        annotation (Line(
          points={{-24,42},{2,42},{2,38},{26,38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(outflowBloodResistor.q_out, bloodFlowOutflow) annotation (Line(
          points={{46,38},{72,38},{72,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(bloodFlowOutflow, variableBloodConductor.q_in) annotation (Line(
          points={{100,0},{78,0},{78,-45},{54,-45}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(variableBloodConductor.q_out, inflowValve.bloodFlowInflow)
        annotation (Line(
          points={{18,-45},{-4,-45},{-4,-38},{-26,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(bloodFlowInflow, inflowValve.bloodFlowOutflow) annotation (Line(
          points={{-100,-2},{-100,-2},{-100,-36},{-74,-36},{-74,-38},{-46,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(outflowResistance, hydraulicresistancetoconductance.hydraulicresistance)
        annotation (Line(
          points={{-16,86},{12,86},{12,64.4},{17.2,64.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(outflowBloodResistor.cond, hydraulicresistancetoconductance.y)
        annotation (Line(
          points={{36,44},{34,44},{34,64},{27,64}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),            graphics={
                                       Polygon(
              points={{-72,66},{-72,-82},{38,-10},{38,12},{-62,68},{-72,82},{
                  -72,66}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={255,85,85},
              fillPattern=FillPattern.Sphere),Rectangle(
              extent={{44,96},{72,-94}},
              lineColor={0,0,127},
              fillColor={255,85,85},
              fillPattern=FillPattern.Sphere),
            Text(
              extent={{-194,-106},{206,-136}},
              lineColor={0,0,127},
              textString="%name"),
            Rectangle(
              extent={{-64,50},{-14,42}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{4,1},{-4,7},{-4,-7},{4,1}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              origin={-70,47},
              rotation=180),
            Polygon(
              points={{-4,1},{4,7},{4,-7},{-4,1}},
              lineColor={0,0,127},
              smooth=Smooth.None,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              origin={68,63},
              rotation=180),
            Rectangle(
              extent={{10,68},{60,60}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid)}),  Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end CardiacValve;
  end Components;
end Hydraulic;
