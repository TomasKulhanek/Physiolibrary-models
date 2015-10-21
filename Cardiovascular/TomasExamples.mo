package TomasExamples
  model DvaBalony
    parameter Real C1 = 1.5, C2 = 200, G = 1;
    Real p1, p2, V1(start = 529), V2(start = 2845), q, q1, q2;
  equation
    p2 = V2 / C2;
    p1 = V1 / C1;
    q = G * (p2 - p1);
    der(V1) = q1;
    der(V2) = q2;
    q1 = q;
    -q = q2;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end DvaBalony;

  model Conductor
    parameter Real G = 1;
    //  Real p1, p2, q1, q2;sdfg sdfg sdfg s
    TomasExamples.HydraulicPort port1 annotation(Placement(visible = true, transformation(origin = {-196, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TomasExamples.HydraulicPort port2 annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    port1.q = -G * (port2.p - port1.p);
    -port1.q = port2.q;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {1, 3}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-95, 15}, {95, -15}})}));
  end Conductor;

  model Compliance
    parameter Real C = 1.5;
    Real V(start = 529);
    TomasExamples.HydraulicPort port annotation(Placement(visible = true, transformation(origin = {2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    port.p = V / C;
    der(V) = port.q;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {4, -4}, extent = {{-64, 58}, {64, -58}}, endAngle = 360)}));
  end Compliance;

  connector HydraulicPort
    flow Real q;
    Real p;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Polygon(origin = {-0.99, -0.01}, fillColor = {255, 170, 170}, fillPattern = FillPattern.Solid, points = {{0.985588, 98.0134}, {-99.0144, -1.98658}, {6.98559, -97.9866}, {98.9856, 2.01342}, {0.985588, 98.0134}, {0.985588, 98.0134}})}));
  end HydraulicPort;

  model DvaBalonyAkauzalne
    TomasExamples.Conductor conductor1 annotation(Placement(visible = true, transformation(origin = {-6, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TomasExamples.Compliance compliance2(C = 200, V(start = 2845)) annotation(Placement(visible = true, transformation(origin = {46, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TomasExamples.Compliance compliance1 annotation(Placement(visible = true, transformation(origin = {-54, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(compliance1.port, conductor1.port1) annotation(Line(points = {{-53, -8}, {-16, -8}}));
    connect(conductor1.port2, compliance2.port) annotation(Line(points = {{4, -8}, {46, -8}, {46, -6}, {46, -6}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end DvaBalonyAkauzalne;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end TomasExamples;