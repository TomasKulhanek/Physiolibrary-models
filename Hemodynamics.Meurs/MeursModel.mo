within ;
package MeursModel
  package Parts
    model SystemicArteries
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a Inflow annotation(Placement(transformation(extent = {{88, -12}, {108, 8}}), iconTransformation(extent = {{88, -12}, {108, 8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b Outflow annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}}), iconTransformation(extent = {{-108, -8}, {-88, 12}})));
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {76, 74}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 48})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0003) annotation(Placement(transformation(extent = {{32, -10}, {52, 10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00045) annotation(Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(volumeFlow_start(displayUnit = "l/min") = 8.333333333333301e-005, I(displayUnit = "mmHg.s2/ml") = 93325.6711905) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {2, 2})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(useConductanceInput = true) annotation(Placement(transformation(extent = {{-44, -10}, {-24, 10}})));
      Physiolibrary.Types.Constants.VolumeConst VITHAU(k = 0.00014)
        "unstressed volume of intrathoracic arteries"                                                             annotation(Placement(transformation(extent = {{-46, 44}, {14, 50}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EITHA(k(displayUnit = "mmHg/ml") = 190651014.00345) annotation(Placement(transformation(extent = {{-38, 74}, {-6, 82}})));
      Physiolibrary.Types.Constants.VolumeConst VETHAU(k = 0.00037)
        "unstressed volume of extrathoracic arteries"                                                             annotation(Placement(transformation(extent = {{-30, -3}, {30, 3}}, rotation = 270, origin = {-74, 61})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EETHA(k(displayUnit = "mmHg/ml") = 74127247.40274) annotation(Placement(transformation(extent = {{-16, -4}, {16, 4}}, rotation = 270, origin = {-62, 72})));
      Physiolibrary.Types.Constants.PressureConst pressure(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 270, origin = {-54, 40})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHA(k(displayUnit = "(mmHg.s)/ml") = 7999343.2449) annotation(Placement(transformation(extent = {{-40, 32}, {-32, 40}})));
    equation
      connect(VITHAU.y, IntraThoracicArteries.zeroPressureVolume) annotation(Line(points = {{21.5, 47}, {34, 47}, {34, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(IntraThoracicArteries.externalPressure, intrathoracicPressure) annotation(Line(points = {{50, 8}, {76, 8}, {76, 74}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Inflow, IntraThoracicArteries.q_in) annotation(Line(points = {{98, -2}, {74, -2}, {74, 2.22045e-016}, {42, 2.22045e-016}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(conductor.q_in, ExtrathoracicArteries.q_in) annotation(Line(points = {{-44, 0}, {-66, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(ExtrathoracicArteries.q_in, Outflow) annotation(Line(points = {{-66, 0}, {-96, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(ExtrathoracicArteries.zeroPressureVolume, VETHAU.y) annotation(Line(points = {{-74, 8}, {-74, 23.5}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pressure.y, ExtrathoracicArteries.externalPressure) annotation(Line(points = {{-54, 35}, {-48, 35}, {-48, 8}, {-58, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(RETHA.y, conductor.cond) annotation(Line(points = {{-31, 36}, {-34, 36}, {-34, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(EETHA.y, ExtrathoracicArteries.compliance) annotation(Line(points = {{-62, 52}, {-64, 52}, {-64, 8}, {-66, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(EITHA.y, IntraThoracicArteries.compliance) annotation(Line(points = {{-2, 78}, {42, 78}, {42, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(conductor.q_out, inertia.q_out) annotation(Line(points = {{-24, 0}, {-16, 0}, {-16, 2}, {-8, 2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(inertia.q_in, IntraThoracicArteries.q_in) annotation(Line(points = {{12, 2}, {28, 2}, {28, 0}, {42, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(Inflow, Inflow) annotation(Line(points = {{98, -2}, {98, -2}, {98, -2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-98, 38}, {94, -42}}, lineColor=  {255, 229, 185}, fillColor=  {255, 85, 85},
                fillPattern=                                                                                                    FillPattern.HorizontalCylinder), Text(extent=  {{-220, 50}, {0, 38}}, lineColor=  {0, 0, 0}, fillColor=  {255, 235, 161},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "intraThoracicPressure"), Text(extent=  {{-98, -64}, {94, -48}}, lineColor=  {0, 0, 255}, fillColor=  {255, 235, 161},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name")}));
    end SystemicArteries;

    model SystemicPeripheralVessels
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow annotation(Placement(transformation(extent = {{90, -12}, {110, 8}}), iconTransformation(extent = {{90, -12}, {110, 8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow annotation(Placement(transformation(extent = {{-108, -12}, {-88, 8}}), iconTransformation(extent = {{-108, -12}, {-88, 8}})));
      Physiolibrary.Hydraulic.Components.Conductor SystemicArterioralConductance(useConductanceInput = true) annotation(Placement(transformation(extent = {{11, -9}, {-11, 9}}, rotation = 0, origin = {35, -1})));
      Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(useConductanceInput = true) annotation(Placement(transformation(extent = {{14, -9}, {-14, 9}}, rotation = 0, origin = {-46, 1})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RTA(k(displayUnit = "(mmHg.s)/ml") = 26664477.483) annotation(Placement(transformation(extent = {{-70, 18}, {-62, 26}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel BloodTissueElasticCompartment(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0002) annotation(Placement(transformation(extent = {{-12, -12}, {8, 8}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EET(k = 34930465.50273) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {24, 76})));
      Physiolibrary.Types.Constants.VolumeConst TUV(k = 0.000185) annotation(Placement(transformation(extent = {{-28, 48}, {-20, 56}})));
      Physiolibrary.Types.Constants.PressureConst Pext(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {28, 52})));
      PhysiolibraryExtension.Types.RealIO.HydraulicResistanceInput hydraulicresistance annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {96, 40}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-16, 52})));
      PhysiolibraryExtension.Types.RealIO.HydraulicResistanceToConductance hydraulicresistancetoconductance annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {52, 38})));
    equation
      connect(RTA.y, SmallVenuleConductance.cond) annotation(Line(points = {{-61, 22}, {-46, 22}, {-46, 6.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(bloodFlowInflow, SystemicArterioralConductance.q_in) annotation(Line(points = {{100, -2}, {74, -2}, {74, -1}, {46, -1}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(SystemicArterioralConductance.q_out, BloodTissueElasticCompartment.q_in) annotation(Line(points = {{24, -1}, {12, -1}, {12, -2}, {-2, -2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(BloodTissueElasticCompartment.q_in, SmallVenuleConductance.q_in) annotation(Line(points = {{-2, -2}, {-18, -2}, {-18, 1}, {-32, 1}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(SmallVenuleConductance.q_out, bloodFlowOutflow) annotation(Line(points = {{-60, 1}, {-78, 1}, {-78, -2}, {-98, -2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(EET.y, BloodTissueElasticCompartment.compliance) annotation(Line(points = {{19, 76}, {-2, 76}, {-2, 22}, {-2, 6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(TUV.y, BloodTissueElasticCompartment.zeroPressureVolume) annotation(Line(points = {{-19, 52}, {-10, 52}, {-10, 14}, {-10, 6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Pext.y, BloodTissueElasticCompartment.externalPressure) annotation(Line(points = {{23, 52}, {6, 52}, {6, 26}, {6, 6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydraulicresistance, hydraulicresistancetoconductance.hydraulicresistance) annotation(Line(points = {{96, 40}, {78, 40}, {78, 37.6}, {56.8, 37.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(hydraulicresistancetoconductance.y, SystemicArterioralConductance.cond) annotation(Line(points = {{47, 38}, {34, 38}, {34, 4.4}, {35, 4.4}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(fillColor=  {255, 85, 85},
                fillPattern=                                                                                                    FillPattern.Solid, extent={{4,
                  68},{136,46}},                                                                                                    textString=  "Peripheral resistance"), Text(lineColor=  {0, 0, 255}, fillColor=  {255, 85, 85},
                fillPattern=                                                                                                    FillPattern.Solid, extent={{
                  -136,-40},{136,-60}},                                                                                                    textString=  "%name")}));
    end SystemicPeripheralVessels;

    model SystemicVeins
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow annotation(Placement(transformation(extent = {{88, -8}, {108, 12}}), iconTransformation(extent = {{88, -8}, {108, 12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodflowOutflow annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure annotation(Placement(transformation(extent = {{-78, 48}, {-38, 88}}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 270, origin = {-1, 35})));
      Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{38, -46}, {10, -24}})));
      Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-50, -44}, {-74, -24}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0014) annotation(Placement(transformation(extent = {{-34, -48}, {-6, -20}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00176) annotation(Placement(transformation(extent = {{46, -48}, {72, -22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RRAIN(k(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation(Placement(transformation(extent = {{-88, 4}, {-74, 14}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHV(k(displayUnit = "(mmHg.s)/ml") = 11999014.86735) annotation(Placement(transformation(extent = {{6, -4}, {18, 4}})));
      Physiolibrary.Types.Constants.PressureConst Pext(k = 0) annotation(Placement(transformation(extent = {{46, 28}, {56, 36}})));
      Physiolibrary.Types.Constants.VolumeConst VITHVU(k = 0.00119) annotation(Placement(transformation(extent = {{-60, 16}, {-48, 24}})));
      Physiolibrary.Types.Constants.VolumeConst VETHVU(k = 0.001) annotation(Placement(transformation(extent = {{34, -10}, {46, -2}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EITHV(k = 2426467.450953) annotation(Placement(transformation(extent = {{-38, 30}, {-26, 38}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EETHV(k = 2253148.3473135) annotation(Placement(transformation(extent = {{34, 8}, {44, 16}})));
    equation
      connect(bloodflowOutflow, CentralVenousResistance.q_out) annotation(Line(points = {{-100, 0}, {-88, 0}, {-88, -34}, {-74, -34}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in) annotation(Line(points = {{-50, -34}, {-20, -34}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(IntraThoracicVeins.q_in, VeinsResistance.q_out) annotation(Line(points = {{-20, -34}, {-6, -34}, {-6, -35}, {10, -35}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in) annotation(Line(points = {{38, -35}, {59, -35}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(ExtrathoracicVeins.q_in, bloodFlowInflow) annotation(Line(points = {{59, -35}, {78.5, -35}, {78.5, 2}, {98, 2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(RRAIN.y, CentralVenousResistance.cond) annotation(Line(points = {{-72.25, 9}, {-62, 9}, {-62, -28}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RETHV.y, VeinsResistance.cond) annotation(Line(points = {{19.5, 0}, {24, 0}, {24, -28.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(intrathoracicPressure, IntraThoracicVeins.externalPressure) annotation(Line(points = {{-58, 68}, {-58, 68}, {-12, 68}, {10, 68}, {10, 28}, {-8.800000000000001, 28}, {-8.800000000000001, -22.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Pext.y, ExtrathoracicVeins.externalPressure) annotation(Line(points = {{57.25, 32}, {70, 32}, {70, -18}, {70, -24}, {69.40000000000001, -24}, {69.40000000000001, -24.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VITHVU.y, IntraThoracicVeins.zeroPressureVolume) annotation(Line(points = {{-46.5, 20}, {-42, 20}, {-42, -22.8}, {-31.2, -22.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VETHVU.y, ExtrathoracicVeins.zeroPressureVolume) annotation(Line(points = {{47.5, -6}, {46, -6}, {46, -24.6}, {48.6, -24.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EITHV.y, IntraThoracicVeins.compliance) annotation(Line(points = {{-24.5, 34}, {-20, 34}, {-20, -20}, {-20, -22}, {-20, -22.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EETHV.y, ExtrathoracicVeins.compliance) annotation(Line(points = {{45.25, 12}, {58, 12}, {58, -24.6}, {59, -24.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(lineColor=  {0, 0, 127}, fillColor=  {255, 170, 213},
                fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent=  {{-100, 22}, {100, -28}}), Text(fillColor=  {255, 170, 213},
                fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent=  {{4, 36}, {198, 22}}, textString=  "IntraThoracic pressure"), Text(lineColor=  {0, 0, 255}, fillColor=  {255, 170, 213},
                fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent=  {{-163.443, -33.4448}, {170.927, -54.6458}}, textString=  "%name"), Text(lineColor=  {0, 0, 255}, fillColor=  {255, 85, 85},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-154, -14}, {-39.5145, -24.748}}, textString=  "bloodflow outflow
       ")}));
    end SystemicVeins;

    model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Types.RealIO.PressureInput PTH annotation (Placement(
            transformation(extent={{-78,48},{-38,88}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={1,61})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0001) annotation(Placement(transformation(extent = {{-74, -14}, {-48, 12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryArteriesResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{-36, -13}, {-2, 13}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.0005999999999999999) annotation(Placement(transformation(extent = {{10, -12}, {34, 12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(useConductanceInput = true) annotation(Placement(transformation(extent = {{46, -12}, {76, 12}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPP(k(displayUnit = "(mmHg.s)/ml") = 14665462.61565) annotation(Placement(transformation(extent = {{-46, 36}, {-32, 46}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RLAIN(k(displayUnit = "(mmHg.s)/ml") = 399967.162245) annotation(Placement(transformation(extent = {{66, 32}, {80, 42}})));
      Physiolibrary.Types.Constants.VolumeConst VPAU(k = 5e-005) annotation(Placement(transformation(extent = {{-94, 32}, {-82, 40}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(k = 31064116.267695) annotation(Placement(transformation(extent = {{-88, 48}, {-76, 56}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(k = 6066168.6273825) annotation(Placement(transformation(extent = {{-2, 48}, {10, 56}})));
      Physiolibrary.Types.Constants.VolumeConst VPVU(k = 0.00035) annotation(Placement(transformation(extent = {{-6, 22}, {6, 30}})));
    equation
      connect(RPP.y, PulmonaryArteriesResistance.cond) annotation(Line(points = {{-30.25, 41}, {-30.25, 17.5}, {-19, 17.5}, {-19, 7.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RLAIN.y, PulmonaryVeinResistance.cond) annotation(Line(points = {{81.75, 37}, {81.75, 21.5}, {61, 21.5}, {61, 7.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VPAU.y, PulmonaryArteries.zeroPressureVolume) annotation(Line(points = {{-80.5, 36}, {-76, 36}, {-76, 9.4}, {-71.40000000000001, 9.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EPA.y, PulmonaryArteries.compliance) annotation(Line(points = {{-74.5, 52}, {-58, 52}, {-58, 9.4}, {-61, 9.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VPVU.y, PulmonaryVeins.zeroPressureVolume) annotation(Line(points = {{7.5, 26}, {10, 26}, {10, 9.6}, {12.4, 9.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(EPV.y, PulmonaryVeins.compliance) annotation(Line(points = {{11.5, 52}, {26, 52}, {26, 9.6}, {22, 9.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, PulmonaryArteries.externalPressure) annotation (Line(
          points={{-58,68},{-54,68},{-54,9.4},{-50.6,9.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(PTH, PulmonaryVeins.externalPressure) annotation (Line(
          points={{-58,68},{31.6,68},{31.6,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, PulmonaryArteries.q_in) annotation (Line(
          points={{-100,0},{-61,0},{-61,-1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in) annotation(Line(points = {{-61, -1}, {-48.5, -1}, {-48.5, 0}, {-36, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in) annotation(Line(points = {{-2, 0}, {10, 0}, {22, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in) annotation(Line(points = {{22, 0}, {34, 0}, {46, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(PulmonaryVeinResistance.q_out, outflow) annotation (Line(
          points={{76,2.22045e-016},{88,2.22045e-016},{88,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(extent={{-100,
                -100},{100,100}},                                                                                                    preserveAspectRatio=false,   initialScale = 0.1, grid = {2, 2}), graphics={  Text(lineColor=  {0, 0, 255}, fillColor=  {255, 170, 213},
                fillPattern=                                                                                                    FillPattern.HorizontalCylinder, extent=  {{141.71, -42.374}, {-146.123, -72.1417}}, textString=  "%name"), Text(lineColor=  {255, 0, 0}, fillColor=  {0, 0, 255},
                fillPattern=                                                                                                    FillPattern.Solid, extent={{
                  72,36},{-70,48}},                                                                                                    textString=  "IntraThoracic pressure")}));
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
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent=  {{-96, 94}, {98, -94}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255, 255, 170}), Rectangle(extent=  {{-78, 32}, {-70, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Rectangle(extent=  {{-60, 32}, {-52, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Rectangle(extent=  {{0, 32}, {8, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Rectangle(extent=  {{44, 32}, {52, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Rectangle(extent=  {{-88, 32}, {-80, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Rectangle(extent=  {{-40, 32}, {-32, -80}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}), Text(extent=  {{52, 70}, {-94, 94}}, lineColor=  {0, 0, 127},
                fillPattern=                                                                                                    FillPattern.Sphere, fillColor=  {255, 85, 85}, textString=  "Heart Intervals"), Text(extent=  {{58, 106}, {98, 68}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{54, 46}, {94, 8}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tav"), Text(extent=  {{54, 2}, {94, -36}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tvs"), Text(extent=  {{56, -64}, {96, -102}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{-130, 46}, {-100, 12}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "HR")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HeartIntervals;

    model AtrialElastance
      Physiolibrary.Types.RealIO.TimeInput Tas annotation(Placement(transformation(extent = {{-140, 22}, {-100, 62}}), iconTransformation(extent = {{-140, 22}, {-100, 62}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-140, -80}, {-100, -40}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceOutput Et
        "elasticity (torr/ml)"                                                               annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -20}, {138, 18}})));
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
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-100, 100}, {100, -100}}, pattern=  LinePattern.None,
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, lineColor=  {0, 0, 255}), Text(extent=  {{-98, 98}, {98, 40}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Atrial elastance"), Line(points=  {{-78, -34}, {-76, -26}, {-70, -14}, {-58, 6}, {-36, 36}, {-14, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color=  {0, 0, 255}, smooth=  Smooth.Bezier), Text(extent=  {{-220, -102}, {200, -120}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name"), Text(extent=  {{-104, 46}, {-64, 38}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{-110, -56}, {-58, -64}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{72, 4}, {102, -8}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Et")}));
    end AtrialElastance;

    model VentricularElastance
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-138, 54}, {-98, 94}}), iconTransformation(extent = {{-138, 54}, {-98, 94}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-138, -100}, {-98, -60}}), iconTransformation(extent = {{-138, -100}, {-98, -60}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceOutput Et
        "ventricular elasticity (torr/ml)"                                                               annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, 4}, {138, 42}})));
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
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-100, 100}, {100, -100}}, pattern=  LinePattern.None,
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, lineColor=  {0, 0, 255}), Text(extent=  {{-82, 82}, {80, 24}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Ventricular elastance"), Line(points=  {{-72, -34}, {-68, -26}, {-62, -14}, {-52, 4}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color=  {0, 0, 255}, smooth=  Smooth.Bezier), Text(extent=  {{-220, -102}, {200, -120}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name"), Text(extent=  {{-96, 82}, {-76, 66}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{-92, 26}, {-76, 6}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tav"), Text(extent=  {{-94, -18}, {-78, -38}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tvs"), Text(extent=  {{-96, -74}, {-82, -86}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{72, 36}, {88, 14}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Et"), Text(extent=  {{96, -32}, {68, -8}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Et0"), Text(extent=  {{42, -72}, {88, -84}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Heart interval")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
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
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve ventricleArteryValve annotation(Placement(transformation(extent = {{64, -30}, {88, -54}})));
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
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-10, 58}, {-2, 66}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve atrioVentricleValve annotation(Placement(visible = true, transformation(origin = {7, -42}, extent = {{-13, 12}, {13, -12}}, rotation = 0)));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(visible = true, transformation(origin = {3, 39}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {-34, 106}, extent = {{-14, -14}, {14, 14}}, rotation = 270)));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(visible = true, transformation(origin = {100, 48}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
    equation
      connect(hydrauliccompliance.y, ventricle.compliance) annotation(Line(points = {{100, 43}, {100, 18.5654}, {42.7567, 18.5654}, {42.7567, -31}, {43, -31}}, smooth = Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance) annotation(Line(points = {{86.56, 56.91}, {94, 56.91}, {99.90000000000001, 55.9}, {99.90000000000001, 52.1}}, color = {0, 0, 127}));
      connect(Tvs, ventricularElastance.Tvs) annotation(Line(points = {{3, 39}, {16, 39}, {16, 48.58}, {29.68, 48.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(atrioVentricleValve.bloodFlowOutflow, ventricle.q_in) annotation(Line(points = {{20, -42}, {30, -42}, {30, -43}, {43, -43}}, thickness = 1, smooth = Smooth.Bezier));
      connect(atrium.q_in, atrioVentricleValve.bloodFlowInflow) annotation(Line(points = {{-34, -44}, {-22, -44}, {-5.74, -41.8}, {-5.74, -41.76}}, thickness = 1, smooth = Smooth.Bezier));
      connect(CxABackflow.y, atrioVentricleValve.inflowConductance) annotation(Line(points = {{-9, -80}, {-8, -80}, {-2.62, -49.6}, {-2.62, -51.12}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(RxAOutflow.y, atrioVentricleValve.outflowResistance) annotation(Line(points = {{5, -88}, {12, -88}, {13.76, -50.8}, {13.76, -52.56}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(CxVBackflow.y, ventricleArteryValve.inflowConductance) annotation(Line(points = {{63, -78}, {67.12, -78}, {67.12, -51.12}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation(Line(points = {{-98, 56}, {-74, 56}, {-74, 68.72}, {-67.8, 68.72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(ventricleArteryValve.outflowResistance, RxVOutflow.y) annotation(Line(points = {{82.23999999999999, -52.56}, {82, -52.56}, {82, -82}, {83, -82}}, color = {0, 0, 127}, smooth = Smooth.None));
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
      connect(ventricle.q_in, ventricleArteryValve.bloodFlowInflow) annotation(Line(points = {{43, -43}, {54.5, -43}, {54.5, -41.76}, {64.23999999999999, -41.76}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(ventricleArteryValve.bloodFlowOutflow, outflow) annotation(Line(points = {{88, -42}, {92, -42}, {92, 0}, {94, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{-70, 90}, {-56, 78}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{-42, 94}, {-26, 74}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tvs"), Text(extent=  {{-14, 94}, {2, 74}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tav"), Text(extent=  {{14, 92}, {34, 76}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{12, -82}, {38, -104}}, lineColor=  {0, 0, 255}, textString=  "PTH")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end SideOfHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      extends SideOfHeart(VxAU(k = 3e-005), VxVU(k = 6e-005), RxAOutflow(k = 399967.162245), RxVOutflow(k = 1066579.09932), ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66), atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},
                {100,100}}),                                                                              graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end LeftHeart;

    model RightHeart
      extends Physiolibrary.Icons.RightHeart;
      extends SideOfHeart(atrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225), ventricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335), VxAU(k = 3e-005), RxAOutflow(k = 399967.162245), VxVU(k = 4e-005), RxVOutflow(k = 399967.162245), atrium(volume_start = 4e-005), ventricle(volume_start = 0.00013));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points=  {{32, 60}, {18, 64}, {6, 64}, {6, 76}, {18, 76}, {30, 72}, {44, 64}, {36, 58}, {32, 60}}, smooth=  Smooth.None,
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {58, 117, 175}, pattern=  LinePattern.None, lineColor=  {0, 0, 0})}));
    end RightHeart;

    model Heart "both sides of heart with heart interval control"

      LeftHeart       leftHeart annotation(Placement(transformation(extent={{0,-12},
                {36,24}})));
      RightHeart       rightHeart annotation(Placement(transformation(extent={{-32,-12},
                {6,26}})));
      HeartIntervals       heartIntervals annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={14,52})));
      Physiolibrary.Types.RealIO.PressureInput PTH annotation (Placement(
            transformation(extent={{-64,-42},{-24,-2}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={19,53})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (Placement(
            transformation(extent={{-60,40},{-20,80}}), iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-28,54})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-54,-2},{-34,18}}),
            iconTransformation(extent={{-44,-20},{-24,0}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-54,12},{-34,32}}),
            iconTransformation(extent={{-22,8},{-2,28}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{24,-4},{44,16}}),
            iconTransformation(extent={{18,-12},{38,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{26,14},{46,34}}),
            iconTransformation(extent={{8,10},{28,30}})));

    equation
      connect(heartRate, heartIntervals.HR) annotation (Line(
          points={{-40,60},{-16,60},{-16,62},{13.8,62},{13.8,62.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH, rightHeart.PTH) annotation (Line(
          points={{-44,-22},{-14.14,-22},{-14.14,-8.96}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH, leftHeart.PTH) annotation (Line(
          points={{-44,-22},{14.8,-22},{16.92,-9.12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-44,8},{-30,8},{-30,8.14},{-13.38,8.14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeartInflow, rightHeartInflow) annotation (Line(
          points={{-44,8},{-44,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-13,20.3},{-42,20.3},{-42,22},{-44,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.inflow, leftHeartInflow) annotation (Line(
          points={{17.64,7.08},{35.8,6.14},{35.8,6},{34,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, leftHeartOutflow) annotation (Line(
          points={{18,18.6},{36,18.3},{36,24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation (Line(
          points={{22.8,41},{22.8,33.5},{21.96,33.5},{21.96,25.08}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation (Line(
          points={{16.6,41.4},{16.6,33.7},{16.92,33.7},{16.92,25.08}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation (Line(
          points={{12.6,41.2},{12.6,33.6},{11.88,33.6},{11.88,25.08}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.T0, leftHeart.T0) annotation (Line(
          points={{5.2,41},{5.2,33.5},{6.84,33.5},{6.84,25.08}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.T0, rightHeart.T0) annotation (Line(
          points={{5.2,41},{-24.78,41},{-24.78,27.14}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation (Line(
          points={{12.6,41.2},{12.6,38},{-19.46,38},{-19.46,27.14}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation (Line(
          points={{16.6,41.4},{16.6,36},{-14.14,36},{-14.14,27.14}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation (Line(
          points={{22.8,41},{22.8,34},{-8.82,34},{-8.82,27.14}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,
                -60},{40,80}}), graphics={
            Text(
              extent={{-12,44},{46,26}},
              lineColor={0,0,255},
              textString="PTH"),
            Text(
              extent={{-64,42},{4,26}},
              lineColor={0,0,255},
              textString="HeartRate"),
            Bitmap(extent={{-6,22},{34,-48}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceLeva.png"),
            Bitmap(extent={{-34,18},{6,-48}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},
                {40,80}}), graphics));
    end Heart;

    model systemicCirculation
      extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{38,-8},{58,12}}),
            iconTransformation(extent={{86,-8},{106,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-94,-8},{-74,12}}),
            iconTransformation(extent={{-102,-8},{-82,12}})));
      SystemicVeins       systemicVeins(IntraThoracicVeins(volume_start=0.0014),   ExtrathoracicVeins(volume_start = 0.00176)) annotation(Placement(transformation(extent={{13.5,
                12.5},{-13.5,-12.5}},                                                                                                    rotation=180,  origin={-54.5,
                0.5})));
      SystemicArteries       systemicArteries(ExtrathoracicArteries(
            volume_start=0.00045),                                                           IntraThoracicArteries(volume_start = 0.0003)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=0,    origin={26,2})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RSP(k(displayUnit = "(mmHg.s)/ml") = 106657909.932) annotation(Placement(transformation(extent={{-30,6},
                {-22,14}})));
      SystemicPeripheralVessels systemicPeripheralVessels
        annotation (Placement(transformation(extent={{-22,-8},{-2,12}})));
      Physiolibrary.Types.RealIO.PressureInput PTH annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-72,16}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,80})));
    equation

      connect(systemicArteries.Outflow, systemicPeripheralVessels.bloodFlowInflow)
        annotation (Line(
          points={{16.2,2.2},{16.2,1.8},{-2,1.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicPeripheralVessels.bloodFlowOutflow, systemicVeins.bloodFlowInflow)
        annotation (Line(
          points={{-21.8,1.8},{-41.27,1.8},{-41.27,0.75}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(outflow, systemicVeins.bloodflowOutflow) annotation (Line(
          points={{-84,2},{-68,2},{-68,0.5}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicArteries.Inflow, inflow) annotation (Line(
          points={{35.8,1.8},{35.8,2},{48,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSP.y, systemicPeripheralVessels.hydraulicresistance) annotation (
         Line(
          points={{-21,10},{-13.6,10},{-13.6,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH, systemicVeins.intrathoracicPressure) annotation (Line(
          points={{-72,16},{-54.635,16},{-54.635,4.875}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PTH, systemicArteries.intrathoracicPressure) annotation (Line(
          points={{-72,16},{26,16},{26,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, inflow) annotation (Line(
          points={{48,2},{48,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{22,82},{66,68}},
              lineColor={0,0,255},
              textString="PTH"), Text(
              extent={{-96,-66},{100,-92}},
              lineColor={0,0,127},
              textString="%name")}));
    end systemicCirculation;
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
      connect(rightHeart.outflow, unlimitedVolume1.y) annotation(Line(points={{9,28.14},
              {30,28.14},{30,44},{44,44}},                                                                                     color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(unlimitedPump.q_out, rightHeart.inflow) annotation(Line(points={{-44,-40},
              {-1,-40},{-1,9.58}},                                                                                 color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
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
      connect(systemicVeins.bloodFlowInflow, systemicPeripheralVessels1.bloodFlowOutflow) annotation(Line(points={{-18.32,
              12.28},{-16,12.28},{-8.61,12.28},{-8.61,5.64}},                                                                                                    thickness = 1));
      connect(hydraulicresistance.y, systemicPeripheralVessels1.hydraulicresistance) annotation(Line(points = {{7, 38}, {7.38, 15.36}}, color = {0, 0, 127}));
      connect(systemicArteries.Outflow, systemicPeripheralVessels1.bloodFlowInflow) annotation(Line(points = {{38.52, 9.26}, {36, 9.26}, {30, 5.68}, {30, 5.64}}, thickness = 1, smooth = Smooth.Bezier));
      connect(frequency.y, heartIntervals.HR) annotation(Line(points = {{-85, 70}, {-76, 70}, {-76, 69.8}, {-74.8, 69.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation(Line(points = {{-79, 94}, {64, 94}, {64, 60}, {54, 60}, {54, 89}, {44.86, 89}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pressure.y, systemicArteries.intrathoracicPressure) annotation(Line(points = {{-79, 94}, {64, 94}, {64, 15.24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(heartIntervals.Tas, leftHeart.Tas) annotation(Line(points = {{-53, 78.8}, {-5.5, 78.8}, {-5.5, 80.5}, {41.92, 80.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation(Line(points = {{-53.4, 72.59999999999999}, {-4.7, 72.59999999999999}, {-4.7, 70.75}, {41.71, 70.75}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation(Line(points = {{-53.2, 68.59999999999999}, {-6.6, 68.59999999999999}, {-6.6, 61}, {41.08, 61}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation(Line(points = {{-53, 61.2}, {-44, 61.2}, {-44, 52}, {-2, 52}, {-2, 52.5}, {41.5, 52.5}}, color = {0, 0, 127}, smooth = Smooth.Bezier, pattern = LinePattern.Dash));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation(Line(points={{24.28,
              92},{24.28,96},{60,96},{60,98},{96,98},{96,8.74},{89.48,8.74}},                                                                                             color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(unlimitedPump.q_out, leftHeart.inflow) annotation(Line(points={{-76,28},
              {-24,28},{-24,73.5},{31,73.5}},                                                                                 color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(unlimitedVolume.y, systemicVeins.bloodflowOutflow) annotation(Line(points={{-60,6},
              {-58,6},{-58,12},{-50,12}},                                                                                                    color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
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
      connect(hydraulicresistance.y, systemicPeripheralVessels.hydraulicresistance) annotation(Line(points={{27,92},
              {48.4,92},{48.4,47.2}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
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
      connect(leftHeart.outflow, unlimitedVolume.y) annotation(Line(points={{24.28,
              92},{24.28,96},{102,96},{102,30},{96,30}},                                                                                   color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pulmonaryCirculation.bloodflowOutflow, leftHeart.inflow) annotation(Line(points = {{36, 109}, {36, 77}, {27.22, 77}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure) annotation(Line(points = {{-79, 94}, {-48, 94}, {-48, 120.59}, {23.13, 120.59}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow) annotation(Line(points = {{2.24, 94.78}, {2.24, 101.39}, {10, 101.39}, {10, 109}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(rightHeart.inflow, unlimitedPump.q_out) annotation(Line(points={{-12.04,
              73.66},{-10.13,73.66},{-10.13,28},{-76,28}},                                                                           color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
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
      Physiolibrary.Hydraulic.Components.Conductor conductor annotation(Placement(transformation(extent={{-6,60},
                {14,80}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins annotation(Placement(transformation(extent={{22,56},
                {42,76}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor1 annotation(Placement(transformation(extent={{48,42},
                {68,62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftAtrium annotation(Placement(transformation(extent={{60,26},
                {80,46}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve mitralValve annotation(Placement(transformation(extent = {{82, 24}, {102, 44}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle annotation(Placement(transformation(extent = {{94, -2}, {114, 18}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve aortalValve annotation(Placement(transformation(extent={{116,-22},
                {94,-2}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel aorta annotation(Placement(transformation(extent={{76,-44},
                {96,-24}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia annotation(Placement(transformation(extent={{72,-38},
                {52,-20}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor2 annotation(Placement(transformation(extent={{-9,-8},
                {9,8}},                                                                                                    rotation = 180, origin={41,-42})));
      Physiolibrary.Hydraulic.Components.ElasticVessel extraThoracicSystemicArteries annotation(Placement(transformation(extent={{16,-70},
                {36,-50}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor3 annotation(Placement(transformation(extent={{-8,-7},
                {8,7}},                                                                                                    rotation = 180, origin={4,-47})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicTissues annotation(Placement(transformation(extent={{-22,-76},
                {-2,-56}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor4 annotation(Placement(transformation(extent={{-9,-7},
                {9,7}},                                                                                                    rotation = 180, origin={-27,-49})));
      Physiolibrary.Hydraulic.Components.ElasticVessel extraThoracicSystemicVeins annotation(Placement(transformation(extent={{-56,-72},
                {-36,-52}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor5 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin={-68,-52})));
      Physiolibrary.Hydraulic.Components.ElasticVessel intrathoracicSystemicVeins annotation(Placement(transformation(extent={{-92,-38},
                {-72,-18}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor6 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-90, -16})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium annotation(Placement(transformation(extent = {{-114, -2}, {-94, 18}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve tricupsidValve annotation(Placement(transformation(extent = {{-112, 28}, {-92, 48}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle annotation(Placement(transformation(extent = {{-98, 54}, {-78, 74}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve pulmonaryValve annotation(Placement(transformation(extent={{-74,54},
                {-54,74}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries annotation(Placement(transformation(extent={{-42,58},
                {-22,78}})));
    equation
      connect(conductor.q_out, pulmonaryVeins.q_in) annotation(Line(points={{14,70},
              {24,70},{24,66},{32,66}},                                                                               color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryVeins.q_in, conductor1.q_in) annotation(Line(points={{32,66},
              {40,66},{40,52},{48,52}},                                                                                color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor1.q_out, leftAtrium.q_in) annotation(Line(points={{68,52},
              {68,36},{70,36}},                                                                           color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(leftAtrium.q_in, mitralValve.bloodFlowInflow) annotation(Line(points={{70,36},
              {76,36},{76,33.8},{82.2,33.8}},                                                                                        color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(mitralValve.bloodFlowOutflow, leftVentricle.q_in) annotation(Line(points = {{102, 34}, {104, 34}, {104, 8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(leftVentricle.q_in, aortalValve.bloodFlowInflow) annotation(Line(points={{104,8},
              {112,8},{112,4},{122,4},{122,-12.2},{115.78,-12.2}},                                                                                               color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(aortalValve.bloodFlowOutflow, aorta.q_in) annotation(Line(points={{94,-12},
              {90,-12},{90,-34},{86,-34}},                                                                                     color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(aorta.q_in, inertia.q_in) annotation(Line(points={{86,-34},{84,
              -34},{84,-29},{72,-29}},                                                                         color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(inertia.q_out, conductor2.q_in) annotation(Line(points={{52,-29},
              {56,-29},{56,-34},{54,-34},{54,-38},{52,-38},{52,-42},{50,-42}},                                                                                   color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor2.q_out, extraThoracicSystemicArteries.q_in) annotation(Line(points={{32,-42},
              {42,-42},{42,-60},{26,-60}},                                                                                                 color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(extraThoracicSystemicArteries.q_in, conductor3.q_in) annotation(Line(points={{26,-60},
              {12,-60},{12,-47}},                                                                                              color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor3.q_out, systemicTissues.q_in) annotation(Line(points={{-4,-47},
              {-4,-47},{-4,-66},{-12,-66}},                                                                               color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(systemicTissues.q_in, conductor4.q_in) annotation(Line(points={{-12,-66},
              {-18,-66},{-18,-49}},                                                                                color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor4.q_out, extraThoracicSystemicVeins.q_in) annotation(Line(points={{-36,-49},
              {-46,-49},{-46,-62}},                                                                                             color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(extraThoracicSystemicVeins.q_in, conductor5.q_in) annotation(Line(points={{-46,-62},
              {-58,-62},{-58,-52}},                                                                                                    color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor5.q_out, intrathoracicSystemicVeins.q_in) annotation(Line(points={{-78,-52},
              {-82,-52},{-82,-28}},                                                                                             color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(rightAtrium.q_in, tricupsidValve.bloodFlowInflow) annotation(Line(points = {{-104, 8}, {-112, 8}, {-112, 37.8}, {-111.8, 37.8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(tricupsidValve.bloodFlowOutflow, rightVentricle.q_in) annotation(Line(points = {{-92, 38}, {-90, 38}, {-90, 64}, {-88, 64}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(rightVentricle.q_in, pulmonaryValve.bloodFlowInflow) annotation(Line(points={{-88,64},
              {-78,64},{-78,63.8},{-73.8,63.8}},                                                                                                color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryValve.bloodFlowOutflow, pulmonaryArteries.q_in) annotation(Line(points={{-54,64},
              {-46,64},{-46,68},{-32,68}},                                                                                                    color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonaryArteries.q_in, conductor.q_in) annotation(Line(points={{-32,68},
              {-20,68},{-20,70},{-6,70}},                                                                                    color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(intrathoracicSystemicVeins.q_in, conductor6.q_in) annotation(Line(points={{-82,-28},
              {-82,-16},{-80,-16}},                                                                                            color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(conductor6.q_out, rightAtrium.q_in) annotation(Line(points = {{-100, -16}, {-100, -16}, {-100, 8}, {-104, 8}}, color = {190, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(extent = {{-120, -120}, {140, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent={{-120,
                -120},{140,120}},                                                                                                    preserveAspectRatio=false,   initialScale = 0.1, grid = {2, 2}), graphics));
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
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k=1.1666666666667)
                                                                      annotation(Placement(transformation(extent = {{-20, 58}, {-12, 66}})));
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
  end Test;

  package OldParts
    model RightHeart
      extends Physiolibrary.Icons.RightHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}}), iconTransformation(extent = {{-34, -8}, {-14, 12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{84, -10}, {104, 10}}), iconTransformation(extent = {{6, 56}, {26, 76}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-16, 6}), iconTransformation(extent = {{-100, 52}, {-60, 92}})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-118, 36}, {-78, 76}}), iconTransformation(extent = {{-110, 22}, {-78, 54}})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay" annotation(Placement(transformation(extent = {{-6, 44}, {18, 68}}), iconTransformation(extent = {{-110, -16}, {-80, 14}})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(transformation(extent = {{-4, 26}, {16, 46}}), iconTransformation(extent = {{-112, -54}, {-84, -26}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-120, 10}, {-80, 50}}), iconTransformation(extent = {{-110, -88}, {-82, -60}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel RightAtrium(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 4e-005) annotation(Placement(transformation(extent = {{-50, -60}, {-18, -28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel RightVentricle(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00013) annotation(Placement(transformation(extent = {{32, -54}, {58, -28}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve tripupsidValve annotation(Placement(transformation(extent = {{-8, -32}, {14, -52}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve pulmonicValve annotation(Placement(transformation(extent = {{64, -30}, {88, -54}})));
      Parts.AtrialElastance atrialElastance(EMIN = 6666119.37075, EMAX = 19998358.11225) annotation(Placement(transformation(extent = {{-64, 46}, {-26, 78}})));
      Parts.VentricularElastance ventricularElastance(EMIN = 7599376.082655, EMAX = 65327969.83335) annotation(Placement(transformation(extent = {{34, 36}, {82, 70}})));
      Physiolibrary.Types.Constants.VolumeConst VRAU(k = 3e-005) annotation(Placement(transformation(extent = {{-64, -18}, {-56, -10}})));
      Physiolibrary.Types.Constants.VolumeConst VRVU(k = 4e-005) annotation(Placement(transformation(extent = {{16, -14}, {24, -6}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRABackflow(k = 0)
        "conductance of tricupsid valve backflow"                                                                          annotation(Placement(transformation(extent = {{-18, -84}, {-10, -76}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRVBackflow(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 0, origin = {58, -80})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RRAOutflow(k(displayUnit = "(mmHg.s)/ml") = 399967.162245)
        "resistance of tricupsid valve"                                                                                                     annotation(Placement(transformation(extent = {{-4, -92}, {4, -84}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RRVOutflow(k(displayUnit = "(mmHg.s)/ml") = 399967.162245)
        "resistance of pulmonic valve"                                                                                                     annotation(Placement(transformation(extent = {{74, -86}, {82, -78}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(transformation(extent = {{102, 52}, {110, 60}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-10, 58}, {-2, 66}})));
    equation
      connect(CRVBackflow.y, pulmonicValve.inflowConductance) annotation(Line(points = {{63, -80}, {67.12, -80}, {67.12, -51.12}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation(Line(points = {{-98, 56}, {-74, 56}, {-74, 68.72}, {-67.8, 68.72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pulmonicValve.outflowResistance, RRVOutflow.y) annotation(Line(points = {{82.23999999999999, -52.56}, {82, -52.56}, {82, -82}, {83, -82}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(RRAOutflow.y, tripupsidValve.outflowResistance) annotation(Line(points = {{5, -88}, {12, -88}, {12, -50.8}, {8.720000000000001, -50.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(CRABackflow.y, tripupsidValve.inflowConductance) annotation(Line(points = {{-9, -80}, {-8, -80}, {-8, -49.6}, {-5.14, -49.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VRAU.y, RightAtrium.zeroPressureVolume) annotation(Line(points = {{-55, -14}, {-50, -14}, {-50, -31.2}, {-46.8, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VRVU.y, RightVentricle.zeroPressureVolume) annotation(Line(points = {{25, -10}, {30, -10}, {30, -30.6}, {34.6, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, atrialElastance.T0) annotation(Line(points = {{-100, 30}, {-74, 30}, {-74, 52.4}, {-67.8, 52.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, inflow) annotation(Line(points = {{-96, 0}, {-96, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation(Line(points = {{6, 56}, {6, 56}, {6, 56.4}, {29.68, 56.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, RightAtrium.externalPressure) annotation(Line(points = {{-16, 6}, {-18, 6}, {-18, -31.2}, {-21.2, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, RightVentricle.externalPressure) annotation(Line(points = {{-16, 6}, {55.4, 6}, {55.4, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation(Line(points = {{-100, 30}, {-80, 30}, {-80, 8}, {-14, 8}, {-14, 24}, {29.68, 24}, {29.68, 39.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance) annotation(Line(points = {{86.56, 56.91}, {94, 56.91}, {94, 55.9}, {101.9, 55.9}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(hydrauliccompliance.y, RightVentricle.compliance) annotation(Line(points = {{111, 56}, {120, 56}, {120, 54}, {120, 24}, {45, 24}, {45, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance) annotation(Line(points = {{-22.39, 61.84}, {-16.195, 61.84}, {-16.195, 61.9}, {-10.1, 61.9}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydrauliccompliance1.y, RightAtrium.compliance) annotation(Line(points = {{-1, 62}, {0, 62}, {0, 36}, {-34, 36}, {-34, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tvs, ventricularElastance.Tvs) annotation(Line(points = {{6, 36}, {16, 36}, {16, 48.58}, {29.68, 48.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation(Line(points = {{-98, 56}, {-80, 56}, {-80, 88}, {12, 88}, {12, 65.58}, {29.68, 65.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, RightAtrium.q_in) annotation(Line(points = {{-96, 0}, {-86, 0}, {-86, -48}, {-34, -48}, {-34, -44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(RightAtrium.q_in, tripupsidValve.bloodFlowInflow) annotation(Line(points = {{-34, -44}, {-22, -44}, {-22, -41.8}, {-7.78, -41.8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(tripupsidValve.bloodFlowOutflow, RightVentricle.q_in) annotation(Line(points = {{14, -42}, {45, -42}, {45, -41}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(RightVentricle.q_in, pulmonicValve.bloodFlowInflow) annotation(Line(points = {{45, -41}, {54.5, -41}, {54.5, -41.76}, {64.23999999999999, -41.76}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonicValve.bloodFlowOutflow, outflow) annotation(Line(points = {{88, -42}, {92, -42}, {92, 0}, {94, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{-74, -70}, {-60, -82}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{-76, -30}, {-60, -50}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tvs"), Text(extent=  {{-74, 8}, {-58, -12}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tav"), Text(extent=  {{-76, 42}, {-56, 26}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{-48, 82}, {-22, 60}}, lineColor=  {0, 0, 255}, textString=  "PTH")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end RightHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}}), iconTransformation(extent = {{-10, 0}, {10, 20}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation(Placement(transformation(extent = {{84, -10}, {104, 10}}), iconTransformation(extent = {{-42, 74}, {-22, 94}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-16, 6}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {66, 72})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole" annotation(Placement(transformation(extent = {{-118, 36}, {-78, 76}}), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 180, origin = {52, 38})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay" annotation(Placement(transformation(extent = {{-6, 44}, {18, 68}}), iconTransformation(extent = {{-15, -15}, {15, 15}}, rotation = 180, origin = {51, -1})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(transformation(extent = {{-4, 26}, {16, 46}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin = {48, -40})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation(Placement(transformation(extent = {{-120, 10}, {-80, 50}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin = {50, -74})));
      Physiolibrary.Hydraulic.Components.ElasticVessel LeftAtrium(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 4e-005) annotation(Placement(transformation(extent = {{-50, -60}, {-18, -28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel LeftVentricle(useV0Input = true, useComplianceInput = true, useExternalPressureInput = true, volume_start = 0.00013) annotation(Placement(transformation(extent = {{32, -54}, {58, -28}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve tripupsidValve annotation(Placement(transformation(extent = {{-6, -32}, {16, -52}})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve pulmonicValve annotation(Placement(transformation(extent = {{64, -30}, {88, -54}})));
      Parts.AtrialElastance atrialElastance(EMIN = 15998686.4898, EMAX = 37330268.4762) annotation(Placement(transformation(extent = {{-64, 46}, {-26, 78}})));
      Parts.VentricularElastance ventricularElastance(EMIN = 11999014.86735, EMAX = 533289549.66) annotation(Placement(transformation(extent = {{34, 36}, {82, 70}})));
      Physiolibrary.Types.Constants.VolumeConst VLAU(k = 3e-005) annotation(Placement(transformation(extent = {{-64, -18}, {-56, -10}})));
      Physiolibrary.Types.Constants.VolumeConst VLVU(k = 6e-005) annotation(Placement(transformation(extent = {{16, -14}, {24, -6}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CLABackflow(k = 0)
        "conductance of tricupsid valve backflow"                                                                          annotation(Placement(transformation(extent = {{-18, -84}, {-10, -76}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CLVBackflow(k = 0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 0, origin = {58, -78})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RLAOutflow(k(displayUnit = "(mmHg.s)/ml") = 399967.162245)
        "resistance of tricupsid valve"                                                                                                     annotation(Placement(transformation(extent = {{-4, -92}, {4, -84}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RLVOutflow(k(displayUnit = "(mmHg.s)/ml") = 1066579.09932)
        "resistance of pulmonic valve"                                                                                                     annotation(Placement(transformation(extent = {{74, -86}, {82, -78}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance annotation(Placement(transformation(extent = {{102, 52}, {110, 60}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance hydrauliccompliance1 annotation(Placement(transformation(extent = {{-10, 58}, {-2, 66}})));
    equation
      connect(CLVBackflow.y, pulmonicValve.inflowConductance) annotation(Line(points = {{63, -78}, {67.12, -78}, {67.12, -51.12}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation(Line(points = {{-98, 56}, {-74, 56}, {-74, 68.72}, {-67.8, 68.72}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pulmonicValve.outflowResistance, RLVOutflow.y) annotation(Line(points = {{82.23999999999999, -52.56}, {82, -52.56}, {82, -82}, {83, -82}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(RLAOutflow.y, tripupsidValve.outflowResistance) annotation(Line(points = {{5, -88}, {12, -88}, {12, -50.8}, {10.72, -50.8}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(CLABackflow.y, tripupsidValve.inflowConductance) annotation(Line(points = {{-9, -80}, {-8, -80}, {-8, -49.6}, {-3.14, -49.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VLAU.y, LeftAtrium.zeroPressureVolume) annotation(Line(points = {{-55, -14}, {-50, -14}, {-50, -31.2}, {-46.8, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(VLVU.y, LeftVentricle.zeroPressureVolume) annotation(Line(points = {{25, -10}, {30, -10}, {30, -30.6}, {34.6, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, atrialElastance.T0) annotation(Line(points = {{-100, 30}, {-74, 30}, {-74, 52.4}, {-67.8, 52.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, inflow) annotation(Line(points = {{-96, 0}, {-96, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation(Line(points = {{6, 56}, {6, 56}, {6, 56.4}, {29.68, 56.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, LeftAtrium.externalPressure) annotation(Line(points = {{-16, 6}, {-18, 6}, {-18, -31.2}, {-21.2, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(PTH, LeftVentricle.externalPressure) annotation(Line(points = {{-16, 6}, {55.4, 6}, {55.4, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation(Line(points = {{-100, 30}, {-80, 30}, {-80, 8}, {-14, 8}, {-14, 24}, {29.68, 24}, {29.68, 39.4}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance) annotation(Line(points = {{86.56, 56.91}, {94, 56.91}, {94, 55.9}, {101.9, 55.9}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(hydrauliccompliance.y, LeftVentricle.compliance) annotation(Line(points = {{111, 56}, {120, 56}, {120, 54}, {120, 24}, {45, 24}, {45, -30.6}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance) annotation(Line(points = {{-22.39, 61.84}, {-16.195, 61.84}, {-16.195, 61.9}, {-10.1, 61.9}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(hydrauliccompliance1.y, LeftAtrium.compliance) annotation(Line(points = {{-1, 62}, {0, 62}, {0, 36}, {-34, 36}, {-34, -31.2}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tvs, ventricularElastance.Tvs) annotation(Line(points = {{6, 36}, {16, 36}, {16, 48.58}, {29.68, 48.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation(Line(points = {{-98, 56}, {-80, 56}, {-80, 88}, {12, 88}, {12, 65.58}, {29.68, 65.58}}, color = {0, 0, 127}, smooth = Smooth.Bezier));
      connect(inflow, LeftAtrium.q_in) annotation(Line(points = {{-96, 0}, {-86, 0}, {-86, -48}, {-34, -48}, {-34, -44}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(LeftAtrium.q_in, tripupsidValve.bloodFlowInflow) annotation(Line(points = {{-34, -44}, {-22, -44}, {-22, -41.8}, {-5.78, -41.8}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(tripupsidValve.bloodFlowOutflow, LeftVentricle.q_in) annotation(Line(points = {{16, -42}, {45, -42}, {45, -41}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(LeftVentricle.q_in, pulmonicValve.bloodFlowInflow) annotation(Line(points = {{45, -41}, {54.5, -41}, {54.5, -41.76}, {64.23999999999999, -41.76}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      connect(pulmonicValve.bloodFlowOutflow, outflow) annotation(Line(points = {{88, -42}, {92, -42}, {92, 0}, {94, 0}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.Bezier));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{12, -68}, {26, -80}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "T0"), Text(extent=  {{10, -30}, {26, -50}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tvs"), Text(extent=  {{10, 10}, {26, -10}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tav"), Text(extent=  {{12, 42}, {32, 26}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                fillPattern=                                                                                                    FillPattern.Solid, textString=  "Tas"), Text(extent=  {{4, 90}, {30, 68}}, lineColor=  {0, 0, 255}, textString=  "PTH")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end LeftHeart;
  end OldParts;

  package Models

    model Hemodynamics "model of hemodynamics - decomposed to submodels"
      replaceable Parts.PulmonaryCirculation pulmonaryCirculation annotation(Placement(transformation(extent={{-2,70},
                {18,90}})));
      Physiolibrary.Types.Constants.PressureConst Pth(k = -533.28954966) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation=0,     origin={-26,68})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k=1.1666666666667) annotation(Placement(transformation(extent={{-20,58},
                {-12,66}})));
      replaceable Parts.Heart heart    annotation (Placement(transformation(extent={{0,36},{16,58}})));
      replaceable Parts.systemicCirculation systemicCirculation    annotation (Placement(transformation(extent={{-2,6},{18,26}})));
    equation
      connect(systemicCirculation.inflow, heart.leftHeartOutflow) annotation (Line(
          points={{17.6,16.2},{26,16.2},{26,48.5714},{12.48,48.5714}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(heart.leftHeartInflow, pulmonaryCirculation.outflow)
        annotation (Line(
          points={{14.08,45.1143},{26,45.1143},{26,80},{18,80}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (Line(
          points={{-1.2,16.2},{-10,16.2},{-10,43.8571},{4.16,43.8571}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(HeartRate.y, heart.heartRate) annotation (Line(
          points={{-11,62},{5.12,62},{5.12,53.9143}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dot));
      connect(systemicCirculation.PTH, Pth.y) annotation (Line(
          points={{8,24},{8,32},{-21,32},{-21,68}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heart.PTH, Pth.y) annotation (Line(
          points={{12.64,53.7571},{12.64,68},{-21,68}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(pulmonaryCirculation.PTH, Pth.y) annotation (Line(
          points={{8.1,86.1},{8.1,86},{-21,86},{-21,68}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation (
          Line(
          points={{7.68,48.2571},{-8,48.2571},{-8,80},{-2,80}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-40,-20},
                {60,100}}),                                                                                  graphics), Icon(
            coordinateSystem(extent={{-40,-20},{60,100}}, preserveAspectRatio=false),
            graphics={Bitmap(extent={{-14,76},{46,2}},  fileName="modelica://PhysiolibraryExtension/Resources/Icons/cvsconcept.png")}));
    end Hemodynamics;
  end Models;

  package Experiment
    model AorticStenosis "Hemodynamics in congenital aortic stenosis "
      extends Models.Hemodynamics(heart(leftHeart(
            RxVOutflow(k=106657909.932),
            ventricularElastance(EMIN=199983581.1225),
            VxVU(k=0))), systemicCirculation(systemicArteries(RETHA(k=
                  106657909.932))));
      annotation (Documentation(info="<html>
<p>Congenital aortic stenosis may&nbsp;be&nbsp;caused&nbsp;by&nbsp;a&nbsp;spectrum&nbsp;of&nbsp;lesions&nbsp;that&nbsp;obstruct&nbsp;blood&nbsp;flow&nbsp;from the&nbsp;left&nbsp;ventricle&nbsp;to&nbsp;the&nbsp;aorta.&nbsp;Inclusion&nbsp;in&nbsp;an&nbsp;educational&nbsp;simulation&nbsp;is&nbsp;relevant&nbsp;for&nbsp;the&nbsp;training &nbsp;in&nbsp;recognition&nbsp;of&nbsp;and&nbsp;possible&nbsp;therapeutic&nbsp;interventions&nbsp;on&nbsp;an&nbsp;infant&nbsp;with&nbsp;this&nbsp;condition.&nbsp; Three&nbsp;parameter&nbsp;changes&nbsp;were&nbsp;made&nbsp;to&nbsp;the&nbsp;model.&nbsp;The&nbsp;aortic&nbsp;valve&nbsp;and&nbsp;intrathoracic&nbsp;artery &nbsp;resistance&nbsp;(Appendix&nbsp;2)&nbsp;was&nbsp;increased&nbsp;from&nbsp;0.016&nbsp;to&nbsp;0.8&nbsp;mm&nbsp;Hg&nbsp;&middot;&nbsp;mL&minus;1&nbsp;&middot;&nbsp;s.&nbsp;On&nbsp;the&nbsp;basis&nbsp;of&nbsp;a&nbsp;left&nbsp;ventricular&nbsp;pressure&nbsp;volume&nbsp;curve&nbsp;given&nbsp;by&nbsp;Graham&nbsp;and&nbsp;Jarmakani&nbsp;(12),&nbsp;we&nbsp;changed&nbsp;the&nbsp;left&nbsp; ventricular&nbsp;filling&nbsp;characteristics&nbsp;by&nbsp;increasing&nbsp;the&nbsp;diastolic&nbsp;elastance&nbsp;of&nbsp;the&nbsp;left&nbsp;ventricle &nbsp;from&nbsp;0.55&nbsp;to&nbsp;1.5&nbsp;mm&nbsp;Hg/mL&nbsp;while&nbsp;reducing&nbsp;the&nbsp;unstressed&nbsp;volume&nbsp;from&nbsp;2&nbsp;to&nbsp;0&nbsp;mL.&nbsp;This&nbsp;is&nbsp;thought&nbsp;to&nbsp;reflect&nbsp;the&nbsp;reduced&nbsp;compliance&nbsp;and&nbsp;unstressed&nbsp;volume&nbsp;due&nbsp;to&nbsp;the&nbsp;increased&nbsp;cardiac&nbsp;muscle&nbsp;mass.&nbsp;</p>
<p><br>J.&nbsp;A.&nbsp;Goodwin,&nbsp;W.&nbsp;L.&nbsp;van&nbsp;Meurs,&nbsp;C.&nbsp;D.&nbsp;Sa&nbsp;Couto, J.&nbsp;E.&nbsp;W.&nbsp;Beneken,&nbsp;S.&nbsp;A.&nbsp;Graves,&nbsp;A&nbsp;model&nbsp;for&nbsp;educational simulation&nbsp;of&nbsp;infant&nbsp;cardiovascular&nbsp;physiology.,&nbsp;Anesthesia and&nbsp;analgesia&nbsp;99&nbsp;(6)&nbsp;(2004)&nbsp;1655-1664</p>
</html>"));
    end AorticStenosis;

    model Hemodynamics_Adult
      extends Models.Hemodynamics(
        Pth(k=-533.28954966),
        HeartRate(k=1.2),
        heart(leftHeart(
            RxAOutflow(k=399967.162245),
            RxVOutflow(k=1066579.09932),
            atrialElastance(EMIN=15998686.4898, EMAX=37330268.4762),
            VxAU(k=3e-05),
            ventricularElastance(EMIN=11999014.86735, EMAX=533289549.66),
            VxVU(k=6e-05)), rightHeart(
            atrialElastance(EMIN=6666119.37075, EMAX=19998358.11225),
            RxAOutflow(k=399967.162245),
            RxVOutflow(k=399967.162245),
            VxAU(k=3e-05),
            VxVU(k=4e-05),
            ventricularElastance(EMIN=7599376.082655, EMAX=65327969.83335))),
        systemicCirculation(
          RSP(k=133322387.415),
          systemicArteries(
            VITHAU(k=0.00014),
            EITHA(k=190651014.00345),
            inertia(I=93325.6711905),
            RETHA(k=7999343.2449),
            EETHA(k=74127247.40274),
            VETHAU(k=0.00037)),
          systemicVeins(
            RRAIN(k=399967.162245),
            RETHV(k=11999014.86735),
            VETHVU(k=0.001),
            EETHV(k=2253148.3473135),
            EITHV(k=2426467.450953),
            VITHVU(k=0.00119),
            ExtrathoracicVeins(volume_start=0.00146))),
        pulmonaryCirculation(
          EPA(k=31064116.267695),
          EPV(k=6066168.6273825),
          VPAU(k=5e-05),
          RPP(k=14665462.61565),
          VPVU(k=0.00035),
          RLAIN(k=399967.162245)));

      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(extent={{-7,-7},{7,7}},
            rotation=180,
            origin={-35,49}),                        iconTransformation(extent={{-34,40},
                {-14,60}})));
    equation
            volume = pulmonaryCirculation.volume+
            systemicCirculation.systemicVeins.IntraThoracicVeins.volume+
            systemicCirculation.systemicVeins.ExtrathoracicVeins.volume+
            systemicCirculation.systemicPeripheralVessels.BloodTissueElasticCompartment.volume+
            systemicCirculation.systemicArteries.ExtrathoracicArteries.volume+
            systemicCirculation.systemicArteries.IntraThoracicArteries.volume+
            heart.leftHeart.atrium.volume+
            heart.leftHeart.ventricle.volume+
            heart.rightHeart.atrium.volume+
            heart.rightHeart.ventricle.volume;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -40,-20},{60,100}}), graphics));
    end Hemodynamics_Adult;

    model Hemodynamics_with_catheter
      extends Models.Hemodynamics;

      Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
            transformation(extent={{-7,-7},{7,7}},
            rotation=180,
            origin={-27,49}),                        iconTransformation(extent={{-8,-8},
                {8,8}},
            rotation=180,
            origin={-22,52})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a catheter annotation (
          Placement(transformation(extent={{-32,22},{-16,38}}),
            iconTransformation(extent={{-34,20},{-16,38}})));
    equation
            volume = pulmonaryCirculation.PulmonaryArteries.volume+
            pulmonaryCirculation.PulmonaryVeins.volume+
            systemicCirculation.systemicVeins.IntraThoracicVeins.volume+
            systemicCirculation.systemicVeins.ExtrathoracicVeins.volume+
            systemicCirculation.systemicPeripheralVessels.BloodTissueElasticCompartment.volume+
            systemicCirculation.systemicArteries.ExtrathoracicArteries.volume+
            systemicCirculation.systemicArteries.IntraThoracicArteries.volume+
            heart.leftHeart.atrium.volume+
            heart.leftHeart.ventricle.volume+
            heart.rightHeart.atrium.volume+
            heart.rightHeart.ventricle.volume;
      connect(catheter, heart.rightHeartInflow) annotation (Line(
          points={{-24,30},{-10,30},{-10,43.8571},{4.16,43.8571}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,0},
                {40,100}}), graphics={Text(
              extent={{-20,54},{-6,44}},
              lineColor={0,0,127},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="=pulmonary.volume+
heart.volume+
systemic.volume")}), Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -40,0},{40,100}}), graphics={Line(
              points={{-18,32},{-12,38},{4,40},{2,40}},
              color={190,0,0},
              smooth=Smooth.Bezier,
              thickness=1)}));
    end Hemodynamics_with_catheter;

    model BloodTransfusionHemorrhage
      // Physiolibrary.Types.RealIO.VolumeFlowRateInput volumerate(start=0.00004);
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation (
          Placement(transformation(extent={{-4,-34},{16,-14}}), iconTransformation(
              extent={{56,-100},{76,-80}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput volumeflowrate annotation (
          Placement(transformation(extent={{-186,-80},{-146,-40}}),
            iconTransformation(extent={{-90,56},{-50,96}})));

    equation
        port_b.q = - volumeflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Rectangle(
              extent={{-54,36},{8,-30}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0},
              radius=4),
            Rectangle(
              extent={{-50,-28},{-46,-62}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0}),
            Rectangle(
              extent={{4,-26},{8,-62}},
              lineColor={0,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              fillColor={190,0,0}),
            Polygon(
              points={{-20,-30},{-20,-38},{-18,-40},{-14,-46},{-16,-48},{-14,-52},{-12,
                  -54},{-10,-56},{-12,-58},{-14,-62},{-12,-64},{-8,-66},{-6,-68},{-4,
                  -74},{-2,-76},{2,-80},{8,-82},{14,-86},{22,-90},{28,-92},{34,-94},
                  {38,-94},{54,-96},{62,-96},{62,-96},{60,-94},{54,-92},{48,-92},{38,
                  -90},{36,-90},{30,-86},{20,-84},{14,-80},{10,-78},{4,-76},{0,-70},
                  {-2,-68},{-4,-64},{-8,-60},{-4,-54},{-10,-50},{-10,-46},{-8,-44},{
                  -14,-38},{-16,-34},{-16,-30},{-20,-30}},
              lineColor={127,0,0},
              lineThickness=1,
              fillPattern=FillPattern.Sphere,
              smooth=Smooth.None,
              fillColor={190,0,0}),
            Rectangle(
              extent={{-54,62},{8,56}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={170,255,255}),
            Rectangle(
              extent={{-54,56},{8,32}},
              lineColor={0,0,0},
              fillColor={170,255,255},
              fillPattern=FillPattern.Sphere,
              radius=2,
              lineThickness=1)}),   Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end BloodTransfusionHemorrhage;

    model VolumeControl "control total blood volume"
      parameter Physiolibrary.Types.Time flowtime=0.1;
      Physiolibrary.Types.RealIO.VolumeInput volume annotation (Placement(
            transformation(extent={{16,60},{56,100}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={14,72})));
      Physiolibrary.Types.RealIO.VolumeInput desiredVolume annotation (Placement(
            transformation(extent={{-72,56},{-32,96}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-68,72})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate annotation (
          Placement(transformation(extent={{88,18},{108,38}}), iconTransformation(
              extent={{82,8},{116,42}})));
    equation
      volumeflowrate = (desiredVolume-volume)/flowtime;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-98,56},{98,-8}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={170,213,255}),
            Ellipse(
              extent={{-10,52},{46,0}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-92,46},{-38,8}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-32,30},{-14,24}},
              lineColor={0,0,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{56,36},{74,30}},
              lineColor={0,0,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{56,24},{74,18}},
              lineColor={0,0,255},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}));
    end VolumeControl;

    model Hemodynamics_with_volume_control
      extends Hemodynamics_with_catheter;
      BloodTransfusionHemorrhage bloodTransfusionHemorrhage
        annotation (Placement(transformation(extent={{-40,6},{-20,26}})));
      VolumeControl volumeControl
        annotation (Placement(transformation(extent={{-46,20},{-26,40}})));
      Physiolibrary.Types.Constants.VolumeConst desiredVolume(k=0.00515)
        annotation (Placement(transformation(extent={{-56,42},{-48,50}})));
    equation
      connect(bloodTransfusionHemorrhage.port_b, heart.rightHeartInflow)
        annotation (Line(
          points={{-23.4,7},{-16,7},{-16,43.8571},{4.16,43.8571}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(volumeControl.volume, volume) annotation (Line(
          points={{-34.6,37.2},{-34.6,49},{-27,49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(desiredVolume.y, volumeControl.desiredVolume) annotation (Line(
          points={{-47,46},{-42.8,46},{-42.8,37.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeControl.volumeflowrate, bloodTransfusionHemorrhage.volumeflowrate)
        annotation (Line(
          points={{-26.1,32.5},{-22,32.5},{-22,28},{-42,28},{-42,23.6},{-37,
              23.6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -60,-20},{40,100}}), graphics));
    end Hemodynamics_with_volume_control;

    model Hemodynamics_volume_up
      extends Hemodynamics_with_catheter;
      BloodTransfusionHemorrhage bloodTransfusionHemorrhage
        annotation (Placement(transformation(extent={{-40,6},{-20,26}})));
      VolumeControl volumeControl
        annotation (Placement(transformation(extent={{-46,20},{-26,40}})));

    equation
      connect(bloodTransfusionHemorrhage.port_b, heart.rightHeartInflow)
        annotation (Line(
          points={{-23.4,7},{-16,7},{-16,43.8571},{4.16,43.8571}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(volumeControl.volume, volume) annotation (Line(
          points={{-34.6,37.2},{-34.6,49},{-27,49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeControl.volumeflowrate, bloodTransfusionHemorrhage.volumeflowrate)
        annotation (Line(
          points={{-26.1,32.5},{-22,32.5},{-22,28},{-42,28},{-42,23.6},{-37,23.6}},
          color={0,0,127},
          smooth=Smooth.None));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-20},
                {40,100}}), graphics));
    end Hemodynamics_volume_up;

    model Hemodynamics_volume_control

      replaceable Hemodynamics_with_catheter hemodynamics_with_catheter
        annotation (Placement(transformation(extent={{14,-20},{64,40}})));
      BloodTransfusionHemorrhage bloodTransfusionHemorrhage
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      VolumeControl volumeControl
        annotation (Placement(transformation(extent={{-46,-14},{-26,6}})));
      Physiolibrary.Types.Constants.VolumeConst desiredVolume(k=0.00415)
        annotation (Placement(transformation(extent={{-62,12},{-54,20}})));
    equation
      connect(bloodTransfusionHemorrhage.port_b, hemodynamics_with_catheter.catheter)
        annotation (Line(
          points={{-3.4,-19},{7.3,-19},{7.3,-1.4},{22.125,-1.4}},
          color={190,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(hemodynamics_with_catheter.volume, volumeControl.volume) annotation (
          Line(
          points={{26.5,10},{-34.6,10},{-34.6,3.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeControl.volumeflowrate, bloodTransfusionHemorrhage.volumeflowrate)
        annotation (Line(
          points={{-26.1,-1.5},{-22.05,-1.5},{-22.05,-2.4},{-17,-2.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(desiredVolume.y, volumeControl.desiredVolume) annotation (Line(
          points={{-53,16},{-42.8,16},{-42.8,3.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Hemodynamics_volume_control;
  end Experiment;
  annotation(uses(Physiolibrary(version = "2.1"), Modelica(version = "3.2.1")), version = "2", conversion(noneFromVersion = ""), Documentation(revisions = "<html>
        <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
        <p>Copyright &copy; 2008-2014, Tomas Kulhanek, Charles University in Prague.</p>
        <p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
        </html>"));
end MeursModel;
