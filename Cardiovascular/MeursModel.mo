within ;
package MeursModel
  package Parts
    model SystemicArteries
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {76, 74}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {72, 58})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0003) annotation(Placement(transformation(extent = {{32, -10}, {52, 10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start(displayUnit = "ml") = 0.00045) annotation(Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905, volumeFlow_start(displayUnit = "ml/min") = 2.1733333333333e-005) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {2, 2})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(useConductanceInput = true) annotation(Placement(transformation(extent = {{-44, -10}, {-24, 10}})));
      Physiolibrary.Types.RealIO.PressureInput extraThoracicPressure annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-48, 72}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-66, 58})));
      Physiolibrary.Types.Constants.VolumeConst VETHAU(k = 0.00037)
        "unstressed volume of extrathoracic arteries"                                                             annotation(Placement(visible = true, transformation(origin = {-84, 36.5}, extent = {{-8, -6.5}, {8, 6.5}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        EETHA(k(displayUnit = "mmHg/ml") = 74127247.40274) annotation(Placement(visible = true, transformation(origin = {-82, 58}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHA(k(displayUnit = "(mmHg.s)/ml") = 7999343.2449) annotation(Placement(visible = true, transformation(origin = {-41, 32}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.VolumeConst VITHAU(k = 0.00014)
        "unstressed volume of intrathoracic arteries"                                                             annotation(Placement(visible = true, transformation(origin = {6, 46}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        EITHA(k(displayUnit = "mmHg/ml") = 190651014.00345) annotation(Placement(visible = true, transformation(origin = {-13, 75}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b Outflow annotation(Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a Inflow annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(Inflow, Inflow) annotation(Line(points = {{90, 0}, {90, 0}, {90, 0}}, thickness = 1));
      connect(Inflow, IntraThoracicArteries.q_in) annotation(Line(points = {{90, 0}, {74, 0}, {74, 2.22045e-016}, {42, 2.22045e-016}}, thickness = 1));
      connect(ExtrathoracicArteries.q_in, Outflow) annotation(Line(points = {{-66, 0}, {-84, 0}}, thickness = 1));
      connect(EITHA.y, IntraThoracicArteries.compliance) annotation(Line(points = {{-4.25, 75}, {42, 75}, {42, 8}}, color = {0, 0, 127}));
      connect(VITHAU.y, IntraThoracicArteries.zeroPressureVolume) annotation(Line(points = {{16, 46}, {34, 46}, {34, 8}}, color = {0, 0, 127}));
      connect(RETHA.y, conductor.cond) annotation(Line(points = {{-32.25, 32}, {-34, 32}, {-34, 6}}, color = {0, 0, 127}));
      connect(EETHA.y, ExtrathoracicArteries.compliance) annotation(Line(points = {{-72, 58}, {-64, 58}, {-64, 8}, {-66, 8}}, color = {0, 0, 127}));
      connect(ExtrathoracicArteries.zeroPressureVolume, VETHAU.y) annotation(Line(points = {{-74, 8}, {-74, 36.5}, {-74, 36.5}}, color = {0, 0, 127}));
      connect(IntraThoracicArteries.externalPressure, intrathoracicPressure) annotation(Line(points = {{50, 8}, {76, 8}, {76, 74}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(conductor.q_in, ExtrathoracicArteries.q_in) annotation(Line(points = {{-44, 0}, {-66, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_out, inertia.q_out) annotation(Line(points = {{-24, 0}, {-16, 0}, {-16, 2}, {-8, 2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(inertia.q_in, IntraThoracicArteries.q_in) annotation(Line(points = {{12, 2}, {28, 2}, {28, 0}, {42, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(extraThoracicPressure, ExtrathoracicArteries.externalPressure) annotation(Line(points = {{-48, 72}, {-52, 72}, {-52, 8}, {-58, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-98, 38}, {94, -42}}, lineColor = {255, 229, 185}, fillColor = {255, 85, 85},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder), Text(extent = {{-60, 36}, {160, 24}}, lineColor = {0, 0, 255}, fillColor = {255, 235, 161},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "intraThoracicPressure"), Text(extent = {{-98, -64}, {94, -48}}, lineColor = {0, 0, 255}, fillColor = {255, 235, 161},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "%name"), Text(extent = {{-142, 36}, {-8, 24}}, lineColor = {0, 0, 255}, textString = "extraThoracic pressure")}));
    end SystemicArteries;

    model SystemicVeins
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure annotation(Placement(transformation(extent = {{-80, 26}, {-40, 66}}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 270, origin = {-67, 33})));
      Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{38, -46}, {10, -24}})));
      Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-50, -44}, {-74, -24}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0014) annotation(Placement(transformation(extent = {{-34, -48}, {-6, -20}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00176) annotation(Placement(transformation(extent = {{46, -48}, {72, -22}})));
      Physiolibrary.Types.RealIO.PressureInput extraThoracicPressure annotation(Placement(transformation(extent = {{12, 26}, {52, 66}}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 270, origin = {57, 35})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodflowOutflow annotation(Placement(visible = true, transformation(origin = {-82, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow annotation(Placement(visible = true, transformation(origin = {90, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHV(k(displayUnit = "(Pa.s)/m3") = 11999014.86735) annotation(Placement(visible = true, transformation(origin = {11, -2}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.VolumeConst VETHVU(k(displayUnit = "m3") = 0.001) annotation(Placement(visible = true, transformation(origin = {38, -8}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EETHV(k(displayUnit = "Pa/m3") = 2253148.3473135) annotation(Placement(visible = true, transformation(origin = {37, 10}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        EITHV(k(displayUnit = "Pa/m3") = 2426467.450953) annotation(Placement(visible = true, transformation(origin = {-33, 32}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      replaceable Physiolibrary.Types.Constants.VolumeConst
                                                VITHVU(k(displayUnit = "m3") = 0.00119) annotation(Placement(visible = true, transformation(origin = {-56, 17}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
                                                                          RRAIN(k(displayUnit = "(Pa.s)/m3") = 399967.162245) annotation(Placement(visible = true, transformation(origin = {-84, 5}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
    equation
      connect(RRAIN.y, CentralVenousResistance.cond) annotation(Line(points = {{-74, 5}, {-62, 5}, {-62, -28}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VITHVU.y, IntraThoracicVeins.zeroPressureVolume) annotation(Line(points = {{-46, 17}, {-42, 17}, {-42, -22.8}, {-31.2, -22.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EITHV.y, IntraThoracicVeins.compliance) annotation(Line(points = {{-24.25, 32}, {-20, 32}, {-20, -20}, {-20, -22}, {-20, -22.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EETHV.y, ExtrathoracicVeins.compliance) annotation(Line(points = {{45.75, 10}, {58, 10}, {58, -24.6}, {59, -24.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VETHVU.y, ExtrathoracicVeins.zeroPressureVolume) annotation(Line(points = {{48, -8}, {46, -8}, {46, -24.6}, {48.6, -24.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RETHV.y, VeinsResistance.cond) annotation(Line(points = {{19.75, -2}, {24, -2}, {24, -28.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(ExtrathoracicVeins.q_in, bloodFlowInflow) annotation(Line(points = {{59, -35}, {78.5, -35}, {87.4684, -34.8495}, {90, -34}}, thickness = 1));
      connect(bloodflowOutflow, CentralVenousResistance.q_out) annotation(Line(points = {{-82, -24}, {-88, -24}, {-88, -34}, {-74, -34}}, thickness = 1));
      connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in) annotation(Line(points = {{-50, -34}, {-20, -34}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(IntraThoracicVeins.q_in, VeinsResistance.q_out) annotation(Line(points = {{-20, -34}, {-6, -34}, {-6, -35}, {10, -35}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in) annotation(Line(points = {{38, -35}, {59, -35}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(intrathoracicPressure, IntraThoracicVeins.externalPressure) annotation(Line(points = {{-60, 46}, {-8.800000000000001, 46}, {-8.800000000000001, -22.8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(extraThoracicPressure, ExtrathoracicVeins.externalPressure) annotation(Line(points = {{32, 46}, {69.40000000000001, 46}, {69.40000000000001, -24.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 170, 213},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder, extent = {{-100, 22}, {100, -28}}), Text(fillColor = {255, 170, 213},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder, extent = {{-164, 18}, {30, 4}}, textString = "Pth", lineColor = {0, 0, 0}), Text(lineColor = {0, 0, 255}, fillColor = {255, 170, 213},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder, extent = {{-163.443, -33.4448}, {170.927, -54.6458}}, textString = "%name")}));
    end SystemicVeins;

    model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0001) annotation(Placement(transformation(extent = {{-74, -14}, {-48, 12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryArteriesResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-36, -13}, {-2, 13}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0005999999999999999) annotation(Placement(transformation(extent = {{10, -12}, {34, 12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{46, -12}, {76, 12}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {-70, 68})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(visible = true, transformation(origin = {-86, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Physiolibrary.Types.Constants.VolumeConst VPAU(k = 5e-005) annotation(Placement(visible = true, transformation(origin = {-90, 34}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        EPA(k = 31064116.267695) annotation(Placement(visible = true, transformation(origin = {-85, 50}, extent = {{-9, -6}, {9, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPP(k(displayUnit = "(mmHg.s)/ml") = 14665462.61565) annotation(Placement(visible = true, transformation(origin = {-41, 39}, extent = {{-9, -7}, {9, 7}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(k = 6066168.6273825) annotation(Placement(visible = true, transformation(origin = {-3, 47}, extent = {{-9, -7}, {9, 7}}, rotation = 0)));
      Physiolibrary.Types.Constants.VolumeConst VPVU(k = 0.00035) annotation(Placement(visible = true, transformation(origin = {-3, 24}, extent = {{-9, -6}, {9, 6}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RLAIN(k(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation(Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
    equation
      connect(RLAIN.y, PulmonaryVeinResistance.cond) annotation(Line(points = {{66.5, 40}, {81.75, 40}, {61, 21.5}, {61, 7.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VPVU.y, PulmonaryVeins.zeroPressureVolume) annotation(Line(points = {{8.25, 24}, {10, 24}, {10, 9.6}, {12.4, 9.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EPV.y, PulmonaryVeins.compliance) annotation(Line(points = {{8.25, 47}, {26, 47}, {26, 9.6}, {22, 9.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RPP.y, PulmonaryArteriesResistance.cond) annotation(Line(points = {{-29.75, 39}, {-30.25, 39}, {-19, 17.5}, {-19, 7.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EPA.y, PulmonaryArteries.compliance) annotation(Line(points = {{-73.75, 50}, {-58, 50}, {-58, 9.4}, {-61, 9.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VPAU.y, PulmonaryArteries.zeroPressureVolume) annotation(Line(points = {{-80, 34}, {-76, 34}, {-76, 9.4}, {-71.40000000000001, 9.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, PulmonaryArteries.q_in) annotation(Line(points = {{-86, -2}, {-61, -2}, {-61, -1}}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in) annotation(Line(points = {{-61, -1}, {-48.5, -1}, {-48.5, 0}, {-36, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in) annotation(Line(points = {{-2, 0}, {10, 0}, {22, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in) annotation(Line(points = {{22, 0}, {34, 0}, {46, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryVeinResistance.q_out, outflow) annotation(Line(points = {{76, 2.22045e-016}, {88, 2.22045e-016}, {88, 0}, {100, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(Pth.y, PulmonaryArteries.externalPressure) annotation(Line(points = {{-60, 68}, {-52, 68}, {-52, 9.4}, {-50.6, 9.4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, PulmonaryVeins.externalPressure) annotation(Line(points = {{-60, 68}, {31.6, 68}, {31.6, 9.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {110, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {110, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor = {0, 0, 255}, fillColor = {255, 170, 213},
                fillPattern =                                                                                                    FillPattern.HorizontalCylinder, extent = {{141.71, -42.374}, {-146.123, -72.1417}}, textString = "%name")}));
    end PulmonaryCirculation;

    model HeartIntervals
      Physiolibrary.Types.RealIO.TimeOutput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{100, 78}, {120, 98}}), iconTransformation(extent = {{100, 78}, {120, 98}})));
      Physiolibrary.Types.RealIO.TimeOutput Tav "atrioventricular delay" annotation(Placement(transformation(extent = {{96, 16}, {116, 36}}), iconTransformation(extent = {{96, 16}, {116, 36}})));
      Physiolibrary.Types.RealIO.TimeOutput Tvs
        "duration of ventricular systole"                                         annotation(Placement(transformation(extent = {{98, -24}, {118, -4}}), iconTransformation(extent = {{98, -24}, {118, -4}})));
      Physiolibrary.Types.RealIO.TimeOutput T0
        "start time of cardiac cycle in sec"                                        annotation(Placement(transformation(extent = {{100, -98}, {120, -78}}), iconTransformation(extent = {{100, -98}, {120, -78}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR "in SI units (1/s = Hz)" annotation(Placement(transformation(extent = {{-128, -22}, {-88, 18}}), iconTransformation(extent = {{-128, -22}, {-88, 18}})));
      discrete Modelica.SIunits.Time HP(start = 0)
        "heart period - duration of cardiac cycle in sec";
      Boolean b(start = false);
    equation
      b = time - pre(T0) >= pre(HP);
      //boolean - true if new pulse should occur
      when {initial(), b} then
        T0 = time;
        //start time of cardiac cycle in sec
        HP = 1 / HR;
        //heart period - duration of cardiac cycle in sec
        Tas = 0.03 + 0.09 * HP;
        //duration of atrial systole
        Tav = 0.01;
        //atrioventricular delay
        Tvs = 0.16 + 0.2 * HP;
        //duration of ventricular systole
      end when;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-96, 94}, {98, -94}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Solid, fillColor = {255, 255, 170}), Rectangle(extent = {{-78, 32}, {-70, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Rectangle(extent = {{-60, 32}, {-52, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Rectangle(extent = {{0, 32}, {8, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Rectangle(extent = {{44, 32}, {52, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Rectangle(extent = {{-88, 32}, {-80, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Rectangle(extent = {{-40, 32}, {-32, -80}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}), Text(extent = {{52, 70}, {-94, 94}}, lineColor = {0, 0, 127},
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {255, 85, 85}, textString = "Heart Intervals"), Text(extent = {{58, 106}, {98, 68}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tas"), Text(extent = {{54, 46}, {94, 8}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tav"), Text(extent = {{54, 2}, {94, -36}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tvs"), Text(extent = {{56, -64}, {96, -102}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "T0"), Text(extent = {{-130, 46}, {-100, 12}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "HR")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HeartIntervals;

    model AtrialElastance
      Physiolibrary.Types.RealIO.TimeInput Tas annotation(Placement(transformation(extent = {{-140, 22}, {-100, 62}}), iconTransformation(extent = {{-140, 22}, {-100, 62}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-140, -80}, {-100, -40}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceOutput Et
        "elasticity (torr/ml)"                                                       annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -20}, {138, 18}})));
      parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance (torr/ml)";
      parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance (torr/ml)";
    equation
      if time - T0 < Tas then
        Et = EMIN + (EMAX - EMIN) * sin(Modelica.Constants.pi * (time - T0) / Tas);
      else
        Et = EMIN;
      end if;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, pattern = LinePattern.None,
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-98, 98}, {98, 40}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Atrial elastance"), Line(points = {{-78, -34}, {-76, -26}, {-70, -14}, {-58, 6}, {-36, 36}, {-14, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "%name"), Text(extent = {{-104, 46}, {-64, 38}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tas"), Text(extent = {{-110, -56}, {-58, -64}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "T0"), Text(extent = {{72, 4}, {102, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Et")}));
    end AtrialElastance;

    model VentricularElastance
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-138, 54}, {-98, 94}}), iconTransformation(extent = {{-138, 54}, {-98, 94}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-138, -100}, {-98, -60}}), iconTransformation(extent = {{-138, -100}, {-98, -60}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceOutput Et
        "ventricular elasticity (torr/ml)"                                                       annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, 4}, {138, 42}})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay" annotation(Placement(transformation(extent = {{-140, 22}, {-100, 62}}), iconTransformation(extent = {{-138, 0}, {-98, 40}})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(transformation(extent = {{-140, -64}, {-100, -24}}), iconTransformation(extent = {{-138, -46}, {-98, -6}})));
      Modelica.Blocks.Interfaces.RealOutput Et0
        "normalized ventricular elasticity (0..1)"                                         annotation(Placement(transformation(extent = {{100, -24}, {120, -4}}), iconTransformation(extent = {{100, -40}, {138, -2}})));
      Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time" annotation(Placement(transformation(extent = {{102, -42}, {122, -22}}), iconTransformation(extent = {{100, -98}, {138, -60}})));
      parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance ";
      parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance";
      constant Real Kn = 0.57923032735652;
      //Kn is always = 0.5792303273565197
      //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
      //Equation to calculate normalized elastance ET0 was:
      //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
    equation
      HeartInterval = time - T0;
      Et = EMIN + (EMAX - EMIN) * Et0;
      if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
        Et0 = (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn;
      else
        Et0 = 0;
      end if;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, pattern = LinePattern.None,
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-82, 82}, {80, 24}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Ventricular elastance"), Line(points = {{-72, -34}, {-68, -26}, {-62, -14}, {-52, 4}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "%name"), Text(extent = {{-96, 82}, {-76, 66}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tas"), Text(extent = {{-92, 26}, {-76, 6}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tav"), Text(extent = {{-94, -18}, {-78, -38}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tvs"), Text(extent = {{-96, -74}, {-82, -86}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "T0"), Text(extent = {{72, 36}, {88, 14}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Et"), Text(extent = {{96, -32}, {68, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Et0"), Text(extent = {{42, -72}, {88, -84}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Heart interval")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end VentricularElastance;

    partial model SideOfHeart

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}}), iconTransformation(extent = {{-12, -4}, {8, 16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{84, -10}, {104, 10}}), iconTransformation(extent = {{-10, 60}, {10, 80}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-16, 6}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-6, -84})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-118, 36}, {-78, 76}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {22, 106})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atrioventricular delay" annotation(Placement(transformation(extent = {{-6, 44}, {18, 68}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {-6, 106})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-120, 10}, {-80, 50}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {-62, 106})));
      Physiolibrary.Hydraulic.Components.ElasticVessel atrium(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 4e-005) annotation(Placement(transformation(extent = {{-50, -60}, {-18, -28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00013) annotation(Placement(transformation(extent = {{28, -58}, {58, -28}})));
      Physiolibrary.Hydraulic.Components.IdealValve    ventricleArteryValve(
          useLimitationInputs=true)                                         annotation(Placement(transformation(extent = {{64, -30}, {88, -54}})));
      Parts.AtrialElastance atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762) annotation(Placement(transformation(extent = {{-64, 46}, {-26, 78}})));
      replaceable Parts.VentricularElastance
                                 ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66) annotation(Placement(transformation(extent = {{34, 36}, {82, 70}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-10, 58}, {-2, 66}})));
      Physiolibrary.Hydraulic.Components.IdealValve    atrioVentricleValve(
          useLimitationInputs=true)                                        annotation(Placement(visible = true, transformation(origin = {7, -42}, extent = {{-13, 12}, {13, -12}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(visible = true, transformation(origin = {3, 39}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-34, 106}, extent = {{-14, -14}, {14, 14}}, rotation = 270)));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(visible = true, transformation(origin = {100, 48}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
      Physiolibrary.Types.Constants.VolumeConst VxAU(k = 3e-005) annotation(Placement(visible = true, transformation(origin = {-66, -18}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxABackflow(k = 0)
        "conductance of tricupsid valve backflow"                                                                          annotation(Placement(visible = true, transformation(origin={7,-77},      extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
                                                             RxAOutflow(k(displayUnit = "(mmHg.s)/ml") = 399967.162245)
        "resistance of tricupsid valve"                                                                                                     annotation(Placement(visible = true, transformation(origin={-21,-81},  extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxVBackflow(k = 0) annotation(Placement(visible = true, transformation(origin={78,-82},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
                                                             RxVOutflow(k(displayUnit = "(mmHg.s)/ml") = 1066579.09932)
        "resistance of pulmonic valve"                                                                                                     annotation(Placement(visible = true, transformation(origin={54,-82},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Physiolibrary.Types.Constants.VolumeConst VxVU(k = 6e-005) annotation(Placement(visible = true, transformation(origin = {16, -7}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
    equation
      connect(VxVU.y, ventricle.zeroPressureVolume) annotation(Line(points = {{26, -7}, {30, -7}, {30, -31}, {31, -31}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VxAU.y, atrium.zeroPressureVolume) annotation(Line(points = {{-53.5, -18}, {-50, -18}, {-50, -31.2}, {-46.8, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydrauliccompliance.y, ventricle.compliance) annotation(Line(points = {{100, 43}, {100, 18.5654}, {42.7567, 18.5654}, {42.7567, -31}, {43, -31}}, smooth = Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance) annotation(Line(points = {{86.56, 56.91}, {94, 56.91}, {99.90000000000001, 55.9}, {99.90000000000001, 52.1}}, color = {0, 0, 127}));
      connect(Tvs, ventricularElastance.Tvs) annotation(Line(points = {{3, 39}, {16, 39}, {16, 48.58}, {29.68, 48.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation(Line(points = {{-98, 56}, {-74, 56}, {-74, 68.72}, {-67.8, 68.72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(T0, atrialElastance.T0) annotation(Line(points = {{-100, 30}, {-74, 30}, {-74, 52.4}, {-67.8, 52.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation(Line(points = {{6, 56}, {6, 56}, {6, 56.4}, {29.68, 56.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, atrium.externalPressure) annotation(Line(points = {{-16, 6}, {-18, 6}, {-18, -31.2}, {-21.2, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, ventricle.externalPressure) annotation(Line(points = {{-16, 6}, {55, 6}, {55, -31}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation(Line(points = {{-100, 30}, {-80, 30}, {-80, 8}, {-14, 8}, {-14, 24}, {29.68, 24}, {29.68, 39.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance) annotation(Line(points = {{-22.39, 61.84}, {-16.195, 61.84}, {-16.195, 61.9}, {-10.1, 61.9}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydrauliccompliance1.y, atrium.compliance) annotation(Line(points = {{-1, 62}, {0, 62}, {0, 36}, {-34, 36}, {-34, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation(Line(points = {{-98, 56}, {-80, 56}, {-80, 88}, {12, 88}, {12, 65.58}, {29.68, 65.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, atrium.q_in) annotation(Line(points = {{-96, 0}, {-86, 0}, {-86, -48}, {-34, -48}, {-34, -44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(atrium.q_in, atrioVentricleValve.q_in) annotation (Line(
          points={{-34,-44},{-20,-44},{-20,-42},{-6,-42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricle.q_in, atrioVentricleValve.q_out) annotation (Line(
          points={{43,-43},{31.5,-43},{31.5,-42},{20,-42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CxABackflow.y, atrioVentricleValve.Goff) annotation (Line(
          points={{15.75,-77},{15.75,-69.5},{14.8,-69.5},{14.8,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RxAOutflow.y, atrioVentricleValve.Gon) annotation (Line(
          points={{-12.25,-81},{-12.25,-68.5},{-0.8,-68.5},{-0.8,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, ventricleArteryValve.q_in) annotation (Line(
          points={{43,-43},{53.5,-43},{53.5,-42},{64,-42}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricleArteryValve.q_out, outflow) annotation (Line(
          points={{88,-42},{92,-42},{92,-32},{94,-32},{94,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RxVOutflow.y, ventricleArteryValve.Gon) annotation (Line(
          points={{64,-82},{66,-82},{66,-54},{68.8,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(CxVBackflow.y, ventricleArteryValve.Goff) annotation (Line(
          points={{88,-82},{90,-82},{90,-54},{83.2,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(Icon(coordinateSystem(extent = {{-110, -100}, {110, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, extent = {{-70, 90}, {-56, 78}}, textString = "T0"), Text(lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, extent = {{-42, 94}, {-26, 74}}, textString = "Tvs"), Text(lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, extent = {{-14, 94}, {2, 74}}, textString = "Tav"), Text(lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, extent = {{14, 92}, {34, 76}}, textString = "Tas"), Text(lineColor = {0, 0, 255}, extent = {{12, -82}, {38, -104}}, textString = "PTH")}), Diagram(coordinateSystem(extent={{-110,
                -100},{110,100}},                                                                                                    preserveAspectRatio=false,   initialScale = 0.1, grid = {2, 2}),
            graphics));
    end SideOfHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      extends SideOfHeart(VxAU(k = 3e-005), VxVU(k = 6e-005), RxAOutflow(k = 399967.162245), RxVOutflow(k = 1066579.09932), ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66), atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end LeftHeart;

    model RightHeart
      extends Physiolibrary.Icons.RightHeart;
      extends SideOfHeart(atrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225), ventricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335), VxAU(k = 3e-005), RxAOutflow(k = 399967.162245), VxVU(k = 4e-005), RxVOutflow(k = 399967.162245), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{32, 60}, {18, 64}, {6, 64}, {6, 76}, {18, 76}, {30, 72}, {44, 64}, {36, 58}, {32, 60}}, smooth = Smooth.None,
                fillPattern =                                                                                                    FillPattern.Solid, fillColor = {58, 117, 175}, pattern = LinePattern.None, lineColor = {0, 0, 0})}));
    end RightHeart;

    model Heart "both sides of heart with heart interval control"
      LeftHeart leftHeart annotation(Placement(transformation(extent = {{-8, -14}, {28, 22}})));
      RightHeart rightHeart annotation(Placement(transformation(extent = {{-38, -14}, {0, 24}})));
      HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-24, 52})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow annotation(Placement(transformation(extent = {{-52, -4}, {-32, 16}}), iconTransformation(extent = {{-44, -20}, {-24, 0}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow annotation(Placement(transformation(extent = {{-52, 12}, {-32, 32}}), iconTransformation(extent = {{-22, 8}, {-2, 28}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow annotation(Placement(transformation(extent = {{26, -6}, {46, 14}}), iconTransformation(extent = {{18, -12}, {38, 8}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-46, -22})));
      Cardiovascular.Hydraulic.Components.AortaFlowMeasurement aortaFlowMeasurement annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {28, 42})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2) annotation(Placement(visible = true, transformation(origin = {-46, 68}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow annotation(Placement(visible = true, transformation(origin = {28, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {18, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(aortaFlowMeasurement.q_out, leftHeartOutflow) annotation(Line(points = {{28, 52}, {28, 62}, {28, 64}}, thickness = 1));
      connect(HeartRate.y, heartIntervals.HR) annotation(Line(points = {{-38.5, 68}, {-24.2, 68}, {-24.2, 62.8}}, color = {0, 0, 127}));
      connect(rightHeartInflow, rightHeart.inflow) annotation(Line(points = {{-42, 6}, {-30, 6}, {-30, 6.14}, {-19.38, 6.14}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeartInflow, rightHeartInflow) annotation(Line(points = {{-42, 6}, {-42, 6}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation(Line(points = {{-19, 18.3}, {-42, 18.3}, {-42, 22}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(leftHeart.inflow, leftHeartInflow) annotation(Line(points = {{9.640000000000001, 5.08}, {35.8, 5.08}, {35.8, 4}, {36, 4}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{-32.8, 41}, {-32.8, 28}, {-32, 28}, {-30.78, 28}, {-30.78, 26}, {-30.78, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{-25.4, 41.2}, {-25.4, 33.6}, {-25.46, 33.6}, {-25.46, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{-21.4, 41.4}, {-21.4, 28}, {-20, 28}, {-20, 26}, {-20.14, 26}, {-20.14, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{-15.2, 41}, {-15.2, 28}, {-14, 28}, {-14, 26}, {-14.82, 26}, {-14.82, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-15.2, 41}, {13.96, 41}, {13.96, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-21.4, 41.4}, {-21.4, 38}, {8.92, 38}, {8.92, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-25.4, 41.2}, {-25.4, 34}, {3.88, 34}, {3.88, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-32.8, 41}, {-32.8, 30}, {-1.16, 30}, {-1.16, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(leftHeartInflow, leftHeartInflow) annotation(Line(points = {{36, 4}, {36, 4}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(Pth.y, rightHeart.PTH) annotation(Line(points = {{-38.5, -22}, {-20.14, -22}, {-20.14, -10.96}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, leftHeart.PTH) annotation(Line(points = {{-38.5, -22}, {8.92, -22}, {8.92, -11.12}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(leftHeart.outflow, aortaFlowMeasurement.q_in) annotation(Line(points = {{10, 16.6}, {28, 16.6}, {28, 32}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {40, 80}}), graphics={  Bitmap(extent = {{-6, 22}, {34, -48}}, fileName = "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"), Bitmap(extent = {{-34, 18}, {6, -48}}, fileName = "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {40, 80}}), graphics));
    end Heart;

    model SystemicPeripheralVessels
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Components.Conductor SystemicArterioralConductance(useConductanceInput = true) annotation(Placement(transformation(extent = {{11, -9}, {-11, 9}}, rotation = 0, origin = {35, -1})));
      Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(useConductanceInput = true) annotation(Placement(transformation(extent = {{14, -9}, {-14, 9}}, rotation = 0, origin = {-46, 1})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PeripheralVessels(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0002) annotation(Placement(transformation(extent = {{-12, -12}, {8, 8}})));
      Physiolibrary.Types.RealIO.PressureInput extraThoracicPressure annotation(Placement(visible = true, transformation(origin = {40, 34}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {0, 78}, extent = {{-12, -12}, {12, 12}}, rotation = 270)));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EST(k = 34930465.50273) annotation(Placement(visible = true, transformation(origin = {8, 42}, extent = {{-7, -6}, {7, 6}}, rotation = 180)));
      Physiolibrary.Types.Constants.VolumeConst UVST(k = 0.000185) annotation(Placement(visible = true, transformation(origin = {-27, 24}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
                                                                          RSVEN(k(displayUnit = "(mmHg.s)/ml") = 26664477.483) annotation(Placement(visible = true, transformation(origin = {-69, 20}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow annotation(Placement(visible = true, transformation(origin = {72, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow annotation(Placement(visible = true, transformation(origin = {-74, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst           RSART(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(visible = true, transformation(origin = {70.5, 16}, extent = {{-6.5, -6}, {6.5, 6}}, rotation = 180)));
    equation
      connect(RSART.y, SystemicArterioralConductance.cond) annotation(Line(points = {{62.375, 16}, {60, 16}, {60, 14}, {35, 14}, {35, 4.4}}, color = {0, 0, 127}));
      connect(SmallVenuleConductance.q_out, bloodFlowOutflow) annotation(Line(points = {{-60, 1}, {-78, 1}, {-74, 2}, {-74, 2}}, thickness = 1));
      connect(bloodFlowInflow, SystemicArterioralConductance.q_in) annotation(Line(points = {{72, -2}, {74, -2}, {74, -1}, {46, -1}}, thickness = 1));
      connect(RSVEN.y, SmallVenuleConductance.cond) annotation(Line(points = {{-60.25, 20}, {-46, 20}, {-46, 6.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(UVST.y, PeripheralVessels.zeroPressureVolume) annotation(Line(points = {{-18.25, 24}, {-10, 24}, {-10, 14}, {-10, 6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EST.y, PeripheralVessels.compliance) annotation(Line(points = {{-0.75, 42}, {-2, 42}, {-2, 22}, {-2, 6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(extraThoracicPressure, PeripheralVessels.externalPressure) annotation(Line(points = {{40, 34}, {6, 34}, {6, 6}}, color = {0, 0, 127}));
      connect(SystemicArterioralConductance.q_out, PeripheralVessels.q_in) annotation(Line(points = {{24, -1}, {12, -1}, {12, -2}, {-2, -2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(PeripheralVessels.q_in, SmallVenuleConductance.q_in) annotation(Line(points = {{-2, -2}, {-18, -2}, {-18, 1}, {-32, 1}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor = {0, 0, 255}, fillColor = {255, 85, 85},
                fillPattern =                                                                                                    FillPattern.Solid, extent = {{-134, -50}, {138, -70}}, textString = "%name")}));
    end SystemicPeripheralVessels;

    model SystemicCirculation
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{-94, -8}, {-74, 12}}), iconTransformation(extent = {{-102, -8}, {-82, 12}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {-90, 28})));
      Physiolibrary.Types.Constants.PressureConst Pext(k = 0) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-56, 20})));
      Parts.SystemicVeins systemicVeins(IntraThoracicVeins(volume_start = 0.0014), ExtrathoracicVeins(volume_start = 0.00176)) annotation(Placement(visible = true, transformation(origin = {-50, 2}, extent = {{18, 13.5}, {-18, -13.5}}, rotation = 180)));
      replaceable Parts.SystemicPeripheralVessels systemicPeripheralVessels annotation(Placement(visible = true, transformation(origin = {-6, 2}, extent = {{-17, -12}, {17, 12}}, rotation = 0)));
      Parts.SystemicArteries systemicArteries(ExtrathoracicArteries(volume_start = 0.00045), IntraThoracicArteries(volume_start = 0.0003)) annotation(Placement(visible = true, transformation(origin = {32, 4.44089e-016}, extent = {{-16, -12}, {16, 12}}, rotation = 0)));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(inflow, inflow) annotation(Line(points = {{62, 0}, {62, 0}}, thickness = 1));
      connect(systemicArteries.Inflow, inflow) annotation(Line(points = {{47.68, -0.24}, {35.8, 0}, {62, 0}}, thickness = 1));
      connect(Pext.y, systemicArteries.extraThoracicPressure) annotation(Line(points={{-48.5,
              20},{21.2733,20},{21.2733,6.96},{21.44,6.96}}));
      connect(Pext.y, systemicPeripheralVessels.extraThoracicPressure) annotation(Line(points={{-48.5,
              20},{-5.36302,20},{-5.36302,11.36},{-6,11.36}}));
      connect(Pth.y, systemicArteries.intrathoracicPressure) annotation(Line(points={{-80,28},
              {43.9768,28},{43.9768,6.96},{43.52,6.96}}));
      connect(Pth.y, systemicVeins.intrathoracicPressure) annotation(Line(points={{-80,28},
              {-62.3898,28},{-62.3898,6.455},{-62.06,6.455}}));
      connect(Pext.y, systemicVeins.extraThoracicPressure) annotation(Line(points={{-48.5,
              20},{-39.6864,20},{-39.6864,6.725},{-39.74,6.725}}));
      connect(systemicArteries.Outflow, systemicPeripheralVessels.bloodFlowInflow) annotation(Line(points = {{16.32, 0.24}, {16.2, 0.24}, {8.279999999999999, 2}}, thickness = 1));
      connect(systemicPeripheralVessels.bloodFlowOutflow, systemicVeins.bloodFlowInflow) annotation(Line(points = {{-20.96, 2.24}, {-41.27, 2.24}, {-32.36, 2.27}}, thickness = 1));
      connect(outflow, systemicVeins.bloodflowOutflow) annotation(Line(points={{-84,2},
              {-68,2}},                                                                                         thickness = 1));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-96, -66}, {100, -92}}, lineColor = {0, 0, 127}, textString = "%name")}));
    end SystemicCirculation;
  end Parts;

  package Test
    model testRightHeart
      OldParts.RightHeart rightHeart annotation(Placement(transformation(extent = {{-20, -20}, {30, 38}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-76, 28}, {-68, 36}})));
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-62, -10}, {-42, 10}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.2) annotation(Placement(transformation(extent = {{-90, -2}, {-82, 6}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {54, 44})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-64, -50}, {-44, -30}})));
    equation
      connect(Pth.y, rightHeart.PTH) annotation(Line(points = {{-67, 32}, {-42, 32}, {-42, 29.88}, {-15, 29.88}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{-41, 8.800000000000001}, {-30.5, 8.800000000000001}, {-30.5, 20.02}, {-18.5, 20.02}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{-41.4, 2.6}, {-30, 2.6}, {-30, 6}, {-24, 6}, {-24, 8.710000000000001}, {-18.75, 8.710000000000001}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{-41.2, -1.4}, {-31.6, -1.4}, {-31.6, -2.6}, {-19.5, -2.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{-41, -8.800000000000001}, {-30.5, -8.800000000000001}, {-30.5, -12.46}, {-19, -12.46}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(HeartRate.y, heartIntervals.HR) annotation(Line(points = {{-81, 2}, {-72, 2}, {-72, -0.2}, {-62.8, -0.2}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeart.outflow, unlimitedVolume1.y) annotation(Line(points = {{9, 28.14}, {30, 28.14}, {30, 44}, {44, 44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(unlimitedPump.q_out, rightHeart.inflow) annotation(Line(points = {{-44, -40}, {-1, -40}, {-1, 9.58}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end testRightHeart;

    model HemodynamicsTest2
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-74, 60}, {-54, 80}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k = 1.2) annotation(Placement(transformation(extent = {{-94, 66}, {-86, 74}})));
      OldParts.LeftHeart leftHeart annotation(Placement(transformation(extent = {{10, 46}, {52, 96}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k = -533.28954966) annotation(Placement(transformation(extent = {{-88, 90}, {-80, 98}})));
      Parts.SystemicArteries systemicArteries annotation(Placement(transformation(extent = {{38, -4}, {90, 22}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-96, 18}, {-76, 38}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume annotation(Placement(transformation(extent = {{-80, -4}, {-60, 16}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst hydraulicresistance(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent = {{-2, 34}, {6, 42}})));
      Parts.SystemicVeins systemicVeins annotation(Placement(transformation(extent = {{-50, -2}, {-18, 26}})));
      Parts.SystemicPeripheralVessels systemicPeripheralVessels1 annotation(Placement(visible = true, transformation(origin = {10.5, 6}, extent = {{-19.5, -18}, {19.5, 18}}, rotation = 0)));
    equation
      connect(systemicVeins.bloodFlowInflow, systemicPeripheralVessels1.bloodFlowOutflow) annotation(Line(points = {{-18.32, 12.28}, {-16, 12.28}, {-8.609999999999999, 12.28}, {-8.609999999999999, 5.64}}, thickness = 1));
      connect(hydraulicresistance.y, systemicPeripheralVessels1.hydraulicresistance) annotation(Line(points = {{7, 38}, {7.38, 15.36}}, color = {0, 0, 127}));
      connect(systemicArteries.Outflow, systemicPeripheralVessels1.bloodFlowInflow) annotation(Line(points = {{38.52, 9.26}, {36, 9.26}, {30, 5.68}, {30, 5.64}}, thickness = 1, smooth = Smooth.Bezier));
      connect(frequency.y, heartIntervals.HR) annotation(Line(points = {{-85, 70}, {-76, 70}, {-76, 69.8}, {-74.8, 69.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation(Line(points = {{-79, 94}, {64, 94}, {64, 60}, {54, 60}, {54, 89}, {44.86, 89}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pressure.y, systemicArteries.intrathoracicPressure) annotation(Line(points = {{-79, 94}, {64, 94}, {64, 15.24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-53, 78.8}, {-5.5, 78.8}, {-5.5, 80.5}, {41.92, 80.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-53.4, 72.59999999999999}, {-4.7, 72.59999999999999}, {-4.7, 70.75}, {41.71, 70.75}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-53.2, 68.59999999999999}, {-6.6, 68.59999999999999}, {-6.6, 61}, {41.08, 61}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-53, 61.2}, {-44, 61.2}, {-44, 52}, {-2, 52}, {-2, 52.5}, {41.5, 52.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation(Line(points = {{24.28, 92}, {24.28, 96}, {60, 96}, {60, 98}, {96, 98}, {96, 8.74}, {89.48, 8.74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(unlimitedPump.q_out, leftHeart.inflow) annotation(Line(points = {{-76, 28}, {-24, 28}, {-24, 73.5}, {31, 73.5}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(unlimitedVolume.y, systemicVeins.bloodflowOutflow) annotation(Line(points = {{-60, 6}, {-58, 6}, {-58, 12}, {-50, 12}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(systemicVeins.intrathoracicPressure, systemicArteries.intrathoracicPressure) annotation(Line(points = {{-34.16, 16.9}, {-34.16, 22}, {-34, 22}, {-34, 26}, {64, 26}, {64, 15.24}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HemodynamicsTest2;

    model TestPulmonaryCirculation
      Parts.PulmonaryCirculation pulmonaryCirculation(RPP(k = 14665462.61565)) annotation(Placement(transformation(extent = {{-30, 6}, {36, 58}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k = -533.28954966) annotation(Placement(transformation(extent = {{-78, 72}, {-70, 80}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-82, 22}, {-62, 42}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 0) annotation(Placement(transformation(extent = {{68, 52}, {88, 72}})));
    equation
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure) annotation(Line(points = {{-69, 76}, {2, 76}, {2, 40}, {3.33, 40}, {3.33, 47.86}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(unlimitedPump.q_out, pulmonaryCirculation.bloodFlowInflow) annotation(Line(points = {{-62, 32}, {-30, 32}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pulmonaryCirculation.bloodflowOutflow, unlimitedVolume.y) annotation(Line(points = {{36, 32}, {98, 32}, {98, 62}, {88, 62}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end TestPulmonaryCirculation;

    model TestVessel
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0001) annotation(Placement(transformation(extent = {{-64, -4}, {-38, 22}})));
      Physiolibrary.Types.Constants.VolumeConst VPAU(k = 5e-005) annotation(Placement(transformation(extent = {{-84, 42}, {-72, 50}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(k = 31064116.267695) annotation(Placement(transformation(extent = {{-80, 58}, {-68, 66}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-92, 0}, {-72, 20}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k = -533.28954966) annotation(Placement(transformation(extent = {{-38, 70}, {-30, 78}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 666.611937075) annotation(Placement(transformation(extent = {{-8, 6}, {12, 26}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(displayUnit = "ml/(mmHg.min)") = 1.2501026264094e-010) annotation(Placement(transformation(extent = {{-16, -22}, {4, -2}})));
    equation
      connect(VPAU.y, PulmonaryArteries.zeroPressureVolume) annotation(Line(points = {{-70.5, 46}, {-66, 46}, {-66, 19.4}, {-61.4, 19.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EPA.y, PulmonaryArteries.compliance) annotation(Line(points = {{-66.5, 62}, {-48, 62}, {-48, 19.4}, {-51, 19.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(unlimitedPump.q_out, PulmonaryArteries.q_in) annotation(Line(points = {{-72, 10}, {-62, 10}, {-62, 9}, {-51, 9}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pressure.y, PulmonaryArteries.externalPressure) annotation(Line(points = {{-29, 74}, {-34, 74}, {-34, 19.4}, {-40.6, 19.4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(PulmonaryArteries.q_in, conductor.q_in) annotation(Line(points = {{-51, 9}, {-35.5, 9}, {-35.5, -12}, {-16, -12}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_out, unlimitedVolume.y) annotation(Line(points = {{4, -12}, {8, -12}, {8, 16}, {12, 16}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end TestVessel;

    model TestSystemicCirculation
      Physiolibrary.Types.Constants.PressureConst pressure(k = -533.28954966) annotation(Placement(transformation(extent = {{-24, 68}, {-16, 76}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-82, 32}, {-62, 52}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P = 0) annotation(Placement(transformation(extent = {{68, 52}, {88, 72}})));
      Parts.SystemicArteries systemicArteries(inertia(I(displayUnit = "mmHg.s2/ml") = 93325.6711905)) annotation(Placement(transformation(extent = {{-6, 32}, {14, 52}})));
      Parts.SystemicPeripheralVessels systemicPeripheralVessels annotation(Placement(transformation(extent = {{40, 32}, {60, 52}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst hydraulicresistance(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent = {{18, 88}, {26, 96}})));
    equation
      connect(unlimitedPump.q_out, systemicArteries.Outflow) annotation(Line(points = {{-62, 42}, {-34, 42}, {-34, 42.2}, {-5.8, 42.2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(systemicArteries.intrathoracicPressure, pressure.y) annotation(Line(points = {{4, 46.8}, {4, 72}, {-15, 72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(systemicArteries.Inflow, systemicPeripheralVessels.bloodFlowOutflow) annotation(Line(points = {{13.8, 41.8}, {40.2, 41.8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(systemicPeripheralVessels.bloodFlowInflow, unlimitedVolume.y) annotation(Line(points = {{60, 41.8}, {98, 41.8}, {98, 62}, {88, 62}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(hydraulicresistance.y, systemicPeripheralVessels.hydraulicresistance) annotation(Line(points = {{27, 92}, {48.4, 92}, {48.4, 47.2}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end TestSystemicCirculation;

    model HemodynamicsTest3
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-74, 60}, {-54, 80}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k = 1.2) annotation(Placement(transformation(extent = {{-94, 66}, {-86, 74}})));
      OldParts.LeftHeart leftHeart annotation(Placement(transformation(extent = {{10, 46}, {52, 96}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k = -533.28954966) annotation(Placement(transformation(extent = {{-88, 90}, {-80, 98}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow = 8.333333333333301e-005) annotation(Placement(transformation(extent = {{-96, 18}, {-76, 38}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume annotation(Placement(transformation(extent = {{76, 20}, {96, 40}})));
      Parts.PulmonaryCirculation pulmonaryCirculation annotation(Placement(transformation(extent = {{10, 90}, {36, 128}})));
      OldParts.RightHeart rightHeart annotation(Placement(transformation(extent = {{-28, 40}, {14, 106}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation(Line(points = {{-85, 70}, {-76, 70}, {-76, 69.8}, {-74.8, 69.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation(Line(points = {{-79, 94}, {64, 94}, {64, 60}, {54, 60}, {54, 89}, {44.86, 89}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-53, 78.8}, {-5.5, 78.8}, {-5.5, 80.5}, {41.92, 80.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-53.4, 72.59999999999999}, {-4.7, 72.59999999999999}, {-4.7, 70.75}, {41.71, 70.75}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-53.2, 68.59999999999999}, {-14.6, 68.59999999999999}, {-14.6, 61}, {41.08, 61}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-53, 61.2}, {-44, 61.2}, {-44, 52}, {-2, 52}, {-2, 52.5}, {41.5, 52.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(leftHeart.outflow, unlimitedVolume.y) annotation(Line(points = {{24.28, 92}, {24.28, 96}, {102, 96}, {102, 30}, {96, 30}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pulmonaryCirculation.bloodflowOutflow, leftHeart.inflow) annotation(Line(points = {{36, 109}, {36, 77}, {27.22, 77}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure) annotation(Line(points = {{-79, 94}, {-48, 94}, {-48, 120.59}, {23.13, 120.59}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow) annotation(Line(points = {{2.24, 94.78}, {2.24, 101.39}, {10, 101.39}, {10, 109}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeart.inflow, unlimitedPump.q_out) annotation(Line(points = {{-12.04, 73.66}, {-10.13, 73.66}, {-10.13, 28}, {-76, 28}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{-53, 61.2}, {-40.5, 61.2}, {-40.5, 48.58}, {-27.16, 48.58}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{-53, 78.8}, {-40.5, 78.8}, {-40.5, 85.54000000000001}, {-26.74, 85.54000000000001}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{-53.4, 72.59999999999999}, {-40.7, 72.59999999999999}, {-40.7, 72.67}, {-26.95, 72.67}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{-53.2, 68.59999999999999}, {-38.6, 68.59999999999999}, {-38.6, 59.8}, {-27.58, 59.8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pressure.y, rightHeart.PTH) annotation(Line(points = {{-79, 94}, {-52, 94}, {-52, 96.76000000000001}, {-23.8, 96.76000000000001}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HemodynamicsTest3;

    model HemodynamicsOldVersion
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-74, 0}, {-54, 20}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.2) annotation(Placement(transformation(extent = {{-94, 6}, {-86, 14}})));
      OldParts.RightHeart rightHeart annotation(Placement(transformation(extent = {{-30, -14}, {14, 40}})));
      OldParts.LeftHeart leftHeart annotation(Placement(transformation(extent = {{10, -14}, {52, 36}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {86, 2})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RSP(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent = {{-12, -38}, {-4, -30}})));
      Parts.SystemicPeripheralVessels systemicPeripheralVessels annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-19, -16}, {19, 16}}, rotation = 0)));
      Parts.PulmonaryCirculation pulmonaryCirculation annotation(Placement(visible = true, transformation(origin = {12.125, 51}, extent = {{-12.125, -11}, {12.125, 11}}, rotation = 0)));
      Parts.SystemicVeins systemicVeins(IntraThoracicVeins(volume_start = 0.0014), ExtrathoracicVeins(volume_start = 0.00176)) annotation(Placement(visible = true, transformation(origin = {-35, -33}, extent = {{-15, -13}, {15, 13}}, rotation = 0)));
      Parts.SystemicArteries systemicArteries annotation(Placement(visible = true, transformation(origin = {50, -37}, extent = {{-10, -9}, {10, 9}}, rotation = 0)));
    equation
      connect(RSP.y, systemicPeripheralVessels.hydraulicresistance) annotation(Line(points = {{-3, -34}, {-2.64541, -34}, {-2.64541, -51.68}, {-3.04, -51.68}}));
      connect(systemicArteries.Outflow, systemicPeripheralVessels.bloodFlowInflow) annotation(Line(points = {{40.2, -36.82}, {32.26, -36.82}, {19, -54.32}, {19, -60.32}}, color = {190, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation(Line(points = {{24.28, 32}, {24.28, 38}, {30, 38}, {30, 40}, {66, 40}, {66, -37.18}, {59.8, -37.18}}, color = {197, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(systemicPeripheralVessels.bloodFlowOutflow, systemicVeins.bloodFlowInflow) annotation(Line(points = {{-18.62, -60.32}, {-23.6934, -60.32}, {-23.6934, -39.7213}, {-26.24, -32.74}, {-20.3, -32.74}}, color = {190, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(systemicVeins.bloodflowOutflow, rightHeart.inflow) annotation(Line(points = {{-50, -33}, {-54, -33}, {-54, -14}, {-13.28, -14}, {-13.28, 13.54}}, color = {190, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(pulmonaryCirculation.bloodflowOutflow, leftHeart.inflow) annotation(Line(points = {{24.25, 51}, {26.4808, 51}, {26.4808, 13.5}, {31, 13.5}}, color = {190, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow) annotation(Line(points = {{-4.48, 30.82}, {-4.48, 51}, {-1.05471e-015, 51}}, color = {190, 0, 0}, thickness = 2, smooth = Smooth.Bezier));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{-53, 18.8}, {-44, 18.8}, {-44, 23.26}, {-28.68, 23.26}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{-53.4, 12.6}, {-40, 12.6}, {-40, 12.73}, {-28.9, 12.73}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{-53.2, 8.6}, {-36, 8.6}, {-36, 2.2}, {-29.56, 2.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{-53, 1.2}, {-41.5, 1.2}, {-41.5, -6.98}, {-29.12, -6.98}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-53.4, 12.6}, {-40, 12.6}, {-40, 10}, {0, 10}, {0, 10.75}, {41.71, 10.75}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-53.2, 8.6}, {-6.6, 8.6}, {-6.6, 1}, {41.08, 1}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-53, 1.2}, {-44, 1.2}, {-44, -8}, {-2, -8}, {-2, -7.5}, {41.5, -7.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(HeartRate.y, heartIntervals.HR) annotation(Line(points = {{-85, 10}, {-80, 10}, {-80, 9.800000000000001}, {-74.8, 9.800000000000001}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-53, 18.8}, {-5.5, 18.8}, {-5.5, 20.5}, {41.92, 20.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(Pth.y, leftHeart.PTH) annotation(Line(points = {{81, 2}, {50, 2}, {50, 30}, {48, 30}, {48, 29}, {44.86, 29}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, systemicArteries.intrathoracicPressure) annotation(Line(points = {{81, 2}, {50, 2}, {50, -32.68}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(systemicVeins.intrathoracicPressure, systemicArteries.intrathoracicPressure) annotation(Line(points = {{-35.15, -28.45}, {-35.15, -24}, {50, -24}, {50, -32.68}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeart.PTH, leftHeart.PTH) annotation(Line(points = {{-25.6, 32.44}, {-34, 32.44}, {-34, 60}, {50, 60}, {50, 30}, {48, 30}, {48, 29}, {44.86, 29}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pulmonaryCirculation.intrathoracicPressure, leftHeart.PTH) annotation(Line(points = {{12.2463, 57.71}, {12.2463, 60}, {50, 60}, {50, 30}, {48, 30}, {48, 29}, {44.86, 29}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HemodynamicsOldVersion;

    model HemodynamicsConcept
      Physiolibrary.Hydraulic.Components.Conductor conductor annotation(Placement(transformation(extent = {{-6, 60}, {14, 80}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins annotation(Placement(transformation(extent = {{22, 56}, {42, 76}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor1 annotation(Placement(transformation(extent = {{48, 42}, {68, 62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftAtrium annotation(Placement(transformation(extent = {{60, 26}, {80, 46}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve mitralValve annotation(Placement(transformation(extent = {{82, 24}, {102, 44}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle annotation(Placement(transformation(extent = {{94, -2}, {114, 18}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve aortalValve annotation(Placement(transformation(extent = {{116, -22}, {94, -2}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel aorta annotation(Placement(transformation(extent = {{76, -44}, {96, -24}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia annotation(Placement(transformation(extent = {{72, -38}, {52, -20}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor2 annotation(Placement(transformation(extent = {{-9, -8}, {9, 8}}, rotation = 180, origin = {41, -42})));
      Physiolibrary.Hydraulic.Components.ElasticVessel extraThoracicSystemicArteries annotation(Placement(transformation(extent = {{16, -70}, {36, -50}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor3 annotation(Placement(transformation(extent = {{-8, -7}, {8, 7}}, rotation = 180, origin = {4, -47})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicTissues annotation(Placement(transformation(extent = {{-22, -76}, {-2, -56}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor4 annotation(Placement(transformation(extent = {{-9, -7}, {9, 7}}, rotation = 180, origin = {-27, -49})));
      Physiolibrary.Hydraulic.Components.ElasticVessel extraThoracicSystemicVeins annotation(Placement(transformation(extent = {{-56, -72}, {-36, -52}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor5 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-68, -52})));
      Physiolibrary.Hydraulic.Components.ElasticVessel intrathoracicSystemicVeins annotation(Placement(transformation(extent = {{-92, -38}, {-72, -18}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor6 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-90, -16})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium annotation(Placement(transformation(extent = {{-114, -2}, {-94, 18}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve tricupsidValve annotation(Placement(transformation(extent = {{-112, 28}, {-92, 48}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle annotation(Placement(transformation(extent = {{-98, 54}, {-78, 74}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve pulmonaryValve annotation(Placement(transformation(extent = {{-74, 54}, {-54, 74}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries annotation(Placement(transformation(extent = {{-42, 58}, {-22, 78}})));
    equation
      connect(conductor.q_out, pulmonaryVeins.q_in) annotation(Line(points = {{14, 70}, {24, 70}, {24, 66}, {32, 66}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryVeins.q_in, conductor1.q_in) annotation(Line(points = {{32, 66}, {40, 66}, {40, 52}, {48, 52}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor1.q_out, leftAtrium.q_in) annotation(Line(points = {{68, 52}, {68, 36}, {70, 36}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(leftAtrium.q_in, mitralValve.bloodFlowInflow) annotation(Line(points = {{70, 36}, {76, 36}, {76, 33.8}, {82.2, 33.8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(mitralValve.bloodFlowOutflow, leftVentricle.q_in) annotation(Line(points = {{102, 34}, {104, 34}, {104, 8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(leftVentricle.q_in, aortalValve.bloodFlowInflow) annotation(Line(points = {{104, 8}, {112, 8}, {112, 4}, {122, 4}, {122, -12.2}, {115.78, -12.2}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(aortalValve.bloodFlowOutflow, aorta.q_in) annotation(Line(points = {{94, -12}, {90, -12}, {90, -34}, {86, -34}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(aorta.q_in, inertia.q_in) annotation(Line(points = {{86, -34}, {84, -34}, {84, -29}, {72, -29}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(inertia.q_out, conductor2.q_in) annotation(Line(points = {{52, -29}, {56, -29}, {56, -34}, {54, -34}, {54, -38}, {52, -38}, {52, -42}, {50, -42}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor2.q_out, extraThoracicSystemicArteries.q_in) annotation(Line(points = {{32, -42}, {42, -42}, {42, -60}, {26, -60}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(extraThoracicSystemicArteries.q_in, conductor3.q_in) annotation(Line(points = {{26, -60}, {12, -60}, {12, -47}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor3.q_out, systemicTissues.q_in) annotation(Line(points = {{-4, -47}, {-4, -47}, {-4, -66}, {-12, -66}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicTissues.q_in, conductor4.q_in) annotation(Line(points = {{-12, -66}, {-18, -66}, {-18, -49}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor4.q_out, extraThoracicSystemicVeins.q_in) annotation(Line(points = {{-36, -49}, {-46, -49}, {-46, -62}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(extraThoracicSystemicVeins.q_in, conductor5.q_in) annotation(Line(points = {{-46, -62}, {-58, -62}, {-58, -52}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor5.q_out, intrathoracicSystemicVeins.q_in) annotation(Line(points = {{-78, -52}, {-82, -52}, {-82, -28}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(rightAtrium.q_in, tricupsidValve.bloodFlowInflow) annotation(Line(points = {{-104, 8}, {-112, 8}, {-112, 37.8}, {-111.8, 37.8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(tricupsidValve.bloodFlowOutflow, rightVentricle.q_in) annotation(Line(points = {{-92, 38}, {-90, 38}, {-90, 64}, {-88, 64}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(rightVentricle.q_in, pulmonaryValve.bloodFlowInflow) annotation(Line(points = {{-88, 64}, {-78, 64}, {-78, 63.8}, {-73.8, 63.8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryValve.bloodFlowOutflow, pulmonaryArteries.q_in) annotation(Line(points = {{-54, 64}, {-46, 64}, {-46, 68}, {-32, 68}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryArteries.q_in, conductor.q_in) annotation(Line(points = {{-32, 68}, {-20, 68}, {-20, 70}, {-6, 70}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(intrathoracicSystemicVeins.q_in, conductor6.q_in) annotation(Line(points = {{-82, -28}, {-82, -16}, {-80, -16}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor6.q_out, rightAtrium.q_in) annotation(Line(points = {{-100, -16}, {-100, -16}, {-100, 8}, {-104, 8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(extent = {{-120, -120}, {140, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-120, -120}, {140, 120}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics));
    end HemodynamicsConcept;

    model Hemodynamicsv2 "model of hemodynamics - decomposed to submodels"
      extends Physiolibrary.Icons.CardioVascular;
      Parts.LeftHeart leftHeart annotation(Placement(transformation(extent = {{-2, -10}, {38, 28}})));
      Parts.RightHeart rightHeart annotation(Placement(transformation(extent = {{-30, -10}, {10, 32}})));
      Parts.PulmonaryCirculation pulmonaryCirculation annotation(Placement(transformation(extent = {{-4, 64}, {16, 84}})));
      Parts.SystemicVeins systemicVeins(IntraThoracicVeins(volume_start = 0.0014), ExtrathoracicVeins(volume_start = 0.00176)) annotation(Placement(transformation(extent = {{11, 12}, {-11, -12}}, rotation = 90, origin = {-36, -17})));
      Parts.SystemicArteries systemicArteries(ExtrathoracicArteries(volume_start = 0.00045), IntraThoracicArteries(volume_start = 0.0003)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {42, -16})));
      Parts.SystemicPeripheralVessels systemicPeripheralVessels annotation(Placement(transformation(extent = {{-8, -42}, {12, -22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RSP(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent = {{-20, -30}, {-12, -22}})));
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {14, 52})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {24, -24})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k = 1.1666666666667) annotation(Placement(transformation(extent = {{-20, 58}, {-12, 66}})));
    equation
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation(Line(points = {{18, 22.3}, {30, 22.3}, {30, 22}, {42.2, 22}, {42.2, -6.2}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicArteries.Outflow, systemicPeripheralVessels.bloodFlowInflow) annotation(Line(points = {{41.8, -25.8}, {41.8, -32.2}, {12, -32.2}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicPeripheralVessels.bloodFlowOutflow, systemicVeins.bloodFlowInflow) annotation(Line(points = {{-7.8, -32.2}, {-35.76, -32.2}, {-35.76, -27.78}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicVeins.bloodflowOutflow, rightHeart.inflow) annotation(Line(points = {{-36, -6}, {-36, -6}, {-36, 4}, {-36, 12.26}, {-10.4, 12.26}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(rightHeart.outflow, pulmonaryCirculation.inflow) annotation(Line(points = {{-10, 25.7}, {-20, 25.7}, {-20, 26}, {-32, 26}, {-32, 74}, {-4, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryCirculation.outflow, leftHeart.inflow) annotation(Line(points = {{16, 74}, {32, 74}, {32, 10.14}, {17.6, 10.14}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicPeripheralVessels.hydraulicresistance, RSP.y) annotation(Line(points = {{0.4, -26.8}, {-6, -26.8}, {-6, -26}, {-11, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(leftHeart.Tas, heartIntervals.Tas) annotation(Line(points = {{22.4, 29.14}, {22, 29.14}, {22, 41}, {22.8, 41}}, color = {0, 0, 127}, smooth = Smooth.None, pattern = LinePattern.Dash));
      connect(leftHeart.Tav, heartIntervals.Tav) annotation(Line(points = {{16.8, 29.14}, {16, 29.14}, {16, 41.4}, {16.6, 41.4}}, color = {0, 0, 127}, smooth = Smooth.None, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{12.6, 41.2}, {12.6, 35.6}, {11.2, 35.6}, {11.2, 29.14}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{5.2, 41}, {5.2, 35.5}, {5.6, 35.5}, {5.6, 29.14}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{5.2, 41}, {-22.4, 41}, {-22.4, 33.26}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{12.6, 41.2}, {12.6, 46}, {-16.8, 46}, {-16.8, 33.26}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{16.6, 41.4}, {16.6, 48}, {-11.2, 48}, {-11.2, 33.26}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{22.8, 41}, {22.8, 33.26}, {-5.6, 33.26}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(systemicArteries.intrathoracicPressure, Pth.y) annotation(Line(points = {{37.2, -16}, {16, -16}, {16, -24}, {19, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(leftHeart.PTH, Pth.y) annotation(Line(points = {{16.8, -6.96}, {18, -16}, {16, -16}, {16, -24}, {19, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeart.PTH, Pth.y) annotation(Line(points = {{-11.2, -6.64}, {-11.2, -16}, {16, -16}, {16, -24}, {19, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(systemicVeins.intrathoracicPressure, Pth.y) annotation(Line(points = {{-31.8, -16.89}, {-12, -16.89}, {-12, -16}, {16, -16}, {16, -24}, {19, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pulmonaryCirculation.PTH, Pth.y) annotation(Line(points = {{6.1, 80.09999999999999}, {6.1, 82}, {34, 82}, {34, -16}, {16, -16}, {16, -24}, {19, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(HeartRate.y, heartIntervals.HR) annotation(Line(points = {{-11, 62}, {2, 62}, {2, 62.8}, {13.8, 62.8}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end Hemodynamicsv2;

    partial model SideOfHeart_testPhysiolibraryValve
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}}), iconTransformation(extent = {{-12, -4}, {8, 16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{84, -10}, {104, 10}}), iconTransformation(extent = {{-10, 60}, {10, 80}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-16, 6}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-6, -84})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-118, 36}, {-78, 76}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {22, 106})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atrioventricular delay" annotation(Placement(transformation(extent = {{-6, 44}, {18, 68}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {-6, 106})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-120, 10}, {-80, 50}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {-62, 106})));
      Physiolibrary.Hydraulic.Components.ElasticVessel atrium(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 4e-005) annotation(Placement(transformation(extent = {{-50, -60}, {-18, -28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00013) annotation(Placement(transformation(extent = {{28, -58}, {58, -28}})));
      Physiolibrary.Hydraulic.Components.IdealValve ventricleArteryValve(useLimitationInputs = true) annotation(Placement(transformation(extent = {{64, -30}, {88, -54}})));
      Parts.AtrialElastance atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762) annotation(Placement(transformation(extent = {{-64, 46}, {-26, 78}})));
      Parts.VentricularElastance ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66) annotation(Placement(transformation(extent = {{34, 36}, {82, 70}})));
      Physiolibrary.Types.Constants.VolumeConst VxAU(k = 3e-005) annotation(Placement(transformation(extent = {{-64, -18}, {-56, -10}})));
      Physiolibrary.Types.Constants.VolumeConst VxVU(k = 6e-005) annotation(Placement(transformation(extent = {{16, -14}, {24, -6}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxABackflow(k = 0)
        "conductance of tricupsid valve backflow"                                                                          annotation(Placement(transformation(extent = {{-18, -84}, {-10, -76}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CxVBackflow(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 0, origin = {58, -78})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RxAOutflow(k(displayUnit = "(mmHg.s)/ml") = 399967.162245)
        "resistance of tricupsid valve"                                                                                                     annotation(Placement(transformation(extent = {{-4, -92}, {4, -84}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RxVOutflow(k(displayUnit = "(mmHg.s)/ml") = 1066579.09932)
        "resistance of pulmonic valve"                                                                                                     annotation(Placement(transformation(extent = {{74, -86}, {82, -78}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-10, 58}, {-2, 66}})));
      Physiolibrary.Hydraulic.Components.IdealValve atrioVentricleValve(useLimitationInputs = true) annotation(Placement(visible = true, transformation(origin = {7, -42}, extent = {{-13, 12}, {13, -12}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(visible = true, transformation(origin = {3, 39}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-34, 106}, extent = {{-14, -14}, {14, 14}}, rotation = 270)));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(visible = true, transformation(origin = {100, 48}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
      Cardiovascular.Types.RealIO.HydraulicResistanceToConductance hydraulicresistancetoconductance annotation(Placement(transformation(extent = {{12, -92}, {20, -84}})));
      Cardiovascular.Types.RealIO.HydraulicResistanceToConductance hydraulicresistancetoconductance1 annotation(Placement(transformation(extent = {{90, -82}, {98, -74}})));
    equation
      connect(hydrauliccompliance.y, ventricle.compliance) annotation(Line(points = {{100, 43}, {100, 18.5654}, {42.7567, 18.5654}, {42.7567, -31}, {43, -31}}, smooth = Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance) annotation(Line(points = {{86.56, 56.91}, {94, 56.91}, {99.90000000000001, 55.9}, {99.90000000000001, 52.1}}, color = {0, 0, 127}));
      connect(Tvs, ventricularElastance.Tvs) annotation(Line(points = {{3, 39}, {16, 39}, {16, 48.58}, {29.68, 48.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation(Line(points = {{-98, 56}, {-74, 56}, {-74, 68.72}, {-67.8, 68.72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(VxAU.y, atrium.zeroPressureVolume) annotation(Line(points = {{-55, -14}, {-50, -14}, {-50, -31.2}, {-46.8, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VxVU.y, ventricle.zeroPressureVolume) annotation(Line(points = {{25, -10}, {30, -10}, {30, -31}, {31, -31}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, atrialElastance.T0) annotation(Line(points = {{-100, 30}, {-74, 30}, {-74, 52.4}, {-67.8, 52.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation(Line(points = {{6, 56}, {6, 56}, {6, 56.4}, {29.68, 56.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, atrium.externalPressure) annotation(Line(points = {{-16, 6}, {-18, 6}, {-18, -31.2}, {-21.2, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, ventricle.externalPressure) annotation(Line(points = {{-16, 6}, {55, 6}, {55, -31}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation(Line(points = {{-100, 30}, {-80, 30}, {-80, 8}, {-14, 8}, {-14, 24}, {29.68, 24}, {29.68, 39.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance) annotation(Line(points = {{-22.39, 61.84}, {-16.195, 61.84}, {-16.195, 61.9}, {-10.1, 61.9}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydrauliccompliance1.y, atrium.compliance) annotation(Line(points = {{-1, 62}, {0, 62}, {0, 36}, {-34, 36}, {-34, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation(Line(points = {{-98, 56}, {-80, 56}, {-80, 88}, {12, 88}, {12, 65.58}, {29.68, 65.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, atrium.q_in) annotation(Line(points = {{-96, 0}, {-86, 0}, {-86, -48}, {-34, -48}, {-34, -44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(atrium.q_in, atrioVentricleValve.q_in) annotation(Line(points = {{-34, -44}, {-22, -44}, {-22, -42}, {-6, -42}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(atrioVentricleValve.q_out, ventricle.q_in) annotation(Line(points = {{20, -42}, {32, -42}, {32, -43}, {43, -43}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(ventricle.q_in, ventricleArteryValve.q_in) annotation(Line(points = {{43, -43}, {53.5, -43}, {53.5, -42}, {64, -42}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(ventricleArteryValve.q_out, outflow) annotation(Line(points = {{88, -42}, {92, -42}, {92, 0}, {94, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(RxAOutflow.y, hydraulicresistancetoconductance.hydraulicresistance) annotation(Line(points = {{5, -88}, {11.2, -88}, {11.2, -87.59999999999999}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydraulicresistancetoconductance.y, atrioVentricleValve.Gon) annotation(Line(points = {{21, -88}, {10, -88}, {10, -54}, {-0.8, -54}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RxVOutflow.y, hydraulicresistancetoconductance1.hydraulicresistance) annotation(Line(points = {{83, -82}, {86, -82}, {86, -77.59999999999999}, {89.2, -77.59999999999999}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydraulicresistancetoconductance1.y, ventricleArteryValve.Gon) annotation(Line(points = {{99, -78}, {84, -78}, {84, -54}, {68.8, -54}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(CxABackflow.y, atrioVentricleValve.Goff) annotation(Line(points = {{-9, -80}, {4, -80}, {4, -54}, {14.8, -54}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(CxVBackflow.y, ventricleArteryValve.Goff) annotation(Line(points = {{63, -78}, {74, -78}, {74, -54}, {83.2, -54}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-70, 90}, {-56, 78}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "T0"), Text(extent = {{-42, 94}, {-26, 74}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tvs"), Text(extent = {{-14, 94}, {2, 74}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tav"), Text(extent = {{14, 92}, {34, 76}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tas"), Text(extent = {{12, -82}, {38, -104}}, lineColor = {0, 0, 255}, textString = "PTH")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end SideOfHeart_testPhysiolibraryValve;

    model LeftHeart_testPhysiolibraryValve
      extends Physiolibrary.Icons.LeftHeart;
      extends Test.SideOfHeart_testPhysiolibraryValve(VxAU(k = 3e-005), VxVU(k = 6e-005), RxAOutflow(k = 399967.162245), RxVOutflow(k = 1066579.09932), ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66), atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end LeftHeart_testPhysiolibraryValve;

    model RightHeart_testPhysiolibraryValve
      extends Physiolibrary.Icons.RightHeart;
      extends Test.SideOfHeart_testPhysiolibraryValve(atrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225), ventricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335), VxAU(k = 3e-005), RxAOutflow(k = 399967.162245), VxVU(k = 4e-005), RxVOutflow(k = 399967.162245), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{32, 60}, {18, 64}, {6, 64}, {6, 76}, {18, 76}, {30, 72}, {44, 64}, {36, 58}, {32, 60}}, smooth = Smooth.None,
                fillPattern =                                                                                                    FillPattern.Solid, fillColor = {58, 117, 175}, pattern = LinePattern.None, lineColor = {0, 0, 0})}));
    end RightHeart_testPhysiolibraryValve;

    model Heart_testPhysiolibraryValve
      "both sides of heart with heart interval control"
      Test.LeftHeart_testPhysiolibraryValve leftHeart annotation(Placement(transformation(extent = {{-8, -14}, {28, 22}})));
      Test.RightHeart_testPhysiolibraryValve rightHeart annotation(Placement(transformation(extent = {{-38, -14}, {0, 24}})));
      Parts.HeartIntervals heartIntervals annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-24, 52})));
      Physiolibrary.Types.RealIO.PressureInput PTH annotation(Placement(transformation(extent = {{-64, -42}, {-24, -2}}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 270, origin = {15, 61})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation(Placement(transformation(extent = {{-78, 48}, {-38, 88}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 270, origin = {-26, 60})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow annotation(Placement(transformation(extent = {{-54, -2}, {-34, 18}}), iconTransformation(extent = {{-44, -20}, {-24, 0}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow annotation(Placement(transformation(extent = {{-54, 12}, {-34, 32}}), iconTransformation(extent = {{-22, 8}, {-2, 28}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow annotation(Placement(transformation(extent = {{32, -2}, {52, 18}}), iconTransformation(extent = {{18, -12}, {38, 8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow annotation(Placement(transformation(extent = {{28, 52}, {48, 72}}), iconTransformation(extent = {{8, 10}, {28, 30}})));
    equation
      connect(PTH, rightHeart.PTH) annotation(Line(points = {{-44, -22}, {-20.14, -22}, {-20.14, -10.96}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(PTH, leftHeart.PTH) annotation(Line(points = {{-44, -22}, {8.92, -22}, {8.92, -11.12}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeartInflow, rightHeart.inflow) annotation(Line(points = {{-44, 8}, {-30, 8}, {-30, 6.14}, {-19.38, 6.14}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeartInflow, rightHeartInflow) annotation(Line(points = {{-44, 8}, {-44, 8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation(Line(points = {{-19, 18.3}, {-42, 18.3}, {-42, 22}, {-44, 22}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(leftHeart.inflow, leftHeartInflow) annotation(Line(points = {{9.640000000000001, 5.08}, {35.8, 5.08}, {35.8, 8}, {42, 8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(heartRate, heartIntervals.HR) annotation(Line(points = {{-58, 68}, {-36, 68}, {-36, 62.8}, {-24.2, 62.8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation(Line(points = {{-32.8, 41}, {-32.8, 28}, {-32, 28}, {-30.78, 28}, {-30.78, 26}, {-30.78, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation(Line(points = {{-25.4, 41.2}, {-25.4, 33.6}, {-25.46, 33.6}, {-25.46, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation(Line(points = {{-21.4, 41.4}, {-21.4, 28}, {-20, 28}, {-20, 26}, {-20.14, 26}, {-20.14, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation(Line(points = {{-15.2, 41}, {-15.2, 28}, {-14, 28}, {-14, 26}, {-14.82, 26}, {-14.82, 25.14}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-15.2, 41}, {13.96, 41}, {13.96, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-21.4, 41.4}, {-21.4, 38}, {8.92, 38}, {8.92, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-25.4, 41.2}, {-25.4, 34}, {3.88, 34}, {3.88, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-32.8, 41}, {-32.8, 30}, {-1.16, 30}, {-1.16, 23.08}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(leftHeartInflow, leftHeartInflow) annotation(Line(points = {{42, 8}, {36, 8}, {36, 8}, {42, 8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(leftHeartOutflow, leftHeart.outflow) annotation(Line(points = {{38, 62}, {30, 62}, {30, 60}, {20, 60}, {20, 16.6}, {10, 16.6}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {40, 80}}), graphics={  Text(extent = {{-14, 50}, {44, 32}}, lineColor = {0, 0, 255}, textString = "PTH"), Text(extent = {{-64, 48}, {4, 32}}, lineColor = {0, 0, 255}, textString = "HeartRate"), Bitmap(extent = {{-6, 22}, {34, -48}}, fileName = "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"), Bitmap(extent = {{-34, 18}, {6, -48}}, fileName = "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {40, 80}}), graphics));
    end Heart_testPhysiolibraryValve;

    model Hemodynamics_testPhysiolibraryValve
      extends Models.Hemodynamics(redeclare Test.Heart_testPhysiolibraryValve heart);
      Physiolibrary.Types.Constants.PressureConst Pext(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 0, origin = {-24, 12})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {38, 68})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 0, origin = {-26, 66})));
    equation
      connect(Pext.y, systemicCirculation.Pext) annotation(Line(points = {{-19, 12}, {-8, 12}, {-8, 13}, {3, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(HeartRate.y, heart.heartRate) annotation(Line(points = {{-21, 66}, {5.44, 66}, {5.44, 54.8571}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, pulmonaryCirculation.PTH) annotation(Line(points = {{33, 68}, {32, 68}, {32, 88}, {8.1, 88}, {8.1, 86.09999999999999}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, heart.PTH) annotation(Line(points = {{33, 68}, {32, 68}, {32, 56}, {12, 56}, {12, 55.0143}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pth.y, systemicCirculation.PTH) annotation(Line(points = {{33, 68}, {32, 68}, {32, 24}, {8.199999999999999, 24}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -20}, {60, 100}}), graphics));
    end Hemodynamics_testPhysiolibraryValve;

    model Hemodynamics_test
      extends Models.Hemodynamics;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -20}, {60, 100}}), graphics));
    end Hemodynamics_test;

    model Hemodynamics_from_CV
      "model of hemodynamics - decomposed to submodels"
      extends Cardiovascular.Hydraulic.Models.CardiovascularSystem(redeclare
          MeursModel.Parts.PulmonaryCirculation                                                                    pulmonaryCirculation(PulmonaryArteries(volume_start = 0.000106099), PulmonaryVeins(volume_start = 0.000518047)), redeclare
          MeursModel.Parts.SystemicCirculation                                                                                                     systemicCirculation(systemicVeins(IntraThoracicVeins(volume_start = 0.00148362), ExtrathoracicVeins(volume_start = 0.00152652)), systemicArteries(IntraThoracicArteries(volume_start = 0.000204489), ExtrathoracicArteries(volume_start = 0.000526335)), systemicPeripheralVessels(PeripheralVessels(volume_start = 0.000282957))), redeclare
          MeursModel.Parts.Heart                                                                                                     heart(rightHeart(atrium(volume_start = 0.000134552), ventricle(volume_start = 0.000130706)), leftHeart(atrium(volume_start = 9.31e-005), ventricle(volume_start = 0.000143597))));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -60}, {40, 60}}), graphics), Icon(coordinateSystem(extent = {{-40, -60}, {40, 60}}, preserveAspectRatio = false), graphics));
    end Hemodynamics_from_CV;
  end Test;


  package Models

    model Hemodynamics "model of hemodynamics by Meurs"
      replaceable Parts.PulmonaryCirculation pulmonaryCirculation annotation(Placement(transformation(extent={{-10,14},
                {10,34}})));
      replaceable Parts.Heart heart annotation(Placement(transformation(extent = {{-10, -8}, {6, 14}})));
      replaceable Parts.SystemicCirculation systemicCirculation annotation(Placement(transformation(extent={{-10,-30},
                {10,-10}})));
    equation
      connect(systemicCirculation.inflow, heart.leftHeartOutflow) annotation(Line(points={{9.8,
              -20.2},{16,-20.2},{16,9.28571},{0.971429,9.28571}},                                                                                       color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(heart.leftHeartInflow, pulmonaryCirculation.outflow) annotation(Line(points={{2.34286,
              4.25714},{16,4.25714},{16,24},{10,24}},                                                                                            color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation(Line(points={{-9.6,
              -20.2},{-20,-20.2},{-20,3.31429},{-5.42857,3.31429}},                                                                                               color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation(Line(points={{
              -3.14286,8.34286},{-18,8.34286},{-18,23.8},{-10,23.8}},                                                                                  color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -60}, {40, 60}}), graphics), Icon(coordinateSystem(extent = {{-40, -60}, {40, 60}}, preserveAspectRatio = false), graphics={  Bitmap(extent = {{-30, 38}, {30, -36}}, fileName = "modelica://MeursModel/Resources/Icons/cvsconcept.png")}), Documentation(info = "<html>
  <p>Hemodynamics model by Meurs et al.</p>
  <p><br>Model, all parameters and initial values are from the following articles:</p>
  <ul>
  <li>J. A. Goodwin, W. L. van Meurs, C. D. Sa Couto, J. E. W. Beneken, S. A. Graves, A model for educational simulation of infant cardiovascular physiology., Anesthesia and analgesia 99 (6) (2004) 1655-1664, doi:10.1213/01.ANE.0000134797.52793.AF.</li>
  <li>C. D. Sa Couto, W. L. vanMeurs, J. A. Goodwin, P. Andriessen,A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006)4-12.</li>
  <li>W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</li>
  </ul>
  </html>", revisions = "<html>
  <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
  <p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
  </html>"));
    end Hemodynamics;

    model Hemodynamics_factor_manipulation
      extends Hemodynamics(systemicCirculation(systemicVeins(
            redeclare
              Cardiovascular.Types.Constants.HydraulicElastanceToComplianceFactorConst
              EITHV(k(displayUnit="mmHg/ml")),
            redeclare
              Cardiovascular.Types.Constants.HydraulicResistanceToConductanceFactorConst
              RRAIN(k(displayUnit="(mmHg.s)/ml")),
            redeclare Cardiovascular.Types.Constants.VolumeFactorConst VITHVU),
            systemicPeripheralVessels(redeclare
              Cardiovascular.Types.Constants.HydraulicResistanceToConductanceFactorConst
              RSVEN),
          systemicArteries(redeclare
              Cardiovascular.Types.Constants.HydraulicElastanceToComplianceFactorConst
              EETHA, redeclare
              Cardiovascular.Types.Constants.HydraulicElastanceToComplianceFactorConst
              EITHA)),                               heart(rightHeart(redeclare
              Experiment.VentricularElastance_factor_manipulation
              ventricularElastance,
            redeclare
              Cardiovascular.Types.Constants.HydraulicResistanceFactorConst
              RxVOutflow),           leftHeart(redeclare
              Experiment.VentricularElastance_factor_manipulation
              ventricularElastance,
            redeclare
              Cardiovascular.Types.Constants.HydraulicResistanceFactorConst
              RxAOutflow,
            redeclare
              Cardiovascular.Types.Constants.HydraulicResistanceFactorConst
              RxVOutflow)),
        pulmonaryCirculation(redeclare
            Cardiovascular.Types.Constants.HydraulicElastanceToComplianceFactorConst
            EPA));
    end Hemodynamics_factor_manipulation;
  end Models;

  package Experiment
    model AorticStenosis "Hemodynamics in congenital aortic stenosis "
      extends Models.Hemodynamics(heart(leftHeart(RxVOutflow(k = 106657909.932), ventricularElastance(EMIN = 199983581.1225), VxVU(k = 0))), systemicCirculation(systemicArteries(RETHA(k = 106657909.932))));
      annotation(Documentation(info = "<html>
  <p>Congenital aortic stenosis may&nbsp;be&nbsp;caused&nbsp;by&nbsp;a&nbsp;spectrum&nbsp;of&nbsp;lesions&nbsp;that&nbsp;obstruct&nbsp;blood&nbsp;flow&nbsp;from the&nbsp;left&nbsp;ventricle&nbsp;to&nbsp;the&nbsp;aorta.&nbsp;Inclusion&nbsp;in&nbsp;an&nbsp;educational&nbsp;simulation&nbsp;is&nbsp;relevant&nbsp;for&nbsp;the&nbsp;training &nbsp;in&nbsp;recognition&nbsp;of&nbsp;and&nbsp;possible&nbsp;therapeutic&nbsp;interventions&nbsp;on&nbsp;an&nbsp;infant&nbsp;with&nbsp;this&nbsp;condition.&nbsp; Three&nbsp;parameter&nbsp;changes&nbsp;were&nbsp;made&nbsp;to&nbsp;the&nbsp;model.&nbsp;The&nbsp;aortic&nbsp;valve&nbsp;and&nbsp;intrathoracic&nbsp;artery &nbsp;resistance&nbsp;(Appendix&nbsp;2)&nbsp;was&nbsp;increased&nbsp;from&nbsp;0.016&nbsp;to&nbsp;0.8&nbsp;mm&nbsp;Hg&nbsp;&middot;&nbsp;mL&minus;1&nbsp;&middot;&nbsp;s.&nbsp;On&nbsp;the&nbsp;basis&nbsp;of&nbsp;a&nbsp;left&nbsp;ventricular&nbsp;pressure&nbsp;volume&nbsp;curve&nbsp;given&nbsp;by&nbsp;Graham&nbsp;and&nbsp;Jarmakani&nbsp;(12),&nbsp;we&nbsp;changed&nbsp;the&nbsp;left&nbsp; ventricular&nbsp;filling&nbsp;characteristics&nbsp;by&nbsp;increasing&nbsp;the&nbsp;diastolic&nbsp;elastance&nbsp;of&nbsp;the&nbsp;left&nbsp;ventricle &nbsp;from&nbsp;0.55&nbsp;to&nbsp;1.5&nbsp;mm&nbsp;Hg/mL&nbsp;while&nbsp;reducing&nbsp;the&nbsp;unstressed&nbsp;volume&nbsp;from&nbsp;2&nbsp;to&nbsp;0&nbsp;mL.&nbsp;This&nbsp;is&nbsp;thought&nbsp;to&nbsp;reflect&nbsp;the&nbsp;reduced&nbsp;compliance&nbsp;and&nbsp;unstressed&nbsp;volume&nbsp;due&nbsp;to&nbsp;the&nbsp;increased&nbsp;cardiac&nbsp;muscle&nbsp;mass.&nbsp;</p>
  <p><br>J.&nbsp;A.&nbsp;Goodwin,&nbsp;W.&nbsp;L.&nbsp;van&nbsp;Meurs,&nbsp;C.&nbsp;D.&nbsp;Sa&nbsp;Couto, J.&nbsp;E.&nbsp;W.&nbsp;Beneken,&nbsp;S.&nbsp;A.&nbsp;Graves,&nbsp;A&nbsp;model&nbsp;for&nbsp;educational simulation&nbsp;of&nbsp;infant&nbsp;cardiovascular&nbsp;physiology.,&nbsp;Anesthesia and&nbsp;analgesia&nbsp;99&nbsp;(6)&nbsp;(2004)&nbsp;1655-1664</p>
  </html>"));
    end AorticStenosis;

    model Hemodynamics_Adult
      extends Models.Hemodynamics(Pth(k = -533.28954966), HeartRate(k = 1.2), heart(leftHeart(RxAOutflow(k = 399967.162245), RxVOutflow(k = 1066579.09932), atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762), VxAU(k = 3e-005), ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66), VxVU(k = 6e-005)), rightHeart(atrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225), RxAOutflow(k = 399967.162245), RxVOutflow(k = 399967.162245), VxAU(k = 3e-005), VxVU(k = 4e-005), ventricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335))), systemicCirculation(RSP(k = 133322387.415), systemicArteries(VITHAU(k = 0.00014), EITHA(k = 190651014.00345), inertia(I = 93325.6711905), RETHA(k = 7999343.2449), EETHA(k = 74127247.40274), VETHAU(k = 0.00037)), systemicVeins(RRAIN(k = 399967.162245), RETHV(k = 11999014.86735), VETHVU(k = 0.001), EETHV(k = 2253148.3473135), EITHV(k = 2426467.450953), VITHVU(k = 0.00119), ExtrathoracicVeins(volume_start = 0.00146))), pulmonaryCirculation(EPA(k = 31064116.267695), EPV(k = 6066168.6273825), VPAU(k = 5e-005), RPP(k = 14665462.61565), VPVU(k = 0.00035), RLAIN(k = 399967.162245)));
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {-35, 49}), iconTransformation(extent = {{-34, 40}, {-14, 60}})));
    equation
      volume = pulmonaryCirculation.volume + systemicCirculation.systemicVeins.IntraThoracicVeins.volume + systemicCirculation.systemicVeins.ExtrathoracicVeins.volume + systemicCirculation.systemicPeripheralVessels.BloodTissueElasticCompartment.volume + systemicCirculation.systemicArteries.ExtrathoracicArteries.volume + systemicCirculation.systemicArteries.IntraThoracicArteries.volume + heart.leftHeart.atrium.volume + heart.leftHeart.ventricle.volume + heart.rightHeart.atrium.volume + heart.rightHeart.ventricle.volume;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -20}, {60, 100}}), graphics));
    end Hemodynamics_Adult;

    model Hemodynamics_with_catheter
      extends Models.Hemodynamics;
      Physiolibrary.Types.RealIO.VolumeOutput volume annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {-31, 35}), iconTransformation(extent = {{-8, -8}, {8, 8}}, rotation = 180, origin = {-28, 28})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a catheter annotation(Placement(transformation(extent = {{-36, -12}, {-20, 4}}), iconTransformation(extent = {{-38, -8}, {-20, 10}})));
    equation
      volume = pulmonaryCirculation.PulmonaryArteries.volume + pulmonaryCirculation.PulmonaryVeins.volume + systemicCirculation.systemicVeins.IntraThoracicVeins.volume + systemicCirculation.systemicVeins.ExtrathoracicVeins.volume + systemicCirculation.systemicPeripheralVessels.PeripheralVessels.volume + systemicCirculation.systemicArteries.ExtrathoracicArteries.volume + systemicCirculation.systemicArteries.IntraThoracicArteries.volume + heart.leftHeart.atrium.volume + heart.leftHeart.ventricle.volume + heart.rightHeart.atrium.volume + heart.rightHeart.ventricle.volume;
      connect(catheter, heart.rightHeartInflow) annotation(Line(points={{-28,-4},
              {-10,-4},{-10,-0.142857},{-5.84,-0.142857}},                                                                          color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {20, 40}}), graphics={  Text(extent = {{-22, 40}, {-4, 30}}, lineColor = {0, 0, 0}, fillColor = {255, 170, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "=pulmonary.volume+
  heart.volume+
  systemic.volume")}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {20, 40}}), graphics={  Line(points = {{-28, -6}, {-22, 0}, {-6, 2}, {-8, 2}}, color = {190, 0, 0}, smooth = Smooth.Bezier, thickness = 1)}));
    end Hemodynamics_with_catheter;

    model BloodTransfusionHemorrhage
      // Physiolibrary.Types.RealIO.VolumeFlowRateInput volumerate(start=0.00004);
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation(Placement(transformation(extent = {{-4, -34}, {16, -14}}), iconTransformation(extent = {{56, -100}, {76, -80}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput volumeflowrate annotation(Placement(transformation(extent = {{-186, -80}, {-146, -40}}), iconTransformation(extent = {{-90, 56}, {-50, 96}})));
    equation
      port_b.q = -volumeflowrate;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-54, 36}, {8, -30}}, lineColor = {0, 0, 0},
                lineThickness =                                                                                                    1,
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {190, 0, 0}, radius = 4), Rectangle(extent = {{-50, -28}, {-46, -62}}, lineColor = {0, 0, 0},
                lineThickness =                                                                                                    1,
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {190, 0, 0}), Rectangle(extent = {{4, -26}, {8, -62}}, lineColor = {0, 0, 0},
                lineThickness =                                                                                                    1,
                fillPattern =                                                                                                    FillPattern.Sphere, fillColor = {190, 0, 0}), Polygon(points = {{-20, -30}, {-20, -38}, {-18, -40}, {-14, -46}, {-16, -48}, {-14, -52}, {-12, -54}, {-10, -56}, {-12, -58}, {-14, -62}, {-12, -64}, {-8, -66}, {-6, -68}, {-4, -74}, {-2, -76}, {2, -80}, {8, -82}, {14, -86}, {22, -90}, {28, -92}, {34, -94}, {38, -94}, {54, -96}, {62, -96}, {62, -96}, {60, -94}, {54, -92}, {48, -92}, {38, -90}, {36, -90}, {30, -86}, {20, -84}, {14, -80}, {10, -78}, {4, -76}, {0, -70}, {-2, -68}, {-4, -64}, {-8, -60}, {-4, -54}, {-10, -50}, {-10, -46}, {-8, -44}, {-14, -38}, {-16, -34}, {-16, -30}, {-20, -30}}, lineColor = {127, 0, 0},
                lineThickness =                                                                                                    1,
                fillPattern =                                                                                                    FillPattern.Sphere, smooth = Smooth.None, fillColor = {190, 0, 0}), Rectangle(extent = {{-54, 62}, {8, 56}}, lineColor = {0, 0, 0},
                fillPattern =                                                                                                    FillPattern.Solid, fillColor = {170, 255, 255}), Rectangle(extent = {{-54, 56}, {8, 32}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
                fillPattern =                                                                                                    FillPattern.Sphere, radius = 2,
                lineThickness =                                                                                                    1)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end BloodTransfusionHemorrhage;

    model VolumeControl "control total blood volume"
      parameter Physiolibrary.Types.Time flowtime = 0.1;
      Physiolibrary.Types.RealIO.VolumeInput volume annotation(Placement(transformation(extent = {{16, 60}, {56, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {14, 72})));
      Physiolibrary.Types.RealIO.VolumeInput desiredVolume annotation(Placement(transformation(extent = {{-72, 56}, {-32, 96}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-68, 72})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate annotation(Placement(transformation(extent = {{88, 18}, {108, 38}}), iconTransformation(extent = {{82, 8}, {116, 42}})));
    equation
      volumeflowrate = (desiredVolume - volume) / flowtime;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-98, 56}, {98, -8}}, lineColor = {0, 0, 255},
                fillPattern =                                                                                                    FillPattern.Solid, fillColor = {170, 213, 255}), Ellipse(extent = {{-10, 52}, {46, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{-92, 46}, {-38, 8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{-32, 30}, {-14, 24}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 0},
                fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{56, 36}, {74, 30}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 0},
                fillPattern =                                                                                                    FillPattern.Solid), Rectangle(extent = {{56, 24}, {74, 18}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 0},
                fillPattern =                                                                                                    FillPattern.Solid)}));
    end VolumeControl;

    model Hemodynamics_volume_control
      replaceable Hemodynamics_with_catheter hemodynamics_with_catheter annotation(Placement(transformation(extent = {{14, -20}, {64, 40}})));
      BloodTransfusionHemorrhage bloodTransfusionHemorrhage annotation(Placement(transformation(extent = {{-20, -20}, {0, 0}})));
      VolumeControl volumeControl annotation(Placement(transformation(extent = {{-46, -14}, {-26, 6}})));
      Physiolibrary.Types.Constants.VolumeConst desiredVolume(k = 0.00415) annotation(Placement(transformation(extent = {{-62, 12}, {-54, 20}})));
    equation
      connect(bloodTransfusionHemorrhage.port_b, hemodynamics_with_catheter.catheter) annotation(Line(points={{-3.4,
              -19},{7.3,-19},{7.3,10.75},{23.1667,10.75}},                                                                                                    color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(hemodynamics_with_catheter.volume, volumeControl.volume) annotation(Line(points={{24,31},
              {-34.6,31},{-34.6,3.2}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
      connect(volumeControl.volumeflowrate, bloodTransfusionHemorrhage.volumeflowrate) annotation(Line(points = {{-26.1, -1.5}, {-22.05, -1.5}, {-22.05, -2.4}, {-17, -2.4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(desiredVolume.y, volumeControl.desiredVolume) annotation(Line(points = {{-53, 16}, {-42.8, 16}, {-42.8, 3.2}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end Hemodynamics_volume_control;

    model SystemicPeripheralVessels_RSPControl
      extends Parts.SystemicPeripheralVessels(redeclare
          Cardiovascular.Types.Constants.HydraulicConductanceControl                                               RSP);
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSPin annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {98, 30}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 270, origin = {47, 75})));
    equation
      connect(RSP.c, RSPin) annotation(Line(points = {{73.5, 30}, {98, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end SystemicPeripheralVessels_RSPControl;

    model SystemicCirculation_RSPChange
      extends Parts.SystemicCirculation(redeclare
          SystemicPeripheralVessels_RSPControl                                         systemicPeripheralVessels);
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSPin annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {20, 50}), iconTransformation(extent = {{-84, -54}, {-44, -14}})));
    equation
      connect(systemicPeripheralVessels.RSPin, RSPin) annotation(Line(points = {{-7.3, 9.5}, {-7.3, 50}, {20, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end SystemicCirculation_RSPChange;

    model Hemodynamics_PeripheralStenosis
      extends Models.Hemodynamics(redeclare SystemicCirculation_RSPChange systemicCirculation);
      PeripheralStenosis peripheralStenosis annotation(Placement(transformation(extent = {{-30, 2}, {-10, 22}})));
    equation
      connect(peripheralStenosis.RSPout, systemicCirculation.RSPin) annotation(Line(points={{-16,
              11.8},{-8,11.8},{-8,-23.4},{-6.4,-23.4}},                                                                                             color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -20}, {60, 100}}), graphics));
    end Hemodynamics_PeripheralStenosis;

    model PeripheralStenosis
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst           RSP(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent = {{-5, -4}, {5, 4}}, rotation = 0, origin = {-25, 92})));
      Modelica.Blocks.Sources.Ramp ramp(duration = 10, offset = 1, startTime = 20, height = -0.2) annotation(Placement(transformation(extent = {{-36, 54}, {-16, 74}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{4, 60}, {24, 80}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput RSPout annotation(Placement(transformation(extent = {{30, -12}, {50, 8}}), iconTransformation(extent = {{30, -12}, {50, 8}})));
    equation
      connect(ramp.y, product.u2) annotation(Line(points = {{-15, 64}, {2, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(RSP.y, product.u1) annotation(Line(points = {{-18.75, 92}, {-8, 92}, {-8, 76}, {2, 76}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, RSPout) annotation(Line(points = {{25, 70}, {40, 70}, {40, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-24, 18}, {16, -20}}, lineColor = {0, 0, 0},
                lineThickness =                                                                                                    1, fillColor = {255, 170, 170},
                fillPattern =                                                                                                    FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end PeripheralStenosis;

    model Hemodynamics_steady
      Hemodynamics_with_catheter hemodynamics_with_catheter(pulmonaryCirculation(PulmonaryArteries(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState), PulmonaryVeins(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState)), heart(rightHeart(atrium(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState), ventricle(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState)), leftHeart(atrium(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState), ventricle(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState))), systemicCirculation(systemicArteries(IntraThoracicArteries(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState), ExtrathoracicArteries(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState)), systemicPeripheralVessels(PeripheralVessels(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState)), systemicVeins(ExtrathoracicVeins(Simulation = Physiolibrary.Types.SimulationType.InitSteadyState), IntraThoracicVeins(isDependent = true, Simulation = Physiolibrary.Types.SimulationType.InitSteadyState)))) annotation(Placement(transformation(extent = {{-18, -32}, {20, 24}})));
      Physiolibrary.SteadyStates.Components.MassConservationLaw massConservationLaw(n = 1, Simulation = Physiolibrary.Types.SimulationType.InitSteadyState, Total = 0.005) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-58, 16})));
    equation
      connect(massConservationLaw.fragment[1], hemodynamics_with_catheter.volume) annotation(Line(points = {{-48, 20}, {-30, 20}, {-30, 15.6}, {-10.4, 15.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end Hemodynamics_steady;

    model VentricularElastance_factor_manipulation

      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-138, 54}, {-98, 94}}), iconTransformation(extent = {{-138, 54}, {-98, 94}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-138, -100}, {-98, -60}}), iconTransformation(extent = {{-138, -100}, {-98, -60}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceOutput Et
        "ventricular elasticity (torr/ml)"                                                       annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, 4}, {138, 42}})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay" annotation(Placement(transformation(extent = {{-140, 22}, {-100, 62}}), iconTransformation(extent = {{-138, 0}, {-98, 40}})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(transformation(extent = {{-140, -64}, {-100, -24}}), iconTransformation(extent = {{-138, -46}, {-98, -6}})));
      Modelica.Blocks.Interfaces.RealOutput Et0
        "normalized ventricular elasticity (0..1)"                                         annotation(Placement(transformation(extent = {{100, -24}, {120, -4}}), iconTransformation(extent = {{100, -40}, {138, -2}})));
      Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time" annotation(Placement(transformation(extent = {{102, -42}, {122, -22}}), iconTransformation(extent = {{100, -98}, {138, -60}})));
      parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance ";
      parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance";
      parameter Real factor = 1;
      constant Real Kn = 0.57923032735652;
      //Kn is always = 0.5792303273565197
      //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
      //Equation to calculate normalized elastance ET0 was:
      //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
    equation
      HeartInterval = time - T0;
      Et = EMIN + (EMAX - EMIN) * Et0*factor;
      if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
        Et0 = (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn;
      else
        Et0 = 0;
      end if;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, pattern = LinePattern.None,
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-82, 82}, {80, 24}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Ventricular elastance"), Line(points = {{-72, -34}, {-68, -26}, {-62, -14}, {-52, 4}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                    1, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "%name"), Text(extent = {{-96, 82}, {-76, 66}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tas"), Text(extent = {{-92, 26}, {-76, 6}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tav"), Text(extent = {{-94, -18}, {-78, -38}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Tvs"), Text(extent = {{-96, -74}, {-82, -86}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "T0"), Text(extent = {{72, 36}, {88, 14}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Et"), Text(extent = {{96, -32}, {68, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Et0"), Text(extent = {{42, -72}, {88, -84}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                fillPattern =                                                                                                    FillPattern.Solid, textString = "Heart interval")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end VentricularElastance_factor_manipulation;
  end Experiment;
  annotation(uses(Physiolibrary(version = "2.1"), Modelica(version = "3.2.1")), version = "2", conversion(noneFromVersion = ""), Documentation(revisions = "<html>
          <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
          <p>Copyright &copy; 2008-2014, Tomas Kulhanek, Charles University in Prague.</p>
          <p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
          </html>"));
end MeursModel;
