within ;
package MeursModel
  package Parts
    model SystemicArteries

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a Inflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{88,-12},{108,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b Outflow annotation (
          Placement(transformation(extent={{-106,-10},{-86,10}}),
            iconTransformation(extent={{-108,-8},{-88,12}})));
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure
        annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={76,74}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,48})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0003)
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00045)
        annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(volumeFlow_start(
            displayUnit="l/min") = 8.3333333333333e-05, I(displayUnit=
              "mmHg.s2/ml") = 93325.6711905)             annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={2,2})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
      Physiolibrary.Types.Constants.VolumeConst VITHAU(k=0.00014)
        "unstressed volume of intrathoracic arteries"
        annotation (Placement(transformation(extent={{-46,44},{14,50}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EITHA(k(displayUnit=
             "mmHg/ml") = 190651014.00345)
        annotation (Placement(transformation(extent={{-38,74},{-6,82}})));
      Physiolibrary.Types.Constants.VolumeConst VETHAU(k=0.00037)
        "unstressed volume of extrathoracic arteries"
        annotation (Placement(transformation(extent={{-30,-3},{30,3}},
            rotation=270,
            origin={-74,61})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EETHA(k(displayUnit=
             "mmHg/ml") = 74127247.40274) annotation (Placement(transformation(
            extent={{-16,-4},{16,4}},
            rotation=270,
            origin={-62,72})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=0) annotation (
          Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={-54,40})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHA(k(
            displayUnit="(mmHg.s)/ml") = 7999343.2449)
        annotation (Placement(transformation(extent={{-40,32},{-32,40}})));
    equation
      connect(VITHAU.y, IntraThoracicArteries.zeroPressureVolume) annotation (
          Line(
          points={{21.5,47},{34,47},{34,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(IntraThoracicArteries.externalPressure, intrathoracicPressure)
        annotation (Line(
          points={{50,8},{76,8},{76,74}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Inflow, IntraThoracicArteries.q_in) annotation (Line(
          points={{98,-2},{74,-2},{74,2.22045e-016},{42,2.22045e-016}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_in, ExtrathoracicArteries.q_in) annotation (Line(
          points={{-44,0},{-66,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicArteries.q_in, Outflow) annotation (Line(
          points={{-66,0},{-96,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicArteries.zeroPressureVolume, VETHAU.y) annotation (
          Line(
          points={{-74,8},{-74,23.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, ExtrathoracicArteries.externalPressure) annotation (
          Line(
          points={{-54,35},{-48,35},{-48,8},{-58,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RETHA.y, conductor.cond) annotation (Line(
          points={{-31,36},{-34,36},{-34,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EETHA.y, ExtrathoracicArteries.compliance) annotation (Line(
          points={{-62,52},{-64,52},{-64,8},{-66,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EITHA.y, IntraThoracicArteries.compliance) annotation (Line(
          points={{-2,78},{42,78},{42,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(conductor.q_out, inertia.q_out) annotation (Line(
          points={{-24,0},{-16,0},{-16,2},{-8,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_in, IntraThoracicArteries.q_in) annotation (Line(
          points={{12,2},{28,2},{28,0},{42,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Inflow, Inflow) annotation (Line(
          points={{98,-2},{98,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-98,38},{94,-42}},
              lineColor={255,229,185},
              fillColor={255,85,85},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-18,26},{22,18}},
              lineColor={255,0,0},
              fillColor={255,235,161},
              fillPattern=FillPattern.Solid,
              textString="intraThoracicPressure"),
            Text(
              extent={{-98,-64},{94,-48}},
              lineColor={0,0,255},
              fillColor={255,235,161},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end SystemicArteries;

    model systemicPeripheralVessels
                                    extends
        Physiolibrary.Icons.SystemicCirculation;

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
        annotation (Placement(transformation(extent={{90,-12},{110,8}}),
            iconTransformation(extent={{90,-12},{110,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow
        annotation (Placement(transformation(extent={{-108,-12},{-88,8}}),
            iconTransformation(extent={{-108,-12},{-88,8}})));
      Physiolibrary.Hydraulic.Components.Conductor
        SystemicArterioralConductance(useConductanceInput=true) annotation (
          Placement(transformation(
            extent={{11,-9},{-11,9}},
            rotation=0,
            origin={35,-1})));
      Physiolibrary.Hydraulic.Components.Conductor SmallVenuleConductance(
          useConductanceInput=true) annotation (Placement(transformation(
            extent={{14,-9},{-14,9}},
            rotation=0,
            origin={-46,1})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RTA(k(
            displayUnit="(mmHg.s)/ml") = 26664477.483)
        annotation (Placement(transformation(extent={{-70,18},{-62,26}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel
        BloodTissueElasticCompartment(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0002)
        annotation (Placement(transformation(extent={{-12,-12},{8,8}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EET(k=
            34930465.50273)
        annotation (Placement(transformation(extent={{-4,-4},{4,4}},
            rotation=180,
            origin={24,76})));
      Physiolibrary.Types.Constants.VolumeConst TUV(k=0.000185)
        annotation (Placement(transformation(extent={{-28,48},{-20,56}})));
      Physiolibrary.Types.Constants.PressureConst Pext(k=0) annotation (
          Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={28,52})));
      PhysiolibraryExtension.HydraulicResistanceInput
                               hydraulicresistance annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={96,40}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
      PhysiolibraryExtension.HydraulicResistanceToConductance hydraulicresistancetoconductance
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={52,38})));
    equation
      connect(RTA.y, SmallVenuleConductance.cond) annotation (Line(
          points={{-61,22},{-46,22},{-46,6.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(bloodFlowInflow, SystemicArterioralConductance.q_in) annotation (
          Line(
          points={{100,-2},{74,-2},{74,-1},{46,-1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SystemicArterioralConductance.q_out,
        BloodTissueElasticCompartment.q_in) annotation (Line(
          points={{24,-1},{12,-1},{12,-2},{-2,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(BloodTissueElasticCompartment.q_in, SmallVenuleConductance.q_in)
        annotation (Line(
          points={{-2,-2},{-18,-2},{-18,1},{-32,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SmallVenuleConductance.q_out, bloodFlowOutflow) annotation (Line(
          points={{-60,1},{-78,1},{-78,-2},{-98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(EET.y, BloodTissueElasticCompartment.compliance) annotation (Line(
          points={{19,76},{-2,76},{-2,22},{-2,6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(TUV.y, BloodTissueElasticCompartment.zeroPressureVolume)
        annotation (Line(
          points={{-19,52},{-10,52},{-10,14},{-10,6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Pext.y, BloodTissueElasticCompartment.externalPressure)
        annotation (Line(
          points={{23,52},{6,52},{6,26},{6,6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(hydraulicresistance, hydraulicresistancetoconductance.hydraulicresistance)
        annotation (Line(
          points={{96,40},{78,40},{78,37.6},{56.8,37.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicresistancetoconductance.y, SystemicArterioralConductance.cond)
        annotation (Line(
          points={{47,38},{34,38},{34,4.4},{35,4.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Text(
              extent={{-66,24},{66,2}},
              lineColor={0,0,0},
              fillColor={255,85,85},
              fillPattern=FillPattern.Solid,
              textString="Peripheral resistance"),
            Text(
              extent={{-92,-40},{102,-62}},
              lineColor={0,0,255},
              fillColor={255,85,85},
              fillPattern=FillPattern.Solid,
              textString="%name
")}),                           Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics));
    end systemicPeripheralVessels;

    model SystemicVeins
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
        annotation (Placement(transformation(extent={{90,-44},{110,-24}}),
            iconTransformation(extent={{90,-44},{110,-24}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodflowOutflow
        annotation (Placement(transformation(extent={{-112,-44},{-92,-24}}),
            iconTransformation(extent={{-112,-44},{-92,-24}})));
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure
        annotation (Placement(transformation(extent={{-78,48},{-38,88}}),
            iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={-1,35})));
      Physiolibrary.Hydraulic.Components.Conductor VeinsResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{38,-46},{10,-24}})));
      Physiolibrary.Hydraulic.Components.Conductor CentralVenousResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-50,-44},{-74,-24}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel IntraThoracicVeins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0014)
        annotation (Placement(transformation(extent={{-34,-48},{-6,-20}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ExtrathoracicVeins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00176)
        annotation (Placement(transformation(extent={{46,-48},{72,-22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RRAIN(k(
            displayUnit="(mmHg.s)/ml") = 399967.162245)
        annotation (Placement(transformation(extent={{-88,4},{-74,14}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RETHV(k(
            displayUnit="(mmHg.s)/ml") = 11999014.86735)
        annotation (Placement(transformation(extent={{6,-4},{18,4}})));
      Physiolibrary.Types.Constants.PressureConst Pext(k=0)
        annotation (Placement(transformation(extent={{46,28},{56,36}})));
      Physiolibrary.Types.Constants.VolumeConst VITHVU(k=0.00119)
        annotation (Placement(transformation(extent={{-60,16},{-48,24}})));
      Physiolibrary.Types.Constants.VolumeConst VETHVU(k=0.001)
        annotation (Placement(transformation(extent={{34,-10},{46,-2}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EITHV(k=
            2426467.450953)
        annotation (Placement(transformation(extent={{-38,30},{-26,38}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EETHV(k=
            2253148.3473135)
        annotation (Placement(transformation(extent={{34,8},{44,16}})));
    equation
      connect(bloodflowOutflow, CentralVenousResistance.q_out) annotation (Line(
          points={{-102,-34},{-74,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in)
        annotation (Line(
          points={{-50,-34},{-20,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(IntraThoracicVeins.q_in, VeinsResistance.q_out) annotation (Line(
          points={{-20,-34},{-6,-34},{-6,-35},{10,-35}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in) annotation (Line(
          points={{38,-35},{59,-35}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicVeins.q_in, bloodFlowInflow) annotation (Line(
          points={{59,-35},{78.5,-35},{78.5,-34},{100,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RRAIN.y, CentralVenousResistance.cond) annotation (Line(
          points={{-72.25,9},{-62,9},{-62,-28}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(RETHV.y, VeinsResistance.cond) annotation (Line(
          points={{19.5,0},{24,0},{24,-28.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(intrathoracicPressure, IntraThoracicVeins.externalPressure)
        annotation (Line(
          points={{-58,68},{-58,68},{-12,68},{10,68},{10,28},{-8.8,28},{-8.8,
              -22.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Pext.y, ExtrathoracicVeins.externalPressure) annotation (Line(
          points={{57.25,32},{70,32},{70,-18},{70,-24},{69.4,-24},{69.4,-24.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VITHVU.y, IntraThoracicVeins.zeroPressureVolume) annotation (Line(
          points={{-46.5,20},{-42,20},{-42,-22.8},{-31.2,-22.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VETHVU.y, ExtrathoracicVeins.zeroPressureVolume) annotation (Line(
          points={{47.5,-6},{46,-6},{46,-24.6},{48.6,-24.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(EITHV.y, IntraThoracicVeins.compliance) annotation (Line(
          points={{-24.5,34},{-20,34},{-20,-20},{-20,-22},{-20,-22.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(EETHV.y, ExtrathoracicVeins.compliance) annotation (Line(
          points={{45.25,12},{58,12},{58,-24.6},{59,-24.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Rectangle(
              extent={{-100,22},{100,-28}},
              lineColor={0,0,127},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,170,213}),
            Text(
              extent={{-94,20},{100,4}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,170,213},
              textString="IntraThoracic pressure"),
            Text(
              extent={{-84,-36},{88,-50}},
              lineColor={0,0,255},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,170,213},
              textString="%name
"),         Text(
              extent={{-154,-14},{-102,-28}},
              lineColor={0,0,255},
              fillColor={255,85,85},
              fillPattern=FillPattern.Solid,
              textString="bloodflow outflow
")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics));
    end SystemicVeins;

    model PulmonaryCirculation
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodflowOutflow
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Types.RealIO.PressureInput intrathoracicPressure
        annotation (Placement(transformation(extent={{-78,48},{-38,88}}),
            iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={-3,31})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0001)
        annotation (Placement(transformation(extent={{-74,-14},{-48,12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryArteriesResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-36,-13},{-2,13}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryVeins(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0006)
        annotation (Placement(transformation(extent={{10,-12},{34,12}})));
      Physiolibrary.Hydraulic.Components.Conductor PulmonaryVeinResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{46,-12},{76,12}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPP(k(
            displayUnit="(mmHg.s)/ml") = 14665462.61565)
        annotation (Placement(transformation(extent={{-46,36},{-32,46}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RLAIN(k(
            displayUnit="(mmHg.s)/ml") = 399967.162245)
        annotation (Placement(transformation(extent={{66,32},{80,42}})));
      Physiolibrary.Types.Constants.VolumeConst VPAU(k=5e-05)
        annotation (Placement(transformation(extent={{-94,32},{-82,40}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(k=
            31064116.267695)
        annotation (Placement(transformation(extent={{-88,48},{-76,56}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(k=
            6066168.6273825)
        annotation (Placement(transformation(extent={{-2,48},{10,56}})));
      Physiolibrary.Types.Constants.VolumeConst VPVU(k=0.00035)
        annotation (Placement(transformation(extent={{-6,22},{6,30}})));
    equation
      connect(RPP.y, PulmonaryArteriesResistance.cond) annotation (Line(
          points={{-30.25,41},{-30.25,17.5},{-19,17.5},{-19,7.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(RLAIN.y, PulmonaryVeinResistance.cond) annotation (Line(
          points={{81.75,37},{81.75,21.5},{61,21.5},{61,7.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VPAU.y, PulmonaryArteries.zeroPressureVolume) annotation (Line(
          points={{-80.5,36},{-76,36},{-76,9.4},{-71.4,9.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(EPA.y, PulmonaryArteries.compliance) annotation (Line(
          points={{-74.5,52},{-58,52},{-58,9.4},{-61,9.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VPVU.y, PulmonaryVeins.zeroPressureVolume) annotation (Line(
          points={{7.5,26},{10,26},{10,9.6},{12.4,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(EPV.y, PulmonaryVeins.compliance) annotation (Line(
          points={{11.5,52},{26,52},{26,9.6},{22,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(intrathoracicPressure, PulmonaryArteries.externalPressure)
        annotation (Line(
          points={{-58,68},{-54,68},{-54,9.4},{-50.6,9.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(intrathoracicPressure, PulmonaryVeins.externalPressure)
        annotation (Line(
          points={{-58,68},{31.6,68},{31.6,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(bloodFlowInflow, PulmonaryArteries.q_in) annotation (Line(
          points={{-100,0},{-61,0},{-61,-1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PulmonaryArteries.q_in, PulmonaryArteriesResistance.q_in)
        annotation (Line(
          points={{-61,-1},{-48.5,-1},{-48.5,0},{-36,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in)
        annotation (Line(
          points={{-2,0},{10,0},{22,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PulmonaryVeins.q_in, PulmonaryVeinResistance.q_in) annotation (
          Line(
          points={{22,0},{34,0},{46,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(PulmonaryVeinResistance.q_out, bloodflowOutflow) annotation (Line(
          points={{76,2.22045e-016},{88,2.22045e-016},{88,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Rectangle(
              extent={{-94,24},{94,-24}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Text(
              extent={{92,-44},{-92,-74}},
              lineColor={0,0,255},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,170,213},
              textString="%name
"),         Text(
              extent={{88,-6},{-84,36}},
              lineColor={255,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="IntraThoracic pressure")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end PulmonaryCirculation;



    model HeartIntervals

      Physiolibrary.Types.RealIO.TimeOutput Tas "duration of atrial systole"
        annotation (Placement(transformation(extent={{100,78},{120,98}}),
            iconTransformation(extent={{100,78},{120,98}})));
      Physiolibrary.Types.RealIO.TimeOutput Tav "atrioventricular delay"
        annotation (Placement(transformation(extent={{96,16},{116,36}}),
            iconTransformation(extent={{96,16},{116,36}})));
      Physiolibrary.Types.RealIO.TimeOutput Tvs
        "duration of ventricular systole"
        annotation (Placement(transformation(extent={{98,-24},{118,-4}}),
            iconTransformation(extent={{98,-24},{118,-4}})));
      Physiolibrary.Types.RealIO.TimeOutput T0
        "start time of cardiac cycle in sec"
        annotation (Placement(transformation(extent={{100,-98},{120,-78}}),
            iconTransformation(extent={{100,-98},{120,-78}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR "in SI units (1/s = Hz)"
        annotation (Placement(transformation(extent={{-128,-22},{-88,18}}),
            iconTransformation(extent={{-128,-22},{-88,18}})));
      discrete Modelica.SIunits.Time HP(start=0)
        "heart period - duration of cardiac cycle in sec";
      Boolean b(start=false);
    equation
      b=time - pre(T0) >=pre(HP);
      when {initial(),b} then
        T0=time;
        HP=1/HR; //HR comes in SI units (Hz)
        Tas=0.03 + 0.09*HP;
        Tav=0.01;
        Tvs=0.16 + 0.2*HP;
      end when;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Ellipse(
              extent={{-96,94},{98,-94}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,170}),
            Rectangle(
              extent={{-78,32},{-70,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Rectangle(
              extent={{-60,32},{-52,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Rectangle(
              extent={{0,32},{8,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Rectangle(
              extent={{44,32},{52,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Rectangle(
              extent={{-88,32},{-80,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Rectangle(
              extent={{-40,32},{-32,-80}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85}),
            Text(
              extent={{52,70},{-94,94}},
              lineColor={0,0,127},
              fillPattern=FillPattern.Sphere,
              fillColor={255,85,85},
              textString="Heart Intervals"),
            Text(
              extent={{58,106},{98,68}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tas"),
            Text(
              extent={{54,46},{94,8}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tav"),
            Text(
              extent={{54,2},{94,-36}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tvs"),
            Text(
              extent={{56,-64},{96,-102}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="T0"),
            Text(
              extent={{-130,46},{-100,12}},
              lineColor={0,0,127},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="HR")}), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end HeartIntervals;

    model AtrialElastance

      Physiolibrary.Types.RealIO.TimeInput Tas annotation (Placement(transformation(
              extent={{-140,22},{-100,62}}), iconTransformation(extent={{-140,22},{-100,
                62}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation (Placement(transformation(
              extent={{-140,-80},{-100,-40}}), iconTransformation(extent={{-140,-80},
                {-100,-40}})));
      PhysiolibraryExtension.HydraulicElastanceOutput Et "elasticity (torr/ml)"
                                                                                annotation (Placement(
            transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={
                {100,-20},{138,18}})));
    parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance (torr/ml)";
    parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance (torr/ml)";
    equation
       if time-T0 < Tas then
         Et = EMIN + (EMAX - EMIN)*sin(Modelica.Constants.pi*(time-T0)/Tas);
       else
         Et=EMIN;
       end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-98,98},{98,40}},
              lineColor={0,0,255},
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Atrial elastance"),
            Line(
              points={{-78,-34},{-76,-26},{-70,-14},{-58,6},{-36,36},{-14,14},{-6,-10},
                  {0,-32},{6,-34},{88,-34},{94,-34}},
              color={0,0,255},
              smooth=Smooth.Bezier),
            Text(
              extent={{-220,-102},{200,-120}},
              lineColor={0,0,255},
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-104,46},{-64,38}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tas"),
            Text(
              extent={{-110,-56},{-58,-64}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="T0"),
            Text(
              extent={{72,4},{102,-8}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Et")}));
    end AtrialElastance;

    model VentricularElastance

      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole"
                                               annotation (Placement(transformation(
              extent={{-138,54},{-98,94}}),  iconTransformation(extent={{-138,54},{-98,
                94}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation (Placement(transformation(
              extent={{-138,-100},{-98,-60}}), iconTransformation(extent={{-138,-100},
                {-98,-60}})));
      PhysiolibraryExtension.HydraulicElastanceOutput Et
        "ventricular elasticity (torr/ml)"               annotation (Placement(
            transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,4},
                {138,42}})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay"
                                               annotation (Placement(transformation(
              extent={{-140,22},{-100,62}}), iconTransformation(extent={{-138,0},{-98,
                40}})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"     annotation (Placement(transformation(
              extent={{-140,-64},{-100,-24}}), iconTransformation(extent={{-138,-46},
                {-98,-6}})));
      Modelica.Blocks.Interfaces.RealOutput Et0
        "normalized ventricular elasticity (0..1)"       annotation (Placement(
            transformation(extent={{100,-24},{120,-4}}), iconTransformation(extent={{100,-40},
                {138,-2}})));
      Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time"
                                                         annotation (Placement(
            transformation(extent={{102,-42},{122,-22}}),iconTransformation(extent={{100,-98},
                {138,-60}})));
    parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance ";
    parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance";
     constant Real Kn=0.57923032735652;
      //Kn is always = 0.5792303273565197
      //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
      //Equation to calculate normalized elastance ET0 was:
      //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));

    equation
      HeartInterval=time - T0;
      Et=EMIN + (EMAX - EMIN)*Et0;
      if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
        Et0=(HeartInterval - (Tas + Tav))/Tvs*sin(Modelica.Constants.pi*(HeartInterval - (Tas + Tav))/Tvs)/Kn;
      else
        Et0=0;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-82,82},{80,24}},
              lineColor={0,0,255},
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Ventricular elastance"),
            Line(
              points={{-72,-34},{-68,-26},{-62,-14},{-52,4},{-18,38},{-12,14},{-6,-10},
                  {0,-32},{6,-34},{88,-34},{94,-34}},
              color={0,0,255},
              smooth=Smooth.Bezier),
            Text(
              extent={{-220,-102},{200,-120}},
              lineColor={0,0,255},
              lineThickness=1,
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-96,82},{-76,66}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tas"),
            Text(
              extent={{-92,26},{-76,6}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tav"),
            Text(
              extent={{-94,-18},{-78,-38}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tvs"),
            Text(
              extent={{-96,-74},{-82,-86}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="T0"),
            Text(
              extent={{72,36},{88,14}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Et"),
            Text(
              extent={{96,-32},{68,-8}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Et0"),
            Text(
              extent={{42,-72},{88,-84}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Heart interval")}),
                                  Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end VentricularElastance;

    model RightHeart
      extends Physiolibrary.Icons.RightHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-106,-10},{-86,10}}),
            iconTransformation(extent={{-16,-10},{4,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{84,-10},{104,10}}),
            iconTransformation(extent={{34,56},{54,76}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-16,6}),
            iconTransformation(extent={{-100,52},{-60,92}})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole"
                                               annotation (Placement(transformation(
              extent={{-118,36},{-78,76}}),  iconTransformation(extent={{-110,22},
                {-78,54}})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay"
                                               annotation (Placement(transformation(
              extent={{-6,44},{18,68}}),     iconTransformation(extent={{-110,
                -16},{-80,14}})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"     annotation (Placement(transformation(
              extent={{-4,26},{16,46}}),       iconTransformation(extent={{-112,
                -54},{-84,-26}})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation (Placement(transformation(
              extent={{-120,10},{-80,50}}),    iconTransformation(extent={{-110,
                -88},{-82,-60}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel RightAtrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-05)
        annotation (Placement(transformation(extent={{-50,-60},{-18,-28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel RightVentricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00013)
        annotation (Placement(transformation(extent={{32,-54},{58,-28}})));
      PhysiolibraryExtension.CardiacValve tripupsidValve
        annotation (Placement(transformation(extent={{-8,-32},{14,-52}})));
      PhysiolibraryExtension.CardiacValve pulmonicValve
        annotation (Placement(transformation(extent={{64,-30},{88,-54}})));
      AtrialElastance atrialElastance(EMIN=6666119.37075, EMAX=19998358.11225)
        annotation (Placement(transformation(extent={{-64,46},{-26,78}})));
      VentricularElastance ventricularElastance(EMIN=7599376.082655, EMAX=
            65327969.83335)
        annotation (Placement(transformation(extent={{34,36},{82,70}})));
      Physiolibrary.Types.Constants.VolumeConst VRAU(k=3e-05)
        annotation (Placement(transformation(extent={{-64,-18},{-56,-10}})));
      Physiolibrary.Types.Constants.VolumeConst VRVU(k=4e-05)
        annotation (Placement(transformation(extent={{16,-14},{24,-6}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRABackflow(k=0)
        "conductance of tricupsid valve backflow"
        annotation (Placement(transformation(extent={{-18,-84},{-10,-76}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CRVBackflow(k=0)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={58,-80})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               RRAOutflow(k(displayUnit="(mmHg.s)/ml")=
          399967.162245) "resistance of tricupsid valve"
        annotation (Placement(transformation(extent={{-4,-92},{4,-84}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               RRVOutflow(k(displayUnit="(mmHg.s)/ml")=
          399967.162245) "resistance of pulmonic valve"
        annotation (Placement(transformation(extent={{74,-86},{82,-78}})));
      PhysiolibraryExtension.HydraulicElastanceToCompliance hydrauliccompliance
        annotation (Placement(transformation(extent={{102,52},{110,60}})));
      PhysiolibraryExtension.HydraulicElastanceToCompliance hydrauliccompliance1
        annotation (Placement(transformation(extent={{-10,58},{-2,66}})));
    equation
      connect(CRVBackflow.y, pulmonicValve.inflowConductance) annotation (Line(
          points={{63,-80},{67.12,-80},{67.12,-51.12}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation (Line(
          points={{-98,56},{-74,56},{-74,68.72},{-67.8,68.72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonicValve.outflowResistance, RRVOutflow.y) annotation (Line(
          points={{82.24,-52.56},{82,-52.56},{82,-82},{83,-82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RRAOutflow.y, tripupsidValve.outflowResistance) annotation (Line(
          points={{5,-88},{12,-88},{12,-50.8},{8.72,-50.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(CRABackflow.y, tripupsidValve.inflowConductance) annotation (Line(
          points={{-9,-80},{-8,-80},{-8,-49.6},{-5.14,-49.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VRAU.y, RightAtrium.zeroPressureVolume) annotation (Line(
          points={{-55,-14},{-50,-14},{-50,-31.2},{-46.8,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VRVU.y, RightVentricle.zeroPressureVolume) annotation (Line(
          points={{25,-10},{30,-10},{30,-30.6},{34.6,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(T0, atrialElastance.T0) annotation (Line(
          points={{-100,30},{-74,30},{-74,52.4},{-67.8,52.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, inflow) annotation (Line(
          points={{-96,0},{-96,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation (Line(
          points={{6,56},{6,56},{6,56.4},{29.68,56.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(PTH, RightAtrium.externalPressure) annotation (Line(
          points={{-16,6},{-18,6},{-18,-31.2},{-21.2,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(PTH, RightVentricle.externalPressure) annotation (Line(
          points={{-16,6},{55.4,6},{55.4,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation (Line(
          points={{-100,30},{-80,30},{-80,8},{-14,8},{-14,24},{29.68,24},{29.68,
              39.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance)
        annotation (Line(
          points={{86.56,56.91},{94,56.91},{94,55.9},{101.9,55.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance.y, RightVentricle.compliance) annotation (
          Line(
          points={{111,56},{120,56},{120,54},{120,24},{45,24},{45,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance)
        annotation (Line(
          points={{-22.39,61.84},{-16.195,61.84},{-16.195,61.9},{-10.1,61.9}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(hydrauliccompliance1.y, RightAtrium.compliance) annotation (Line(
          points={{-1,62},{0,62},{0,36},{-34,36},{-34,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tvs, ventricularElastance.Tvs) annotation (Line(
          points={{6,36},{16,36},{16,48.58},{29.68,48.58}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation (Line(
          points={{-98,56},{-80,56},{-80,88},{12,88},{12,65.58},{29.68,65.58}},
          color={0,0,127},
          smooth=Smooth.Bezier));

      connect(inflow, RightAtrium.q_in) annotation (Line(
          points={{-96,0},{-86,0},{-86,-48},{-34,-48},{-34,-44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(RightAtrium.q_in, tripupsidValve.bloodFlowInflow) annotation (
          Line(
          points={{-34,-44},{-22,-44},{-22,-41.8},{-7.78,-41.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(tripupsidValve.bloodFlowOutflow, RightVentricle.q_in) annotation (
         Line(
          points={{14,-42},{45,-42},{45,-41}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(RightVentricle.q_in, pulmonicValve.bloodFlowInflow) annotation (
          Line(
          points={{45,-41},{54.5,-41},{54.5,-41.76},{64.24,-41.76}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pulmonicValve.bloodFlowOutflow, outflow) annotation (Line(
          points={{88,-42},{92,-42},{92,0},{94,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={
            Text(
              extent={{-74,-70},{-60,-82}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="T0"),
            Text(
              extent={{-76,-30},{-60,-50}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tvs"),
            Text(
              extent={{-74,8},{-58,-12}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tav"),
            Text(
              extent={{-76,42},{-56,26}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tas"),
            Text(
              extent={{-48,82},{-22,60}},
              lineColor={0,0,255},
              textString="PTH")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
    end RightHeart;

    model LeftHeart
      extends Physiolibrary.Icons.LeftHeart;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-106,-10},{-86,10}}),
            iconTransformation(extent={{-28,14},{-8,34}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{84,-10},{104,10}}),
            iconTransformation(extent={{-84,-8},{-64,12}})));
      Physiolibrary.Types.RealIO.PressureInput PTH "intrathoracic pressure"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-16,6}),
            iconTransformation(extent={{-20,-20},{20,20}},
            rotation=180,
            origin={66,72})));
      Physiolibrary.Types.RealIO.TimeInput Tas "duration of atrial systole"
                                               annotation (Placement(transformation(
              extent={{-118,36},{-78,76}}),  iconTransformation(extent={{-16,-16},
                {16,16}},
            rotation=180,
            origin={52,38})));
      Physiolibrary.Types.RealIO.TimeInput Tav "atriuoventricular delay"
                                               annotation (Placement(transformation(
              extent={{-6,44},{18,68}}),     iconTransformation(extent={{-15,-15},
                {15,15}},
            rotation=180,
            origin={51,-1})));
      Physiolibrary.Types.RealIO.TimeInput Tvs
        "duration of ventricular systole"     annotation (Placement(transformation(
              extent={{-4,26},{16,46}}),       iconTransformation(extent={{-14,-14},
                {14,14}},
            rotation=180,
            origin={48,-40})));
      Physiolibrary.Types.RealIO.TimeInput T0 annotation (Placement(transformation(
              extent={{-120,10},{-80,50}}),    iconTransformation(extent={{-14,-14},
                {14,14}},
            rotation=180,
            origin={50,-74})));
      Physiolibrary.Hydraulic.Components.ElasticVessel LeftAtrium(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=4e-05)
        annotation (Placement(transformation(extent={{-50,-60},{-18,-28}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel LeftVentricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.00013)
        annotation (Placement(transformation(extent={{32,-54},{58,-28}})));
      PhysiolibraryExtension.CardiacValve tripupsidValve
        annotation (Placement(transformation(extent={{-8,-32},{14,-52}})));
      PhysiolibraryExtension.CardiacValve pulmonicValve
        annotation (Placement(transformation(extent={{64,-30},{88,-54}})));
      AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=37330268.4762)
        annotation (Placement(transformation(extent={{-64,46},{-26,78}})));
      VentricularElastance ventricularElastance(EMIN=11999014.86735, EMAX=
            533289549.66)
        annotation (Placement(transformation(extent={{34,36},{82,70}})));
      Physiolibrary.Types.Constants.VolumeConst VLAU(k=3e-05)
        annotation (Placement(transformation(extent={{-64,-18},{-56,-10}})));
      Physiolibrary.Types.Constants.VolumeConst VLVU(k=6e-05)
        annotation (Placement(transformation(extent={{16,-14},{24,-6}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CLABackflow(k=0)
        "conductance of tricupsid valve backflow"
        annotation (Placement(transformation(extent={{-18,-84},{-10,-76}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst CLVBackflow(k=0)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={58,-78})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               RLAOutflow(k(displayUnit="(mmHg.s)/ml")=
          399967.162245) "resistance of tricupsid valve"
        annotation (Placement(transformation(extent={{-4,-92},{4,-84}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               RLVOutflow(k(displayUnit="(mmHg.s)/ml")=
          1066579.09932) "resistance of pulmonic valve"
        annotation (Placement(transformation(extent={{74,-86},{82,-78}})));
      PhysiolibraryExtension.HydraulicElastanceToCompliance hydrauliccompliance
        annotation (Placement(transformation(extent={{102,52},{110,60}})));
      PhysiolibraryExtension.HydraulicElastanceToCompliance hydrauliccompliance1
        annotation (Placement(transformation(extent={{-10,58},{-2,66}})));
    equation
      connect(CLVBackflow.y, pulmonicValve.inflowConductance) annotation (Line(
          points={{63,-78},{67.12,-78},{67.12,-51.12}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tas, atrialElastance.Tas) annotation (Line(
          points={{-98,56},{-74,56},{-74,68.72},{-67.8,68.72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonicValve.outflowResistance, RLVOutflow.y)
                                                      annotation (Line(
          points={{82.24,-52.56},{82,-52.56},{82,-82},{83,-82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RLAOutflow.y, tripupsidValve.outflowResistance)
                                                          annotation (Line(
          points={{5,-88},{12,-88},{12,-50.8},{8.72,-50.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(CLABackflow.y, tripupsidValve.inflowConductance) annotation (Line(
          points={{-9,-80},{-8,-80},{-8,-49.6},{-5.14,-49.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VLAU.y, LeftAtrium.zeroPressureVolume)  annotation (Line(
          points={{-55,-14},{-50,-14},{-50,-31.2},{-46.8,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(VLVU.y, LeftVentricle.zeroPressureVolume)  annotation (Line(
          points={{25,-10},{30,-10},{30,-30.6},{34.6,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(T0, atrialElastance.T0) annotation (Line(
          points={{-100,30},{-74,30},{-74,52.4},{-67.8,52.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, inflow) annotation (Line(
          points={{-96,0},{-96,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(Tav, ventricularElastance.Tav) annotation (Line(
          points={{6,56},{6,56},{6,56.4},{29.68,56.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(PTH, LeftAtrium.externalPressure)  annotation (Line(
          points={{-16,6},{-18,6},{-18,-31.2},{-21.2,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(PTH, LeftVentricle.externalPressure)  annotation (Line(
          points={{-16,6},{55.4,6},{55.4,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(T0, ventricularElastance.T0) annotation (Line(
          points={{-100,30},{-80,30},{-80,8},{-14,8},{-14,24},{29.68,24},{29.68,39.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));

      connect(ventricularElastance.Et, hydrauliccompliance.hydraulicelastance)
        annotation (Line(
          points={{86.56,56.91},{94,56.91},{94,55.9},{101.9,55.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydrauliccompliance.y, LeftVentricle.compliance)  annotation (Line(
          points={{111,56},{120,56},{120,54},{120,24},{45,24},{45,-30.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(atrialElastance.Et, hydrauliccompliance1.hydraulicelastance)
        annotation (Line(
          points={{-22.39,61.84},{-16.195,61.84},{-16.195,61.9},{-10.1,61.9}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(hydrauliccompliance1.y, LeftAtrium.compliance)  annotation (Line(
          points={{-1,62},{0,62},{0,36},{-34,36},{-34,-31.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tvs, ventricularElastance.Tvs) annotation (Line(
          points={{6,36},{16,36},{16,48.58},{29.68,48.58}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(Tas, ventricularElastance.Tas) annotation (Line(
          points={{-98,56},{-80,56},{-80,88},{12,88},{12,65.58},{29.68,65.58}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, LeftAtrium.q_in)  annotation (Line(
          points={{-96,0},{-86,0},{-86,-48},{-34,-48},{-34,-44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(LeftAtrium.q_in, tripupsidValve.bloodFlowInflow)  annotation (Line(
          points={{-34,-44},{-22,-44},{-22,-41.8},{-7.78,-41.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(tripupsidValve.bloodFlowOutflow, LeftVentricle.q_in)  annotation (
          Line(
          points={{14,-42},{45,-42},{45,-41}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(LeftVentricle.q_in, pulmonicValve.bloodFlowInflow)  annotation (Line(
          points={{45,-41},{54.5,-41},{54.5,-41.76},{64.24,-41.76}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pulmonicValve.bloodFlowOutflow, outflow) annotation (Line(
          points={{88,-42},{92,-42},{92,0},{94,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={
            Text(
              extent={{12,-68},{26,-80}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="T0"),
            Text(
              extent={{10,-30},{26,-50}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tvs"),
            Text(
              extent={{10,10},{26,-10}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tav"),
            Text(
              extent={{12,42},{32,26}},
              lineColor={0,0,255},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid,
              textString="Tas"),
            Text(
              extent={{4,90},{30,68}},
              lineColor={0,0,255},
              textString="PTH")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics));
    end LeftHeart;

    model Hemodynamics
      extends Physiolibrary.Icons.CardioVascular;
      HeartIntervals heartIntervals
        annotation (Placement(transformation(extent={{-74,0},{-54,20}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.2)
        annotation (Placement(transformation(extent={{-94,6},{-86,14}})));
      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-30,-14},{14,40}})));
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{10,-14},{52,36}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-88,30},{-80,38}})));
      PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-8,30},{18,68}})));
      SystemicVeins systemicVeins(IntraThoracicVeins(volume_start=0.0014),
          ExtrathoracicVeins(volume_start=0.00176))
        annotation (Placement(transformation(extent={{-78,-78},{-26,-40}})));
      SystemicArteries systemicArteries
        annotation (Placement(transformation(extent={{38,-64},{90,-38}})));
      systemicPeripheralVessels systemicPeripheralVessels1
        annotation (Placement(transformation(extent={{-12,-74},{26,-42}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               hydraulicresistance(k(displayUnit="(mmHg.s)/ml")=
             106657909.932)
        annotation (Placement(transformation(extent={{-26,-40},{-18,-32}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation (Line(
          points={{-85,10},{-76,10},{-76,9.8},{-74.8,9.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pressure.y, rightHeart.PTH) annotation (Line(
          points={{-79,34},{-36,34},{-36,32.44},{-25.6,32.44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation (Line(
          points={{-53,18.8},{-44,18.8},{-44,23.26},{-28.68,23.26}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation (Line(
          points={{-53.4,12.6},{-40,12.6},{-40,12.73},{-28.9,12.73}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation (Line(
          points={{-53.2,8.6},{-36,8.6},{-36,2.2},{-29.56,2.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.T0, rightHeart.T0) annotation (Line(
          points={{-53,1.2},{-41.5,1.2},{-41.5,-6.98},{-29.12,-6.98}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{1.68,30.82},{-8,30.82},{-8,49}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pulmonaryCirculation.bloodflowOutflow, leftHeart.inflow)
        annotation (Line(
          points={{18,49},{22,49},{22,48},{27.22,48},{27.22,17}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure)
        annotation (Line(
          points={{-79,34},{-38,34},{-38,64},{4.61,64},{4.61,54.89}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, leftHeart.PTH) annotation (Line(
          points={{-79,34},{-38,34},{-38,64},{66,64},{66,30},{56,30},{56,29},{
              44.86,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, systemicArteries.intrathoracicPressure) annotation (
          Line(
          points={{-79,34},{-38,34},{-38,64},{66,64},{66,10},{64,10},{64,-44.76}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(heartIntervals.Tas, leftHeart.Tas) annotation (Line(
          points={{-53,18.8},{-5.5,18.8},{-5.5,20.5},{41.92,20.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation (Line(
          points={{-53.4,12.6},{-4.7,12.6},{-4.7,10.75},{41.71,10.75}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation (Line(
          points={{-53.2,8.6},{-6.6,8.6},{-6.6,1},{41.08,1}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation (Line(
          points={{-53,1.2},{-44,1.2},{-44,-8},{-2,-8},{-2,-7.5},{41.5,-7.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(pressure.y, systemicVeins.intrathoracicPressure) annotation (Line(
          points={{-79,34},{-38,34},{-38,64},{66,64},{66,10},{64,10},{64,-26},{
              -52.26,-26},{-52.26,-52.35}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation (Line(
          points={{15.46,11.5},{15.46,36},{60,36},{60,38},{96,38},{96,-51.26},{
              89.48,-51.26}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(systemicArteries.Outflow, systemicPeripheralVessels1.bloodFlowInflow)
        annotation (Line(
          points={{38.52,-50.74},{32.26,-50.74},{32.26,-58.32},{26,-58.32}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(systemicPeripheralVessels1.bloodFlowOutflow, systemicVeins.bloodFlowInflow)
        annotation (Line(
          points={{-11.62,-58.32},{-18.81,-58.32},{-18.81,-65.46},{-26,-65.46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(systemicVeins.bloodflowOutflow, rightHeart.inflow) annotation (
          Line(
          points={{-78.52,-65.46},{-94,-65.46},{-94,-18},{-18,-18},{-18,13},{
              -9.32,13}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(hydraulicresistance.y, systemicPeripheralVessels1.hydraulicresistance)
        annotation (Line(
          points={{-17,-36},{7,-36},{7,-51.6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end Hemodynamics;


  end Parts;

  package Test
    model testRightHeart
      Parts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-20,-20},{30,38}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P=
            266.64477483)
        annotation (Placement(transformation(extent={{-46,-64},{-26,-44}})));
    equation
      connect(unlimitedVolume.y, rightHeart.inflow) annotation (Line(
          points={{-26,-54},{4,-54},{4,9},{3.5,9}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testRightHeart;

    model HemodynamicsTest
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals
        annotation (Placement(transformation(extent={{-76,28},{-56,48}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.2)
        annotation (Placement(transformation(extent={{-96,34},{-88,42}})));
      Parts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-32,14},{12,68}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-90,58},{-82,66}})));
      Parts.PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-10,58},{16,96}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume
        annotation (Placement(transformation(extent={{60,48},{80,68}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-78,0},{-58,20}})));
      ModelOfHaemodynamics.Parts.RightHeart
                       rightHeart1(
        RightAtrium(V0=40),
        RightVentricle(V0=130),
        rightAtrialElastance(EMAX=0.15))                                                                                           annotation(Placement(transformation(extent={{20,-94},
                {58,-56}})));
      ModelOfHaemodynamics.Parts.heartIntervals
                           heartIntervals1                    annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={2,-118},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={2,-118},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={8,-34},    rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.PulmonaryCirculation pulmonaryCirculation1
        annotation (Placement(transformation(extent={{36,-30},{56,-10}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-86,-98},{-66,-78}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{70,-58},{90,-38}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation (Line(
          points={{-87,38},{-78,38},{-78,37.8},{-76.8,37.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pressure.y, rightHeart.PTH) annotation (Line(
          points={{-81,62},{-38,62},{-38,60.44},{-27.6,60.44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation (Line(
          points={{-55,46.8},{-46,46.8},{-46,51.26},{-30.68,51.26}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation (Line(
          points={{-55.4,40.6},{-42,40.6},{-42,40.73},{-30.9,40.73}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation (Line(
          points={{-55.2,36.6},{-38,36.6},{-38,30.2},{-31.56,30.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartIntervals.T0, rightHeart.T0) annotation (Line(
          points={{-55,29.2},{-43.5,29.2},{-43.5,21.02},{-31.12,21.02}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{-0.32,58.82},{-10,58.82},{-10,77}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure)
        annotation (Line(
          points={{-81,62},{-40,62},{-40,92},{2.61,92},{2.61,82.89}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(pulmonaryCirculation.bloodflowOutflow, unlimitedVolume.y)
        annotation (Line(
          points={{16,77},{96,77},{96,58},{80,58}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, rightHeart.inflow) annotation (Line(
          points={{-58,10},{-12,10},{-12,41},{-11.32,41}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(HeartRate.y, heartIntervals1.HR)
                                             annotation(Line(visible=true, points={{-87.6,
              -29.92},{-80,-29.92},{-80,-47.2},{-81.4,-47.2}},                                                                             color={0,0,127}));
      connect(heartIntervals1.Tas, rightHeart1.Tas)
                                                 annotation(Line(visible=true, points={{-59,
              -45.4},{-44,-45.4},{-44,-62.84},{22.66,-62.84}},                                                                                  color={0,0,127}));
      connect(heartIntervals1.Tav, rightHeart1.Tav)
                                                 annotation(Line(visible=true, points={{-59,
              -48.4},{-44,-48.4},{-44,-66.64},{22.66,-66.64}},                                                                                  color={0,0,127}));
      connect(heartIntervals1.Tvs, rightHeart1.Tvs)
                                                 annotation(Line(visible=true, points={{-59,
              -52.2},{-44,-52.2},{-44,-70.44},{22.66,-70.44}},                                                                                  color={0,0,127}));
      connect(heartIntervals1.T0, rightHeart1.T0)
                                               annotation(Line(visible=true, points={{-59,
              -55.6},{-44,-55.6},{-44,-74.24},{22.66,-74.24}},                                                                                color={0,0,127}));
      connect(rightHeart1.PTH, Pth.y)
                                    annotation(Line(visible=true, points={{28.74,
              -58.66},{-26,-58.66},{-26,-13.92},{-73.6,-13.92}},                                                                     color={0,0,127}));
      connect(rightHeart1.toPulmonaryArtery, pulmonaryCirculation1.bloodFlowInflow)
        annotation (Line(
          points={{56.29,-83.17},{56.29,-51.585},{34.7,-51.585},{34.7,-19.9}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, rightHeart1.fromCentralVeins)
        annotation (Line(
          points={{-66.6,-88},{-22,-88},{-22,-84.31},{23.23,-84.31}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(pulmonaryCirculation1.bloodFlowOutflow, pressuretest1.bloodFlowInflow)
        annotation (Line(
          points={{57.7,-20.3},{97.85,-20.3},{97.85,-46.7},{89.9,-46.7}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(Pth.y, pulmonaryCirculation1.IntrathoracicPresssure) annotation (
          Line(
          points={{-73.6,-13.92},{-12.8,-13.92},{-12.8,-15.2},{47.2,-15.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end HemodynamicsTest;

    model HemodynamicsTest2
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals
        annotation (Placement(transformation(extent={{-74,60},{-54,80}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.2)
        annotation (Placement(transformation(extent={{-94,66},{-86,74}})));
      Parts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{10,46},{52,96}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-88,90},{-80,98}})));
      Parts.SystemicArteries systemicArteries
        annotation (Placement(transformation(extent={{38,-4},{90,22}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,18},{-76,38}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume
        annotation (Placement(transformation(extent={{-80,-4},{-60,16}})));
      ModelOfHaemodynamics.Parts.heartIntervals
                           heartIntervals1                    annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={2,-96},   rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={0,-114},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={44,-70},   rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.SystemicArteries
                             systemicArteries1(
        IntrathoracicArteries(V0=300),
        ExtrathoracicArteries(V0=500),
        LETHA(k=0.0007))                                                                                                     annotation(Placement(transformation(extent={{42,-88},
                {90,-50}})));
      ModelOfHaemodynamics.Parts.LeftHeart
                      leftHeart1                    annotation(Placement(transformation(extent={{18,-54},
                {56,-16}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-84,-92},{-64,-72}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{-80,-108},{-60,-88}})));
      Parts.systemicPeripheralVessels
                                systemicPeripheralVessels1
        annotation (Placement(transformation(extent={{-12,-10},{26,22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               hydraulicresistance(k(displayUnit="(mmHg.s)/ml")=
             106657909.932)
        annotation (Placement(transformation(extent={{-2,34},{6,42}})));
      ModelOfHaemodynamics.Parts.Constant
                     RSP(k=0.8) "resistance torr sec/ml"
                                                        annotation(Placement(transformation(extent={{-14,-74},
                {-6,-66}})));
      ModelOfHaemodynamics.Parts.SystemicPeripheralVessels
                                      systemicPeripheralVessels                     annotation(Placement(transformation(extent={{-12,
                -114},{30,-74}})));
      Parts.SystemicVeins
                    systemicVeins
        annotation (Placement(transformation(extent={{-50,-2},{-18,26}})));
      ModelOfHaemodynamics.Parts.SystemicVeins systemicVeins1
        annotation (Placement(transformation(extent={{-44,-104},{-24,-84}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation (Line(
          points={{-85,70},{-76,70},{-76,69.8},{-74.8,69.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation (Line(
          points={{-79,94},{64,94},{64,60},{54,60},{54,89},{44.86,89}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, systemicArteries.intrathoracicPressure) annotation (
          Line(
          points={{-79,94},{64,94},{64,15.24}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(heartIntervals.Tas, leftHeart.Tas) annotation (Line(
          points={{-53,78.8},{-5.5,78.8},{-5.5,80.5},{41.92,80.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation (Line(
          points={{-53.4,72.6},{-4.7,72.6},{-4.7,70.75},{41.71,70.75}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation (Line(
          points={{-53.2,68.6},{-6.6,68.6},{-6.6,61},{41.08,61}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation (Line(
          points={{-53,61.2},{-44,61.2},{-44,52},{-2,52},{-2,52.5},{41.5,52.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation (Line(
          points={{15.46,71.5},{15.46,96},{60,96},{60,98},{96,98},{96,8.74},{
              89.48,8.74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(unlimitedPump.q_out, leftHeart.inflow) annotation (Line(
          points={{-76,28},{-24,28},{-24,77},{27.22,77}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartIntervals1.Tas, leftHeart1.Tas)
                                                annotation(Line(visible=true, points={{-59,
              -23.4},{-24,-23.4},{-24,-22.84},{20.66,-22.84}},                                                                              color={0,0,127}));
      connect(heartIntervals1.Tav, leftHeart1.Tav)
                                                annotation(Line(visible=true, points={{-59,
              -26.4},{-24,-26.4},{-24,-26.64},{20.66,-26.64}},                                                                              color={0,0,127}));
      connect(heartIntervals1.T0, leftHeart1.T0)
                                              annotation(Line(visible=true, points={{-59,
              -33.6},{-24,-33.6},{-24,-34.24},{20.66,-34.24}},                                                                            color={0,0,127}));
      connect(heartIntervals1.Tvs, leftHeart1.Tvs)
                                                annotation(Line(visible=true, points={{-59,
              -30.2},{-24,-30.2},{-24,-30.44},{20.66,-30.44}},                                                                              color={0,0,127}));
      connect(HeartRate.y, heartIntervals1.HR)
                                             annotation(Line(visible=true, points={{-89.6,
              -25.92},{-86,-25.92},{-86,-25.2},{-81.4,-25.2}},                                                                             color={0,0,127}));
      connect(Pth.y, leftHeart1.PTH)
                                   annotation(Line(visible=true, points={{-37.6,
              -49.92},{0,-49.92},{0,-32},{0,-18.66},{26.74,-18.66}},                                                                                       color={0,0,127}));
      connect(Pth.y, systemicArteries1.IntrathoracicPresssure)
                                                             annotation(Line(visible=true, points={{-37.6,
              -49.92},{-37.6,-51.92},{-28,-51.92},{-28,-59.88},{68.88,-59.88}},                                                                                            color={0,0,127}));
      connect(leftHeart1.toAorta, systemicArteries1.bloodFlowInflow)
                                                                  annotation(Line(points={{54.29,
              -43.17},{98,-43.17},{98,-70.33},{92.16,-70.33}},                                                                                  color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, leftHeart1.fromPulmonaryVeins)
        annotation (Line(
          points={{-64.6,-82},{-22,-82},{-22,-44.31},{21.23,-44.31}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicArteries.Outflow,systemicPeripheralVessels1. bloodFlowInflow)
        annotation (Line(
          points={{38.52,9.26},{36,9.26},{36,5.68},{26,5.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(hydraulicresistance.y,systemicPeripheralVessels1. hydraulicresistance)
        annotation (Line(
          points={{7,38},{7,12.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicPeripheralVessels.PeripheralArteriolarResistance,RSP.y) annotation(Line(points={{6.9,
              -74.4},{6.9,-69.92},{-5.6,-69.92}},                                                                                                 color={0,0,127}, smooth=Smooth.None));
      connect(systemicPeripheralVessels.bloodFlowInflow, systemicArteries1.bloodFlowOutflow)
        annotation (Line(
          points={{28.95,-90.2},{28.95,-77.1},{39.84,-77.1},{39.84,-70.33}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(unlimitedVolume.y, systemicVeins.bloodflowOutflow) annotation (
          Line(
          points={{-60,6},{-58,6},{-58,7.24},{-50.32,7.24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicVeins.bloodFlowInflow, systemicPeripheralVessels1.bloodFlowOutflow)
        annotation (Line(
          points={{-18,7.24},{-16,7.24},{-16,5.68},{-11.62,5.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicVeins.intrathoracicPressure, systemicArteries.intrathoracicPressure)
        annotation (Line(
          points={{-34.16,16.9},{-34.16,22},{-34,22},{-34,26},{64,26},{64,15.24}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(pressuretest1.bloodFlowInflow, systemicVeins1.bloodFlowOutflow)
        annotation (Line(
          points={{-60.1,-96.7},{-52.05,-96.7},{-52.05,-94.7},{-44.9,-94.7}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicVeins1.bloodFlowInflow, systemicPeripheralVessels.bloodFlowOutflow)
        annotation (Line(
          points={{-23.1,-94.7},{-16.55,-94.7},{-16.55,-90},{-10.95,-90}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicVeins1.IntrathoracicPresssure, systemicArteries1.IntrathoracicPresssure)
        annotation (Line(
          points={{-32.8,-89.2},{-28,-60},{68.88,-59.88}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end HemodynamicsTest2;

    model TestPulmonaryCirculation
      Parts.PulmonaryCirculation pulmonaryCirculation(RPP(k=14665462.61565))
        annotation (Placement(transformation(extent={{-30,6},{36,58}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-78,72},{-70,80}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-82,22},{-62,42}})));
      ModelOfHaemodynamics.Parts.PulmonaryCirculation pulmonaryCirculation1
        annotation (Placement(transformation(extent={{-26,-38},{32,-10}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-92,-36},{-60,-16}})));
      ModelOfHaemodynamics.Parts.Constant Constant(k=-4)
        annotation (Placement(transformation(extent={{-38,-8},{-30,0}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P=0)
        annotation (Placement(transformation(extent={{68,52},{88,72}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{62,-14},{82,6}})));
    equation
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure)
        annotation (Line(
          points={{-69,76},{2,76},{2,40},{2.01,40},{2.01,40.06}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{-62,32},{-30,32}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, pulmonaryCirculation1.bloodFlowInflow)
        annotation (Line(
          points={{-60.96,-26},{-46,-26},{-46,-23.86},{-29.77,-23.86}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(Constant.y, pulmonaryCirculation1.IntrathoracicPresssure)
        annotation (Line(
          points={{-29.6,-3.92},{-11.8,-3.92},{-11.8,-17.28},{6.48,-17.28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryCirculation.bloodflowOutflow, unlimitedVolume.y)
        annotation (Line(
          points={{36,32},{98,32},{98,62},{88,62}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation1.bloodFlowOutflow, pressuretest1.bloodFlowInflow)
        annotation (Line(
          points={{36.93,-24.42},{95.465,-24.42},{95.465,-2.7},{81.9,-2.7}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end TestPulmonaryCirculation;

    model pumptest "z puvodniho modelu"

    parameter Real outflow " in ml/min";

      ModelOfHaemodynamics.Parts.BloodFlowOutflow bloodFlowOutflow annotation (
          Placement(transformation(extent={{86,-12},{114,10}}), iconTransformation(
              extent={{84,-10},{104,10}})));
    equation
      bloodFlowOutflow.Q = - (outflow/60);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
              Polygon(
              points={{-98,36},{-98,-26},{46,-24},{86,2},{84,8},{48,32},{6,34},{-98,
                  36}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-56,6},{30,-12}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="testpump")}));
    end pumptest;

    model pressuretest

    parameter Real pressure " in mmHg";
      ModelOfHaemodynamics.Parts.BloodFlowInflow bloodFlowInflow annotation (
          Placement(transformation(extent={{84,2},{114,24}}), iconTransformation(
              extent={{84,2},{114,24}})));
    equation
      pressure = bloodFlowInflow.Pressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
              Polygon(
              points={{-88,46},{-88,-16},{140,-28},{96,12},{94,18},{130,44},{16,
                  44},{-88,46}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-46,16},{40,-2}},
              lineColor={0,0,0},
              fillColor={85,170,255},
              fillPattern=FillPattern.Solid,
              textString="test pressure")}));
    end pressuretest;

    model TestVessel
      Physiolibrary.Hydraulic.Components.ElasticVessel PulmonaryArteries(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true,
        volume_start=0.0001)
        annotation (Placement(transformation(extent={{-64,-4},{-38,22}})));
      Physiolibrary.Types.Constants.VolumeConst VPAU(k=5e-05)
        annotation (Placement(transformation(extent={{-84,42},{-72,50}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(k=
            31064116.267695)
        annotation (Placement(transformation(extent={{-80,58},{-68,66}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-92,0},{-72,20}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-38,70},{-30,78}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P=
            666.611937075)
        annotation (Placement(transformation(extent={{-8,6},{12,26}})));
      ModelOfHaemodynamics.Parts.BloodElasticCompartment
        bloodElasticCompartment(V0=100)
        annotation (Placement(transformation(extent={{-54,-66},{-34,-46}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-94,-76},{-74,-56}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{-8,-66},{12,-46}})));
      ModelOfHaemodynamics.Parts.Constant VPAU1(k=50)
        annotation (Placement(transformation(extent={{-76,-32},{-68,-24}})));
      ModelOfHaemodynamics.Parts.Constant PEXT(k=-4)
        annotation (Placement(transformation(extent={{-52,-28},{-44,-20}})));
      ModelOfHaemodynamics.Parts.Constant EPA1(k=0.233)
        annotation (Placement(transformation(extent={{-36,-30},{-28,-22}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
            displayUnit="ml/(mmHg.min)") = 1.2501026264094e-10)
        annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
      ModelOfHaemodynamics.Parts.BloodResistor bloodResistor(BloodResistance=60)
        annotation (Placement(transformation(extent={{-14,-84},{6,-64}})));
    equation
      connect(VPAU.y,PulmonaryArteries. zeroPressureVolume) annotation (Line(
          points={{-70.5,46},{-66,46},{-66,19.4},{-61.4,19.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(EPA.y,PulmonaryArteries. compliance) annotation (Line(
          points={{-66.5,62},{-48,62},{-48,19.4},{-51,19.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(unlimitedPump.q_out, PulmonaryArteries.q_in) annotation (Line(
          points={{-72,10},{-62,10},{-62,9},{-51,9}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressure.y, PulmonaryArteries.externalPressure) annotation (Line(
          points={{-29,74},{-34,74},{-34,19.4},{-40.6,19.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, bloodElasticCompartment.bloodFlow)
        annotation (Line(
          points={{-74.6,-66},{-44,-66}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(VPAU1.y, bloodElasticCompartment.UnstressedVolume) annotation (
          Line(
          points={{-67.6,-27.92},{-56.8,-27.92},{-56.8,-47.3554},{-50.4947,
              -47.3554}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PEXT.y, bloodElasticCompartment.ExternalPressure) annotation (
          Line(
          points={{-43.6,-23.92},{-43.6,-34.96},{-43.4947,-34.96},{-43.4947,
              -45.3554}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPA1.y, bloodElasticCompartment.Elastance) annotation (Line(
          points={{-27.6,-25.92},{-27.6,-36.96},{-37.4947,-36.96},{-37.4947,
              -47.3554}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PulmonaryArteries.q_in, conductor.q_in) annotation (Line(
          points={{-51,9},{-35.5,9},{-35.5,-12},{-16,-12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, unlimitedVolume.y) annotation (Line(
          points={{4,-12},{8,-12},{8,16},{12,16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodElasticCompartment.bloodFlow, bloodResistor.Inflow)
        annotation (Line(
          points={{-44,-66},{-30,-66},{-30,-74},{-14,-74}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(bloodResistor.Outflow, pressuretest1.bloodFlowInflow) annotation (
         Line(
          points={{6,-74},{10,-74},{10,-54.7},{11.9,-54.7}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end TestVessel;

    model TestSystemicCirculation
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-24,68},{-16,76}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-82,32},{-62,52}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-92,-36},{-60,-16}})));
      ModelOfHaemodynamics.Parts.Constant Constant(k=-4)
        annotation (Placement(transformation(extent={{-38,-8},{-30,0}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume(P=0)
        annotation (Placement(transformation(extent={{68,52},{88,72}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{62,-14},{82,6}})));
      Parts.SystemicArteries systemicArteries(inertia(I(displayUnit=
                "mmHg.s2/ml") = 93325.6711905))
        annotation (Placement(transformation(extent={{-6,32},{14,52}})));
      ModelOfHaemodynamics.Parts.SystemicArteries systemicArteries1
        annotation (Placement(transformation(extent={{10,-34},{30,-14}})));
      Parts.systemicPeripheralVessels systemicPeripheralVessels
        annotation (Placement(transformation(extent={{40,32},{60,52}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               hydraulicresistance(k(displayUnit="(mmHg.s)/ml")=
             106657909.932)
        annotation (Placement(transformation(extent={{18,88},{26,96}})));
      ModelOfHaemodynamics.Parts.SystemicPeripheralVessels
        systemicPeripheralVessels1
        annotation (Placement(transformation(extent={{60,-34},{80,-14}})));
      ModelOfHaemodynamics.Parts.Constant
               RSP(k=0.8) "resistance torr sec/ml" annotation(Placement(transformation(extent={{36,-6},
                {44,2}})));
    equation
      connect(unlimitedPump.q_out, systemicArteries.Outflow) annotation (Line(
          points={{-62,42},{-34,42},{-34,42.2},{-5.8,42.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicArteries.intrathoracicPressure, pressure.y) annotation (
          Line(
          points={{4,46.8},{4,72},{-15,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, systemicArteries1.bloodFlowOutflow)
        annotation (Line(
          points={{-60.96,-26},{-26,-26},{-26,-24.7},{9.1,-24.7}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicArteries1.IntrathoracicPresssure, Constant.y) annotation (
         Line(
          points={{21.2,-19.2},{-29.6,-19.2},{-29.6,-3.92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicArteries.Inflow, systemicPeripheralVessels.bloodFlowOutflow)
        annotation (Line(
          points={{13.8,41.8},{40.2,41.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicPeripheralVessels.bloodFlowInflow, unlimitedVolume.y)
        annotation (Line(
          points={{60,41.8},{98,41.8},{98,62},{88,62}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydraulicresistance.y, systemicPeripheralVessels.hydraulicresistance)
        annotation (Line(
          points={{27,92},{50,92},{50,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicArteries1.bloodFlowInflow, systemicPeripheralVessels1.bloodFlowOutflow)
        annotation (Line(
          points={{30.9,-24.7},{45.45,-24.7},{45.45,-22},{60.5,-22}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicPeripheralVessels1.bloodFlowInflow, pressuretest1.bloodFlowInflow)
        annotation (Line(
          points={{79.5,-22.1},{79.5,-14.05},{81.9,-14.05},{81.9,-2.7}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(RSP.y, systemicPeripheralVessels1.PeripheralArteriolarResistance)
        annotation (Line(
          points={{44.4,-1.92},{56.2,-1.92},{56.2,-14.2},{69,-14.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end TestSystemicCirculation;

    model HemodynamicsTest3
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals
        annotation (Placement(transformation(extent={{-74,60},{-54,80}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.2)
        annotation (Placement(transformation(extent={{-94,66},{-86,74}})));
      Parts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{10,46},{52,96}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-88,90},{-80,98}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,18},{-76,38}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume
        annotation (Placement(transformation(extent={{76,20},{96,40}})));
      ModelOfHaemodynamics.Parts.heartIntervals
                           heartIntervals1                    annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={2,-96},   rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={0,-114},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={58,-62},   rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.LeftHeart
                      leftHeart1                    annotation(Placement(transformation(extent={{42,-54},
                {80,-16}})));
      pumptest pumptest1(outflow=5000)
        annotation (Placement(transformation(extent={{-84,-92},{-64,-72}})));
      pressuretest pressuretest1(pressure=0)
        annotation (Placement(transformation(extent={{62,-84},{82,-64}})));
      Parts.PulmonaryCirculation
                           pulmonaryCirculation
        annotation (Placement(transformation(extent={{10,90},{36,128}})));
      ModelOfHaemodynamics.Parts.PulmonaryCirculation
                                 pulmonaryCirculation1(
          PulmonaryArteries(V0=100), PulmonaryVeins(V0=600))                                                                 annotation(Placement(transformation(extent={{-16,-10},
                {16,20}})));
      Parts.RightHeart rightHeart
        annotation (Placement(transformation(extent={{-28,40},{14,106}})));
      ModelOfHaemodynamics.Parts.RightHeart rightHeart1
        annotation (Placement(transformation(extent={{-18,-76},{14,-44}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation (Line(
          points={{-85,70},{-76,70},{-76,69.8},{-74.8,69.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation (Line(
          points={{-79,94},{64,94},{64,60},{54,60},{54,89},{44.86,89}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(heartIntervals.Tas, leftHeart.Tas) annotation (Line(
          points={{-53,78.8},{-5.5,78.8},{-5.5,80.5},{41.92,80.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation (Line(
          points={{-53.4,72.6},{-4.7,72.6},{-4.7,70.75},{41.71,70.75}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation (Line(
          points={{-53.2,68.6},{-14.6,68.6},{-14.6,61},{41.08,61}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation (Line(
          points={{-53,61.2},{-44,61.2},{-44,52},{-2,52},{-2,52.5},{41.5,52.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));

      connect(heartIntervals1.Tas, leftHeart1.Tas)
                                                annotation(Line(visible=true, points={{-59,
              -23.4},{-24,-23.4},{-24,-22.84},{44.66,-22.84}},                                                                              color={0,0,127}));
      connect(heartIntervals1.Tav, leftHeart1.Tav)
                                                annotation(Line(visible=true, points={{-59,
              -26.4},{-24,-26.4},{-24,-26.64},{44.66,-26.64}},                                                                              color={0,0,127}));
      connect(heartIntervals1.T0, leftHeart1.T0)
                                              annotation(Line(visible=true, points={{-59,
              -33.6},{-24,-33.6},{-24,-34.24},{44.66,-34.24}},                                                                            color={0,0,127}));
      connect(heartIntervals1.Tvs, leftHeart1.Tvs)
                                                annotation(Line(visible=true, points={{-59,
              -30.2},{-24,-30.2},{-24,-30.44},{44.66,-30.44}},                                                                              color={0,0,127}));
      connect(HeartRate.y, heartIntervals1.HR)
                                             annotation(Line(visible=true, points={{-89.6,
              -25.92},{-86,-25.92},{-86,-25.2},{-81.4,-25.2}},                                                                             color={0,0,127}));
      connect(leftHeart.outflow, unlimitedVolume.y) annotation (Line(
          points={{15.46,71.5},{15.46,96},{102,96},{102,30},{96,30}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.bloodflowOutflow, leftHeart.inflow)
        annotation (Line(
          points={{36,109},{36,77},{27.22,77}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure)
        annotation (Line(
          points={{-79,94},{-48,94},{-48,114.89},{22.61,114.89}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryCirculation1.bloodFlowOutflow, leftHeart1.fromPulmonaryVeins)
        annotation (Line(
          points={{18.72,4.55},{18.72,-43.725},{45.23,-43.725},{45.23,-44.31}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(leftHeart1.toAorta, pressuretest1.bloodFlowInflow) annotation (
          Line(
          points={{78.29,-43.17},{78.29,-57.585},{81.9,-57.585},{81.9,-72.7}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(Pth.y, pulmonaryCirculation1.IntrathoracicPresssure) annotation (
          Line(
          points={{-23.6,-41.92},{-23.6,20.04},{1.92,20.04},{1.92,12.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{2.24,94.78},{2.24,101.39},{10,101.39},{10,109}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.inflow, unlimitedPump.q_out) annotation (Line(
          points={{-8.26,73},{-10.13,73},{-10.13,28},{-76,28}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation (Line(
          points={{-53,61.2},{-40.5,61.2},{-40.5,48.58},{-27.16,48.58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation (Line(
          points={{-53,78.8},{-40.5,78.8},{-40.5,85.54},{-26.74,85.54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation (Line(
          points={{-53.4,72.6},{-40.7,72.6},{-40.7,72.67},{-26.95,72.67}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation (Line(
          points={{-53.2,68.6},{-38.6,68.6},{-38.6,59.8},{-27.58,59.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pumptest1.bloodFlowOutflow, rightHeart1.fromCentralVeins)
        annotation (Line(
          points={{-64.6,-82},{-28,-82},{-28,-67.84},{-15.28,-67.84}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(rightHeart1.toPulmonaryArtery, pulmonaryCirculation1.bloodFlowInflow)
        annotation (Line(
          points={{12.56,-66.88},{12.56,-30.15},{-18.08,-30.15},{-18.08,5.15}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(rightHeart1.T0, heartIntervals1.T0) annotation (Line(
          points={{-15.76,-59.36},{-37.88,-59.36},{-37.88,-33.6},{-59,-33.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tvs, heartIntervals1.Tvs) annotation (Line(
          points={{-15.76,-56.16},{-37.88,-56.16},{-37.88,-30.2},{-59,-30.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tav, heartIntervals1.Tav) annotation (Line(
          points={{-15.76,-52.96},{-37.88,-52.96},{-37.88,-26.4},{-59,-26.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tas, heartIntervals1.Tas) annotation (Line(
          points={{-15.76,-49.76},{-37.88,-49.76},{-37.88,-23.4},{-59,-23.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.PTH, Pth.y) annotation (Line(
          points={{-10.64,-46.24},{-17.32,-46.24},{-17.32,-41.92},{-23.6,-41.92}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(Pth.y, leftHeart1.PTH) annotation (Line(
          points={{-23.6,-41.92},{13.2,-41.92},{13.2,-18.66},{50.74,-18.66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, rightHeart.PTH) annotation (Line(
          points={{-79,94},{-52,94},{-52,96.76},{-23.8,96.76}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end HemodynamicsTest3;

    model HemodynamicsTest4
      extends Physiolibrary.Icons.CardioVascular;
      Parts.HeartIntervals heartIntervals
        annotation (Placement(transformation(extent={{-74,60},{-54,80}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.2)
        annotation (Placement(transformation(extent={{-94,66},{-86,74}})));
      Parts.LeftHeart leftHeart
        annotation (Placement(transformation(extent={{10,46},{52,96}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=-533.28954966)
        annotation (Placement(transformation(extent={{-88,90},{-80,98}})));
      Parts.SystemicArteries systemicArteries
        annotation (Placement(transformation(extent={{38,-4},{90,22}})));
      ModelOfHaemodynamics.Parts.heartIntervals
                           heartIntervals1                    annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={-10,-86}, rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={10,-130}, rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={46,-24},   rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.SystemicArteries
                             systemicArteries1(
        IntrathoracicArteries(V0=300),
        ExtrathoracicArteries(V0=500),
        LETHA(k=0.0007))                                                                                                     annotation(Placement(transformation(extent={{42,-88},
                {90,-50}})));
      ModelOfHaemodynamics.Parts.LeftHeart
                      leftHeart1                    annotation(Placement(transformation(extent={{18,-54},
                {56,-16}})));
      Parts.systemicPeripheralVessels
                                systemicPeripheralVessels1
        annotation (Placement(transformation(extent={{-12,-10},{26,22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
                               hydraulicresistance(k(displayUnit="(mmHg.s)/ml")=
             106657909.932)
        annotation (Placement(transformation(extent={{-2,34},{6,42}})));
      ModelOfHaemodynamics.Parts.Constant
                     RSP(k=0.8) "resistance torr sec/ml"
                                                        annotation(Placement(transformation(extent={{-14,-74},
                {-6,-66}})));
      ModelOfHaemodynamics.Parts.SystemicPeripheralVessels
                                      systemicPeripheralVessels                     annotation(Placement(transformation(extent={{-12,
                -114},{30,-74}})));
      Parts.SystemicVeins
                    systemicVeins
        annotation (Placement(transformation(extent={{-50,-2},{-18,26}})));
      ModelOfHaemodynamics.Parts.SystemicVeins systemicVeins1
        annotation (Placement(transformation(extent={{-44,-104},{-24,-84}})));
      Parts.RightHeart
                 rightHeart
        annotation (Placement(transformation(extent={{-30,46},{14,100}})));
      Parts.PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-2,92},{18,112}})));
      ModelOfHaemodynamics.Parts.RightHeart rightHeart1
        annotation (Placement(transformation(extent={{-54,-62},{-34,-42}})));
      ModelOfHaemodynamics.Parts.PulmonaryCirculation pulmonaryCirculation1
        annotation (Placement(transformation(extent={{-16,-20},{4,0}})));
    equation
      connect(frequency.y, heartIntervals.HR) annotation (Line(
          points={{-85,70},{-76,70},{-76,69.8},{-74.8,69.8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pressure.y, leftHeart.PTH) annotation (Line(
          points={{-79,94},{64,94},{64,60},{54,60},{54,89},{44.86,89}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, systemicArteries.intrathoracicPressure) annotation (
          Line(
          points={{-79,94},{64,94},{64,15.24}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(heartIntervals.Tas, leftHeart.Tas) annotation (Line(
          points={{-53,78.8},{-5.5,78.8},{-5.5,80.5},{41.92,80.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tav, leftHeart.Tav) annotation (Line(
          points={{-53.4,72.6},{-4.7,72.6},{-4.7,70.75},{41.71,70.75}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.Tvs, leftHeart.Tvs) annotation (Line(
          points={{-53.2,68.6},{-6.6,68.6},{-6.6,61},{41.08,61}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(heartIntervals.T0, leftHeart.T0) annotation (Line(
          points={{-53,61.2},{-44,61.2},{-44,52},{-2,52},{-2,52.5},{41.5,52.5}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          pattern=LinePattern.Dash));
      connect(leftHeart.outflow, systemicArteries.Inflow) annotation (Line(
          points={{15.46,71.5},{15.46,96},{60,96},{60,98},{96,98},{96,8.74},{
              89.48,8.74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(heartIntervals1.Tas, leftHeart1.Tas)
                                                annotation(Line(visible=true, points={{-71,
              -13.4},{-24,-13.4},{-24,-22.84},{20.66,-22.84}},                                                                              color={0,0,127}));
      connect(heartIntervals1.Tav, leftHeart1.Tav)
                                                annotation(Line(visible=true, points={{-71,
              -16.4},{-24,-16.4},{-24,-26.64},{20.66,-26.64}},                                                                              color={0,0,127}));
      connect(heartIntervals1.T0, leftHeart1.T0)
                                              annotation(Line(visible=true, points={{-71,
              -23.6},{-24,-23.6},{-24,-34.24},{20.66,-34.24}},                                                                            color={0,0,127}));
      connect(heartIntervals1.Tvs, leftHeart1.Tvs)
                                                annotation(Line(visible=true, points={{-71,
              -20.2},{-24,-20.2},{-24,-30.44},{20.66,-30.44}},                                                                              color={0,0,127}));
      connect(leftHeart1.toAorta, systemicArteries1.bloodFlowInflow)
                                                                  annotation(Line(points={{54.29,
              -43.17},{98,-43.17},{98,-70.33},{92.16,-70.33}},                                                                                  color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(systemicArteries.Outflow,systemicPeripheralVessels1. bloodFlowInflow)
        annotation (Line(
          points={{38.52,9.26},{36,9.26},{36,5.68},{26,5.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(hydraulicresistance.y,systemicPeripheralVessels1. hydraulicresistance)
        annotation (Line(
          points={{7,38},{7,12.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicPeripheralVessels.PeripheralArteriolarResistance,RSP.y) annotation(Line(points={{6.9,
              -74.4},{6.9,-69.92},{-5.6,-69.92}},                                                                                                 color={0,0,127}, smooth=Smooth.None));
      connect(systemicPeripheralVessels.bloodFlowInflow, systemicArteries1.bloodFlowOutflow)
        annotation (Line(
          points={{28.95,-90.2},{28.95,-77.1},{39.84,-77.1},{39.84,-70.33}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicVeins.bloodFlowInflow, systemicPeripheralVessels1.bloodFlowOutflow)
        annotation (Line(
          points={{-18,7.24},{-16,7.24},{-16,5.68},{-11.62,5.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicVeins.intrathoracicPressure, systemicArteries.intrathoracicPressure)
        annotation (Line(
          points={{-34.16,16.9},{-34.16,22},{-34,22},{-34,26},{64,26},{64,15.24}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(systemicVeins1.bloodFlowInflow, systemicPeripheralVessels.bloodFlowOutflow)
        annotation (Line(
          points={{-23.1,-94.7},{-16.55,-94.7},{-16.55,-90},{-10.95,-90}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicVeins.bloodflowOutflow, rightHeart.inflow) annotation (
          Line(
          points={{-50.32,7.24},{-50.32,39.62},{-9.32,39.62},{-9.32,73}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, pulmonaryCirculation.bloodFlowInflow)
        annotation (Line(
          points={{1.68,90.82},{1.68,96.41},{-2,96.41},{-2,102}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.inflow, pulmonaryCirculation.bloodflowOutflow)
        annotation (Line(
          points={{27.22,77},{27.22,89.5},{18,89.5},{18,102}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.PTH, pressure.y) annotation (Line(
          points={{-25.6,92.44},{-52.8,92.44},{-52.8,94},{-79,94}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tas, rightHeart.Tas) annotation (Line(
          points={{-53,78.8},{-42.5,78.8},{-42.5,83.26},{-28.68,83.26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tav, rightHeart.Tav) annotation (Line(
          points={{-53.4,72.6},{-41.7,72.6},{-41.7,72.73},{-28.9,72.73}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.Tvs, rightHeart.Tvs) annotation (Line(
          points={{-53.2,68.6},{-41.6,68.6},{-41.6,62.2},{-29.56,62.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals.T0, rightHeart.T0) annotation (Line(
          points={{-53,61.2},{-42.5,61.2},{-42.5,53.02},{-29.12,53.02}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, heartIntervals1.HR) annotation (Line(
          points={{-79.6,-41.92},{-70,-41.92},{-70,-54},{-93.4,-54},{-93.4,
              -15.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals1.T0, rightHeart1.T0) annotation (Line(
          points={{-71,-23.6},{-62.5,-23.6},{-62.5,-51.6},{-52.6,-51.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tav, heartIntervals1.Tav) annotation (Line(
          points={{-52.6,-47.6},{-57.3,-47.6},{-57.3,-16.4},{-71,-16.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tas, leftHeart1.Tas) annotation (Line(
          points={{-52.6,-45.6},{-52.6,-14},{-24,-14},{-24,-22.84},{20.66,
              -22.84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tvs, heartIntervals1.Tvs) annotation (Line(
          points={{-52.6,-49.6},{-56,-49.6},{-56,-50},{-60,-50},{-60,-20.2},{
              -71,-20.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.toPulmonaryArtery, pulmonaryCirculation1.bloodFlowInflow)
        annotation (Line(
          points={{-34.9,-56.3},{-34.9,-25.15},{-17.3,-25.15},{-17.3,-9.9}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(pulmonaryCirculation1.bloodFlowOutflow, leftHeart1.fromPulmonaryVeins)
        annotation (Line(
          points={{5.7,-10.3},{20,-44},{21.23,-44.31}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(systemicVeins1.bloodFlowOutflow, rightHeart1.fromCentralVeins)
        annotation (Line(
          points={{-44.9,-94.7},{-44.9,-68.35},{-52.3,-68.35},{-52.3,-56.9}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(pressure.y, pulmonaryCirculation.intrathoracicPressure)
        annotation (Line(
          points={{-79,94},{-36,94},{-36,105.1},{7.7,105.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, pulmonaryCirculation1.IntrathoracicPresssure) annotation (
          Line(
          points={{-35.6,-3.92},{-19.8,-3.92},{-19.8,-5.2},{-4.8,-5.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, leftHeart1.PTH) annotation (Line(
          points={{-35.6,-3.92},{-4.8,-3.92},{-4.8,-18.66},{26.74,-18.66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, rightHeart1.PTH) annotation (Line(
          points={{-35.6,-3.92},{-35.6,-23.96},{-49.4,-23.96},{-49.4,-43.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, systemicArteries1.IntrathoracicPresssure) annotation (Line(
          points={{-35.6,-3.92},{16.2,-3.92},{16.2,-59.88},{68.88,-59.88}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, systemicVeins1.IntrathoracicPresssure) annotation (Line(
          points={{-35.6,-3.92},{-35.6,-45.96},{-32.8,-45.96},{-32.8,-89.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end HemodynamicsTest4;

    model HemodynamicsTest5
      extends Physiolibrary.Icons.CardioVascular;
      ModelOfHaemodynamics.Parts.heartIntervals
                           heartIntervals1                    annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={-8,-26},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.Constant
                     HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={12,-70},  rotation=0), visible=true));
      ModelOfHaemodynamics.Parts.SystemicArteries
                             systemicArteries1(
        IntrathoracicArteries(V0=300),
        ExtrathoracicArteries(V0=500),
        LETHA(k=0.0007))                                                                                                     annotation(Placement(transformation(extent={{44,-28},
                {92,10}})));
      ModelOfHaemodynamics.Parts.LeftHeart
                      leftHeart1                    annotation(Placement(transformation(extent={{20,6},{
                58,44}})));
      ModelOfHaemodynamics.Parts.Constant
                     RSP(k=0.8) "resistance torr sec/ml"
                                                        annotation(Placement(transformation(extent={{-12,-14},
                {-4,-6}})));
      ModelOfHaemodynamics.Parts.SystemicPeripheralVessels
                                      systemicPeripheralVessels                     annotation(Placement(transformation(extent={{-10,-54},
                {32,-14}})));
      ModelOfHaemodynamics.Parts.SystemicVeins systemicVeins1
        annotation (Placement(transformation(extent={{-42,-44},{-22,-24}})));
      ModelOfHaemodynamics.Parts.RightHeart rightHeart1(
        rightAtrialElastance(EMAX=0.15),
        RightAtrium(V0=40),
        RightVentricle(V0=130))
        annotation (Placement(transformation(extent={{-52,-2},{-32,18}})));
      ModelOfHaemodynamics.Parts.PulmonaryCirculation pulmonaryCirculation1
        annotation (Placement(transformation(extent={{-14,40},{6,60}})));
      ModelOfHaemodynamics.Parts.Constant
                     Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={26,46},    rotation=0), visible=true));
    equation

      connect(heartIntervals1.Tas, leftHeart1.Tas)
                                                annotation(Line(visible=true, points={{-69,
              46.6},{-22,46.6},{-22,37.16},{22.66,37.16}},                                                                                  color={0,0,127}));
      connect(heartIntervals1.Tav, leftHeart1.Tav)
                                                annotation(Line(visible=true, points={{-69,
              43.6},{-22,43.6},{-22,33.36},{22.66,33.36}},                                                                                  color={0,0,127}));
      connect(heartIntervals1.T0, leftHeart1.T0)
                                              annotation(Line(visible=true, points={{-69,
              36.4},{-22,36.4},{-22,25.76},{22.66,25.76}},                                                                                color={0,0,127}));
      connect(heartIntervals1.Tvs, leftHeart1.Tvs)
                                                annotation(Line(visible=true, points={{-69,
              39.8},{-22,39.8},{-22,29.56},{22.66,29.56}},                                                                                  color={0,0,127}));
      connect(leftHeart1.toAorta, systemicArteries1.bloodFlowInflow)
                                                                  annotation(Line(points={{56.29,
              16.83},{100,16.83},{100,-10.33},{94.16,-10.33}},                                                                                  color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(systemicPeripheralVessels.PeripheralArteriolarResistance,RSP.y) annotation(Line(points={{8.9,
              -14.4},{8.9,-9.92},{-3.6,-9.92}},                                                                                                   color={0,0,127}, smooth=Smooth.None));
      connect(HeartRate.y, heartIntervals1.HR) annotation (Line(
          points={{-77.6,18.08},{-68,18.08},{-68,6},{-91.4,6},{-91.4,44.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartIntervals1.T0, rightHeart1.T0) annotation (Line(
          points={{-69,36.4},{-60.5,36.4},{-60.5,8.4},{-50.6,8.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tav, heartIntervals1.Tav) annotation (Line(
          points={{-50.6,12.4},{-55.3,12.4},{-55.3,43.6},{-69,43.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tas, leftHeart1.Tas) annotation (Line(
          points={{-50.6,14.4},{-50.6,46},{-22,46},{-22,37.16},{22.66,37.16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.Tvs, heartIntervals1.Tvs) annotation (Line(
          points={{-50.6,10.4},{-54,10.4},{-54,10},{-58,10},{-58,39.8},{-69,
              39.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightHeart1.toPulmonaryArtery, pulmonaryCirculation1.bloodFlowInflow)
        annotation (Line(
          points={{-32.9,3.7},{-32.9,22.85},{-15.3,22.85},{-15.3,50.1}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(pulmonaryCirculation1.bloodFlowOutflow, leftHeart1.fromPulmonaryVeins)
        annotation (Line(
          points={{7.7,49.7},{22,16},{23.23,15.69}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(systemicVeins1.bloodFlowOutflow, rightHeart1.fromCentralVeins)
        annotation (Line(
          points={{-42.9,-34.7},{-42.9,-8.35},{-50.3,-8.35},{-50.3,3.1}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(systemicArteries1.bloodFlowOutflow, systemicPeripheralVessels.bloodFlowInflow)
        annotation (Line(
          points={{41.84,-10.33},{41.84,-20.165},{30.95,-20.165},{30.95,-30.2}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));

      connect(systemicVeins1.bloodFlowInflow, systemicPeripheralVessels.bloodFlowOutflow)
        annotation (Line(
          points={{-21.1,-34.7},{-15.55,-34.7},{-15.55,-30},{-8.95,-30}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1));
      connect(Pth.y, pulmonaryCirculation1.IntrathoracicPresssure) annotation (
          Line(
          points={{-55.6,66.08},{-28.8,66.08},{-28.8,54.8},{-2.8,54.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, leftHeart1.PTH) annotation (Line(
          points={{-55.6,66.08},{21.2,66.08},{21.2,41.34},{28.74,41.34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, rightHeart1.PTH) annotation (Line(
          points={{-55.6,66.08},{-55.6,55.04},{-47.4,55.04},{-47.4,16.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, systemicVeins1.IntrathoracicPresssure) annotation (Line(
          points={{-55.6,66.08},{-55.6,55.04},{-30.8,55.04},{-30.8,-29.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pth.y, systemicArteries1.IntrathoracicPresssure) annotation (Line(
          points={{-55.6,66.08},{71.2,66.08},{71.2,0.12},{70.88,0.12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end HemodynamicsTest5;
  end Test;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1")),
    version="1",
    conversion(noneFromVersion=""));
end MeursModel;
