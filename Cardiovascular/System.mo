within Cardiovascular;
model System

  replaceable Interfaces.Heart heart
    annotation (Placement(transformation(extent={{-10,-8},{6,8}})));
  replaceable Interfaces.Systemic systemicCirculation
    annotation (Placement(transformation(extent={{-10,-36},{10,-16}})));
  replaceable Interfaces.Pulmonary pulmonaryCirculation
    annotation (Placement(transformation(extent={{-10,12},{10,32}})));

equation
  connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (Line(
      points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(systemicCirculation.q_in, heart.leftHeartOutflow) annotation (Line(
      points={{10,-26},{12,-26},{12,-1.44},{6,-1.44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(heart.leftHeartInflow, pulmonaryCirculation.q_out) annotation (Line(
      points={{6,1.6},{12,1.6},{12,21.4},{9.8,21.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(heart.rightHeartOutflow, pulmonaryCirculation.q_in) annotation (
      Line(
      points={{-10,1.6},{-10,2},{-14,2},{-14,21.8},{-9.8,21.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},{20,
            40}}), graphics),
    Icon(coordinateSystem(extent={{-20,-40},{20,40}}, preserveAspectRatio=
            false), graphics={Bitmap(extent={{-40,-40},{40,40}}, fileName=
              "modelica://Cardiovascular/Resources/Icons/cvsconcept.png")}),
    Documentation(info="<html>
<p>Architectural model of cardiovascular subsystems. The partial subsystems are meant to be redeclared by the implemented submodels.</p>
</html>"));
end System;
