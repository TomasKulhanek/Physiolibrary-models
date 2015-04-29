model DvaBalony
  //Modelica.SIUnit.Pressure p1,p2;
  Real p1, p2;
  //Modelica.SIUnit.Volume V1,V2;
  Real V1(start = 200), V2(start = 50);
  //Modelica.SIUnit.VolumeFlowRate q1,q2;
  Real q1, q2;
  parameter Real E1 = 0.5;
  parameter Real E2 = 1 "[]";
  parameter Real R = 1 "[(mmHg.s)/ml]";
equation
  //p=V*E;
  p1 = V1 * E1;
  q1 = der(V1);
  p2 = V2 * E2;
  q2 = der(V2);
  q1 = -q2;
  q1 = (p2 - p1) / R;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end DvaBalony;