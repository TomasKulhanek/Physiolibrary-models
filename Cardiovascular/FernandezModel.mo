within ;
package FernandezModel
  package Parts

    model pulsos "generates relative position in heart period from 0 to 1"
      discrete Physiolibrary.Types.Time HP(start = 0)
        "heart period - duration of cardiac cycle";
      Boolean b(start = false);
      Physiolibrary.Types.RealIO.TimeOutput T0 "start time of cardiac cycle";
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-158,20},{-118,60}}), iconTransformation(extent=
               {{-88,-32},{-48,8}})));
      Modelica.Blocks.Interfaces.RealOutput heartphase annotation (Placement(transformation(
              extent={{-162,64},{-142,84}}), iconTransformation(extent={{72,-24},{92,
                -4}})));
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
        T0 = time;
        HP = 1 / HR;
      end when;
      heartphase = (time - pre(T0))/pre(HP);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(extent={{-46,52},{68,-78}},
                lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,170,170})}),
                                        Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end pulsos;




















    model VariableElasticityGenerator
      pulsos pulsos1(HP(displayUnit="s", start=1))
        annotation (Placement(transformation(extent={{-62,42},{-42,62}})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={11,23})));
      Modelica.Blocks.Sources.Constant const(k=0.87)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={30,84})));
      Modelica.Blocks.Math.Product product2 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-9,31})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput maxelastance annotation (
          Placement(transformation(extent={{-104,2},{-64,42}}), iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-4,76})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (Placement(
            transformation(extent={{-106,32},{-66,72}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={-37,77})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput hydrauliccompliance
        annotation (Placement(transformation(extent={{20,-8},{40,12}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,-14})));
      Physiolibrary.Blocks.Interpolation.Curve curve(
        x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
        y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
        slope={0,0,2.32,2.44,2.64,-2.84,-6.1872,0,0})
        annotation (Placement(transformation(extent={{-30,48},{-10,68}})));
      Cardiovascular.Types.RealIO.HydraulicElastanceToCompliance
        hydrauliccompliance1
        annotation (Placement(transformation(extent={{0,54},{8,62}})));
    equation
      connect(heartRate,pulsos1. HR) annotation (Line(
          points={{-86,52},{-76,52},{-76,50.8},{-58.8,50.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(maxelastance,product2. u2) annotation (Line(
          points={{-84,22},{-48,22},{-48,28},{-15,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y,product1. u2) annotation (Line(
          points={{-3.5,31},{0.25,31},{0.25,29},{8,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, hydrauliccompliance) annotation (Line(
          points={{11,17.5},{11,2},{30,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, product1.u1) annotation (Line(
          points={{41,84},{42,84},{42,29},{14,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.heartphase, curve.u) annotation (Line(
          points={{-43.8,50.6},{-36.9,50.6},{-36.9,58},{-30,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u1, hydrauliccompliance1.y) annotation (Line(
          points={{-15,34},{-20,34},{-20,42},{14,42},{14,58},{9,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, hydrauliccompliance1.hydraulicelastance) annotation (
          Line(
          points={{-10,58},{-6,58},{-6,57.9},{-0.1,57.9}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={
            Rectangle(
              extent={{-58,62},{20,0}},
              lineColor={0,0,255},
              fillColor={255,240,234},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-56,64},{-20,46}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{-26,64},{26,46}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Emax"),
            Line(
              points={{-52,4},{-44,22},{-36,48},{-30,48},{-28,36},{-26,6},{-20,
                  6},{0,6}},
              color={0,0,255},
              smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end VariableElasticityGenerator;

    model Heart
      extends Physiolibrary.Icons.Heart;
    //  extends Physiolibrary.Icons.RightHeart;

      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-102,-52},{-74,-24}}),
            iconTransformation(extent={{-58,-26},{-38,-6}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-24,-2},{6,28}}),
            iconTransformation(extent={{-50,32},{-30,52}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{10,-54},{40,-24}}),
            iconTransformation(extent={{20,30},{40,50}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{86,-8},{116,22}}),
            iconTransformation(extent={{24,-28},{44,-8}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        ERMAX(k=
            103991462.1837)
        annotation (Placement(transformation(extent={{-16,38},{-34,52}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        ELMAX(k=106657909.932)
        annotation (Placement(transformation(extent={{96,44},{80,60}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                   heartRate(k=1.2)
        annotation (Placement(transformation(extent={{-86,48},{-68,62}})));
      Cardiovascular.Hydraulic.Components.CardiacValve tricuspidValve
        annotation (Placement(transformation(extent={{-74,-42},{-54,-22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00015)
        annotation (Placement(transformation(extent={{-52,-12},{-32,8}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-106,-16},{-88,-2}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RRV(k(displayUnit="(mmHg.s)/ml")=
             1706526.558912)
        annotation (Placement(transformation(extent={{-76,-10},{-60,6}})));
      Cardiovascular.Hydraulic.Components.CardiacValve mitralValve
        annotation (Placement(transformation(extent={{40,-38},{60,-18}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00015)
        annotation (Placement(transformation(extent={{68,-10},{88,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance1(k=0)
        annotation (Placement(transformation(extent={{18,-12},{36,2}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RLV(k(displayUnit="(mmHg.s)/ml")=
             7839356.380002)
        annotation (Placement(transformation(extent={{40,2},{56,18}})));
      VariableElasticityGenerator variableElasticityGenerator(const(k=0.87))
        annotation (Placement(transformation(extent={{-70,4},{-22,46}})));
      VariableElasticityGenerator variableElasticityGenerator1(
        const(k=0.8),
        curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,0.25,0.0033,0.0033}, slope={0,5.0136,
              2.56,1.36,0.24,-4.4,-6.0536,0,0}))
        annotation (Placement(transformation(extent={{48,2},{96,44}})));
    equation
      connect(tricuspidValve.outflow, rightVentricle.q_in) annotation (Line(
          points={{-54,-32},{-54,-2},{-42,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(RRV.y, tricuspidValve.outflowResistance) annotation (Line(
          points={{-58,-2},{-58,-23.2},{-58.8,-23.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightVentricle.q_in, rightHeartOutflow) annotation (Line(
          points={{-42,-2},{-34,-2},{-34,13},{-9,13}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, mitralValve.inflow) annotation (Line(
          points={{25,-39},{32.6,-39},{32.6,-28.2},{40.2,-28.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(mitralValve.outflow, leftVentricle.q_in) annotation (Line(
          points={{60,-28},{66,-28},{66,2.22045e-016},{78,2.22045e-016}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(backflowConductance.y, tricuspidValve.backflowConductance)
        annotation (Line(
          points={{-85.75,-9},{-85.75,-12},{-86,-12},{-86,-16},{-71.4,-16},{-71.4,-24.4}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(rightHeartInflow, tricuspidValve.inflow) annotation (Line(
          points={{-88,-38},{-82,-38},{-82,-32.2},{-73.8,-32.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(backflowConductance1.y, mitralValve.backflowConductance) annotation (
          Line(
          points={{38.25,-5},{38.25,-13.5},{42.6,-13.5},{42.6,-20.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RLV.y, mitralValve.outflowResistance) annotation (Line(
          points={{58,10},{58,-19.2},{55.2,-19.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftVentricle.q_in, leftHeartOutflow) annotation (Line(
          points={{78,0},{101,0},{101,7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(variableElasticityGenerator.hydrauliccompliance, rightVentricle.compliance)
        annotation (Line(
          points={{-49.36,22.06},{-49.36,15.45},{-42,15.45},{-42,6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartRate.y, variableElasticityGenerator.heartRate) annotation (Line(
          points={{-65.75,55},{-55.875,55},{-55.875,41.17},{-54.88,41.17}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(ERMAX.y, variableElasticityGenerator.maxelastance) annotation (Line(
          points={{-36.25,45},{-46.96,45},{-46.96,40.96}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(variableElasticityGenerator1.hydrauliccompliance, leftVentricle.compliance)
        annotation (Line(
          points={{68.64,20.06},{68.64,15.45},{78,15.45},{78,8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartRate.y, variableElasticityGenerator1.heartRate) annotation (Line(
          points={{-65.75,55},{63.12,55},{63.12,39.17}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(ELMAX.y, variableElasticityGenerator1.maxelastance) annotation (Line(
          points={{78,52},{78,52.5},{71.04,52.5},{71.04,38.96}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,80}}),        graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,80}}),
            graphics));
    end Heart;

    model SystemicCirculation
    extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{96,-10},{116,10}}), iconTransformation(
              extent={{84,-8},{104,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-112,-10},{-92,10}}),iconTransformation(
              extent={{-112,-10},{-92,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve aorticValve
        annotation (Placement(transformation(extent={{88,-10},{68,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.0001)
        annotation (Placement(transformation(extent={{44,-10},{64,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(
            extent={{-9,-7},{9,7}},
            rotation=180,
            origin={101,25})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EAO(k=
            106657909.932)
        annotation (Placement(transformation(extent={{32,14},{48,28}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RAO(k(displayUnit=
              "(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{56,18},{72,34}})));
      Physiolibrary.Hydraulic.Components.Conductor peripheralResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{20,-14},{0,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel peripheralVessels(
          useComplianceInput=true, volume_start=0.00334)
        annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPS(
          k(displayUnit="(mmHg.s)/ml") = 81793284.679103)
        annotation (Placement(transformation(extent={{-10,16},{8,34}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(k=
            2039832.5274495)
        annotation (Placement(transformation(extent={{-38,18},{-22,32}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-40,-14},{-60,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst ECV(k=
            533289.54966)
        annotation (Placement(transformation(extent={{-100,22},{-84,36}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RCV(k(
            displayUnit="(mmHg.s)/ml") = 80793366.77349)
        annotation (Placement(transformation(extent={{-70,18},{-52,36}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        bloodFlowMeasurement
        annotation (Placement(transformation(extent={{44,-12},{24,8}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                   heartRate(k=1.2)
        annotation (Placement(transformation(extent={{14,28},{28,38}})));
    equation
      connect(aorticValve.inflow, inflow) annotation (Line(
          points={{87.8,0.78},{95.9,0.78},{95.9,0},{106,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorta.q_in, aorticValve.outflow) annotation (Line(
          points={{54,2.22045e-016},{60,2.22045e-016},{60,1},{68,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(EAO.y, aorta.compliance) annotation (Line(
          points={{50,21},{50,8},{54,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(backflowConductance.y, aorticValve.backflowConductance)
        annotation (Line(
          points={{89.75,25},{89.75,22.5},{85.4,22.5},{85.4,9.36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, peripheralResistance.q_out) annotation (
          Line(
          points={{-22,-2},{0,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPS.y, peripheralResistance.cond) annotation (Line(
          points={{10.25,25},{10.25,25.5},{10,25.5},{10,5.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPS.y, peripheralVessels.compliance) annotation (Line(
          points={{-20,25},{-20,6},{-22,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, venacavaResistance.q_in) annotation (Line(
          points={{-22,-2},{-40,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacavaResistance.q_out, venacava.q_in) annotation (Line(
          points={{-60,-2},{-72,-2},{-72,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ECV.y, venacava.compliance) annotation (Line(
          points={{-82,29},{-82,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RCV.y, venacavaResistance.cond) annotation (Line(
          points={{-49.75,27},{-49.75,17.5},{-50,17.5},{-50,5.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(venacava.q_in, outflow) annotation (Line(
          points={{-82,2.22045e-016},{-92,2.22045e-016},{-92,0},{-102,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorticValve.outflowResistance, RAO.y) annotation (Line(
          points={{72.8,10.68},{72.8,18.34},{74,18.34},{74,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralResistance.q_in, bloodFlowMeasurement.q_out)
        annotation (Line(
          points={{20,-2},{24,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_in, aorta.q_in) annotation (Line(
          points={{44,-2},{50,-2},{50,0},{54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartRate.y, bloodFlowMeasurement.HR) annotation (Line(
          points={{29.75,33},{29.75,18.5},{34,18.5},{34,4.6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,60}}),   graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
            graphics));
    end SystemicCirculation;

    model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-92,-4},{-72,16}}),  iconTransformation(
              extent={{-108,-12},{-88,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-4},{106,16}}),iconTransformation(
              extent={{90,-10},{110,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve pulmonaryValve
        annotation (Placement(transformation(extent={{-56,-4},{-36,16}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00012)
        annotation (Placement(transformation(extent={{-20,-4},{0,16}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-86,24},{-72,36}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(k=
            17771874.242419)
        annotation (Placement(transformation(extent={{-28,24},{-12,38}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RPA(k(displayUnit=
              "(mmHg.s)/ml") = 1479878.5003065)
        annotation (Placement(transformation(extent={{-52,24},{-40,36}})));
      Physiolibrary.Hydraulic.Components.Conductor pulmonaryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{18,-4},{38,16}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
          useComplianceInput=true, volume_start=0.00024)
        annotation (Placement(transformation(extent={{52,-4},{72,16}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(k=
            4399638.784695)
        annotation (Placement(transformation(extent={{42,24},{60,38}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPV(k(
            displayUnit="(mmHg.s)/ml") = 19051769.161603)
        annotation (Placement(transformation(extent={{10,24},{24,36}})));
    equation
      connect(backflowConductance.y, pulmonaryValve.backflowConductance)
        annotation (Line(
          points={{-70.25,30},{-70.25,31.5},{-53.4,31.5},{-53.4,13.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(pulmonaryValve.outflow, pulmonaryArteries.q_in) annotation (Line(
          points={{-36,6},{-26,6},{-10,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(RPA.y, pulmonaryValve.outflowResistance) annotation (Line(
          points={{-38.5,30},{-38.5,14.8},{-40.8,14.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, pulmonaryValve.inflow) annotation (Line(
          points={{-82,6},{-68,6},{-68,5.8},{-55.8,5.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(EPA.y, pulmonaryArteries.compliance) annotation (Line(
          points={{-10,31},{-10,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPV.y, pulmonaryVeins.compliance) annotation (Line(
          points={{62.25,31},{62.25,31.5},{62,31.5},{62,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outflow, pulmonaryVeins.q_in) annotation (Line(
          points={{96,6},{62,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, pulmonaryResistance.q_out) annotation (Line(
          points={{62,6},{38,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArteries.q_in, pulmonaryResistance.q_in) annotation (
          Line(
          points={{-10,6},{18,6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPV.y, pulmonaryResistance.cond) annotation (Line(
          points={{25.75,30},{26,30},{26,12},{28,12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -40},{100,40}}),   graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-40},{100,40}}),   graphics));
    end PulmonaryCirculation;
  end Parts;

  package Test
    model testpulsos
      Parts.pulsos pulsos
        annotation (Placement(transformation(extent={{-24,-2},{-4,18}})));
      Parts.combitable combitable
        annotation (Placement(transformation(extent={{8,0},{28,20}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-52,6},{-44,14}})));
    equation
      connect(frequency.y, pulsos.HR) annotation (Line(
          points={{-43,10},{-32,10},{-32,6.8},{-20.8,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos.heartphase, combitable.timeInput) annotation (Line(
          points={{-5.8,6.6},{3.1,6.6},{3.1,9.4},{10.2,9.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end testpulsos;

    model testBaro
      Experiment.Baroreceptor baroreceptor(
        HR0Param(displayUnit="1/min") = 1.3333333333333,
        useHRInput=true,
        RS0(displayUnit="(mmHg.s)/ml") = 166652984.26875)
        annotation (Placement(transformation(extent={{6,-12},{68,42}})));
      Modelica.Blocks.Sources.Ramp ramp(
        duration=120,
        height=10000,
        offset=11000,
        startTime=60)
        annotation (Placement(transformation(extent={{-58,4},{-38,24}})));
      Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(displayUnit=
              "1/min") = 1.2)                                                   annotation(Placement(transformation(extent={{-18,54},
                {-10,62}})));
    equation
      connect(ramp.y, baroreceptor.PAo) annotation (Line(
          points={{-37,14},{-14,14},{-14,13.92},{7.86,13.92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeartRate.y, baroreceptor.cond) annotation (Line(
          points={{-9,58},{56.22,58},{56.22,23.1}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testBaro;

    model testvenderecho
      Parts.venderecho venderecho
        annotation (Placement(transformation(extent={{-44,30},{-24,50}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P=
            7999.3432449)
        annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-60,60},{-52,68}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=399967.162245)
        annotation (Placement(transformation(extent={{-40,86},{-32,94}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            0.0001)
        annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
    equation
      connect(unlimitedVolume1.y, venderecho.outflow) annotation (Line(
          points={{-8,10},{-4,10},{-4,42},{-30,42},{-30,46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(frequency.y, venderecho.heartRate) annotation (Line(
          points={{-51,64},{-36,64},{-36,46.8},{-37.6,46.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicElastance2Compliance.y, venderecho.maxelastance)
        annotation (Line(
          points={{-31,90},{-33.4,90},{-33.4,46.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, venderecho.inflow) annotation (Line(
          points={{-60,40},{-48,40},{-48,40.2},{-35.6,40.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testvenderecho;

    model testHeart
      Obsolete.Heart heart
        annotation (Placement(transformation(extent={{-22,-34},{38,26}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume2(P=
            10665.7909932)
        annotation (Placement(transformation(extent={{34,-44},{54,-24}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-72,-34},{-52,-14}})));
      Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump1(SolutionFlow=
           8.3333333333333e-05) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={52,60})));
      Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume1(P=
            1333.22387415)
        annotation (Placement(transformation(extent={{-56,26},{-36,46}})));
      Physiolibrary.Types.Constants.FrequencyConst frequency(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-50,70},{-42,78}})));
      Physiolibrary.Types.Constants.PressureConst pressure(k=0)
        annotation (Placement(transformation(extent={{-2,88},{6,96}})));
    equation
      connect(unlimitedVolume2.y, heart.leftHeartOutflow) annotation (Line(
          points={{54,-34},{62,-34},{62,-32},{70,-32},{70,-9.4},{18.2,-9.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedPump.q_out, heart.rightHeartInflow) annotation (Line(
          points={{-52,-24},{-6.4,-24},{-6.4,-8.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedPump1.q_out, heart.leftHeartInflow) annotation (Line(
          points={{42,60},{26,60},{26,8},{17,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedVolume1.y, heart.rightHeartOutflow) annotation (Line(
          points={{-36,36},{-20,36},{-20,8.6},{-4,8.6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(frequency.y, heart.heartRate) annotation (Line(
          points={{-41,74},{0,74},{0,15.8},{0.8,15.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressure.y, heart.PTH) annotation (Line(
          points={{7,92},{12,92},{12,15.8},{14,15.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testHeart;
  end Test;

  package Models

    model Hemodynamics_pure

      replaceable Parts.Heart heart
        annotation (Placement(transformation(extent={{-24,-22},{18,14}})));
      replaceable Parts.SystemicCirculation systemicCirculation
        annotation (Placement(transformation(extent={{-22,-64},{20,-28}})));
      replaceable Parts.PulmonaryCirculation
                                 pulmonaryCirculation
        annotation (Placement(transformation(extent={{-24,30},{14,66}})));
    equation
      connect(heart.leftHeartOutflow, systemicCirculation.inflow) annotation (
          Line(
          points={{2.95,-11.2},{24,-11.2},{24,-45.4},{15.45,-45.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (
          Line(
          points={{-18.85,-46},{-32,-46},{-32,-10.6857},{-11.4,-10.6857}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation (
         Line(
          points={{-10,4.22857},{-34,4.22857},{-34,47.1},{-23.62,47.1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.outflow, heart.leftHeartInflow) annotation (
          Line(
          points={{14,48},{24,48},{24,3.71429},{2.25,3.71429}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-80},
                {40,80}}),              graphics), Icon(coordinateSystem(extent
              ={{-40,-80},{40,80}})));
    end Hemodynamics_pure;

  end Models;

  package Obsolete
    model venacava_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-14,-8},{6,12}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-8},{108,12}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaresistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{22,-8},{42,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{60,-8},{80,12}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst RCV(k(displayUnit=
             "ml/(mmHg.s)") = 1.2376016001453e-08)
        annotation (Placement(transformation(extent={{10,26},{30,42}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECV annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={50,56}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,50})));
    equation
      connect(RCV.y, venacavaresistance.cond) annotation (Line(
          points={{32.5,34},{32.5,26},{32,26},{32,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outflow, venacava.q_in) annotation (Line(
          points={{98,2},{70,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava.q_in, venacavaresistance.q_out) annotation (Line(
          points={{70,2},{42,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ECV, venacava.compliance) annotation (Line(
          points={{50,56},{50,34},{70,34},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, venacavaresistance.q_in) annotation (Line(
          points={{-4,2},{22,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-30,26},{38,14}},
              lineColor={0,0,127},
              textString="EVenaCava")}),
                                     Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end venacava_controllable;

    model circulatorosystemica_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-30,-10},{-10,10}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{12,-10},{32,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicvessels(
        useComplianceInput=true,
        volume_start=0.00334,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{58,-8},{78,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=2039832.5274495)
        annotation (Placement(transformation(extent={{46,26},{70,48}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSO annotation (
          Placement(transformation(extent={{-36,34},{4,74}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-6,48})));
    equation
      connect(hydraulicElastance2Compliance.y, systemicvessels.compliance)
        annotation (Line(
          points={{73,37},{73,15.5},{68,15.5},{68,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{-20,0},{12,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, systemicvessels.q_in) annotation (Line(
          points={{32,0},{50,0},{50,2},{68,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicvessels.q_in, outflow) annotation (Line(
          points={{68,2},{82,2},{82,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSO, conductor.cond) annotation (Line(
          points={{-16,54},{22,54},{22,6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-34,24},{26,16}},
              lineColor={0,0,127},
              textString="RSO")}),   Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end circulatorosystemica_controllable;

    model venacava
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{0,-8},{20,12}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-8},{106,12}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaresistor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{26,-8},{46,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{60,-8},{80,12}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
                                                                        ECV(k=
            266644.77483)
        annotation (Placement(transformation(extent={{50,18},{68,32}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst RCV(k(displayUnit=
             "ml/(mmHg.s)") = 1.2376016001453e-08)
        annotation (Placement(transformation(extent={{14,18},{34,34}})));
    equation
      connect(ECV.y, venacava.compliance) annotation (Line(
          points={{70.25,25},{70.25,25.5},{70,25.5},{70,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RCV.y, venacavaresistor.cond) annotation (Line(
          points={{36.5,26},{36,26},{36,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outflow, venacava.q_in) annotation (Line(
          points={{96,2},{70,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava.q_in, venacavaresistor.q_out) annotation (Line(
          points={{70,2},{46,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacavaresistor.q_in, inflow) annotation (Line(
          points={{26,2},{10,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end venacava;

    model circulatorosystemica
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{4,-8},{24,12}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{80,-8},{100,12}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{24,-8},{44,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel systemicvessels(
        useComplianceInput=true,
        volume_start=0.00334,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{58,-8},{78,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(k=
            2039832.5274495)
        annotation (Placement(transformation(extent={{48,16},{66,32}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst RPS(k(displayUnit
            ="ml/(mmHg.s)") = 1.2226003686284e-08)
        annotation (Placement(transformation(extent={{12,16},{32,32}})));
    equation
      connect(EPS.y, systemicvessels.compliance) annotation (Line(
          points={{68.25,24},{68.25,15.5},{68,15.5},{68,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{14,2},{24,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, systemicvessels.q_in) annotation (Line(
          points={{44,2},{68,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicvessels.q_in, outflow) annotation (Line(
          points={{68,2},{90,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPS.y, conductor.cond) annotation (Line(
          points={{34.5,24},{34.5,23},{34,23},{34,8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end circulatorosystemica;

    model arteriaaorta
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-84,4},{-64,24}}),
            iconTransformation(extent={{84,-10},{104,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{0,4},{20,24}}),
            iconTransformation(extent={{-102,-10},{-82,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-56,4},{-36,24}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        useComplianceInput=true,
        volume_start=0.0001,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-20,4},{0,24}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-84,32},{-66,46}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst elastance(k=
            106657909.932)
        annotation (Placement(transformation(extent={{-28,38},{-12,52}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst resistance(k(
            displayUnit="(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{-56,48},{-40,64}})));
    equation
      connect(elastance.y, arteries.compliance) annotation (Line(
          points={{-10,45},{-10,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(backflowConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-63.75,39},{-63.75,39.5},{-53.4,39.5},{-53.4,21.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, arteries.q_in) annotation (Line(
          points={{-36,14},{-26,14},{-10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(arteries.q_in, outflow) annotation (Line(
          points={{-10,14},{10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-74,14},{-64,14},{-64,13.8},{-55.8,13.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(resistance.y, cardiacValve.outflowResistance) annotation (Line(
          points={{-38,56},{-40,56},{-40,22.8},{-40.8,22.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,16},{78,-20}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-74,-22},{98,-44}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end arteriaaorta;

    model ventriculo "right ventricle"

      Parts.pulsos pulsos1(HP(displayUnit="s", start=1))
        annotation (Placement(transformation(extent={{-72,42},{-52,62}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(
        useComplianceInput=true,
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=0.00015,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-8,-24},{12,-4}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow
        annotation (Placement(transformation(extent={{-88,-30},{-68,-10}}),
            iconTransformation(extent={{-26,-8},{-6,12}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={1,23})));
      Modelica.Blocks.Sources.Constant const(k=0.87)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-12,84})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{22,-24},{42,-4}}),iconTransformation(
              extent={{30,50},{50,70}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput maxelastance annotation (
          Placement(transformation(extent={{-104,4},{-64,44}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={6,68})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (Placement(
            transformation(extent={{-120,32},{-80,72}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-36,68})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-52,-4},{-44,4}})));
      Parts.combitable combitable1
        annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
      Modelica.Blocks.Math.Product product2 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-19,31})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 399967.162245)
        annotation (Placement(transformation(extent={{-42,12},{-34,20}})));
    equation
      connect(const.y, product1.u1) annotation (Line(
          points={{-1,84},{4,84},{4,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate, pulsos1.HR) annotation (Line(
          points={{-100,52},{-86,52},{-86,50.8},{-68.8,50.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, ventricle.compliance) annotation (Line(
          points={{1,17.5},{1,13.75},{2,13.75},{2,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(maxelastance, product2.u2) annotation (Line(
          points={{-84,24},{-58,24},{-58,28},{-25,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, product1.u2) annotation (Line(
          points={{-13.5,31},{-9.75,31},{-9.75,29},{-2,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.heartphase, combitable1.phaseInput) annotation (Line(
          points={{-53.8,50.6},{-43.9,50.6},{-43.9,65.4},{-33.8,65.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u1, combitable1.hydrauliccompliance) annotation (Line(
          points={{-25,34},{-34,34},{-34,52},{-12,52},{-12,66.2},{-17.8,66.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, outflow) annotation (Line(
          points={{2,-14},{32,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(cardiacValve.inflow, inflow) annotation (Line(
          points={{-39.8,-20.2},{-59.9,-20.2},{-59.9,-20},{-78,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, ventricle.q_in) annotation (Line(
          points={{-20,-20},{-10,-20},{-10,-14},{2,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(backflowConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-43,0},{-40,0},{-40,-12.4},{-37.4,-12.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-33,16},{-26,16},{-26,-11.2},{-24.8,-11.2}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end ventriculo;

    model RightHeart
      extends ventriculo(hydraulicResistance(k=1706526.558912));
      extends Physiolibrary.Icons.RightHeart;
    end RightHeart;

    model LeftHeart
      extends ventriculo(
        combitable1(curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,0.25,0.0033,0.0033},
              slope={0,5.0136,2.56,1.36,0.24,-4.4,-6.0536,0,0})),
        hydraulicResistance(k=7839356.380002),
        const(k=0.8));
      extends Physiolibrary.Icons.LeftHeart;
    end LeftHeart;

    model Heart
      extends Physiolibrary.Icons.Heart;
    //  extends Physiolibrary.Icons.RightHeart;

      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-32},{-2,24}})));
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-12,-32},{30,16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-86,-32},{-58,-4}}),
            iconTransformation(extent={{-58,-26},{-38,-6}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-30,44},{0,74}}),
            iconTransformation(extent={{-50,32},{-30,52}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{16,-40},{46,-10}}),
            iconTransformation(extent={{20,30},{40,50}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{78,-14},{108,16}}),
            iconTransformation(extent={{24,-28},{44,-8}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst ERMAX(k=
            103991462.1837)
        annotation (Placement(transformation(extent={{-54,50},{-38,66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst ELMAX(k=
            106657909.932)
        annotation (Placement(transformation(extent={{14,64},{38,82}})));
      Physiolibrary.Types.Constants.FrequencyConst heartRate(k=1.2)
        annotation (Placement(transformation(extent={{-96,30},{-78,44}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{46,16},{66,36}})));
    equation
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-72,-18},{-50,-18},{-50,-3.44},{-31,-3.44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-17,12.8},{-17,25.4},{-15,25.4},{-15,59}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{31,-25},{31,-7.52},{5.64,-7.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ERMAX.y, rightHeart.maxelastance) annotation (Line(
          points={{-36,58},{-32,58},{-32,15.04},{-25.5,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ELMAX.y, leftHeart.maxelastance) annotation (Line(
          points={{41,73},{41,42.5},{10.26,42.5},{10.26,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, rightHeart.heartRate) annotation (Line(
          points={{-75.75,37},{-36,37},{-36,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.y, leftHeart.heartRate) annotation (Line(
          points={{-75.75,37},{-75.75,88},{1.44,88},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{17.4,6.4},{17.4,26},{46,26}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{66,26},{93,26},{93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.HR, leftHeart.heartRate) annotation (Line(
          points={{56,32.6},{56,88},{1.44,88},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Heart;

    model sistemapulmonararterial
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-106,-10},{-86,10}}),
            iconTransformation(extent={{-104,-12},{-84,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-12},{106,8}}),
            iconTransformation(extent={{88,-10},{108,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-72,-8},{-52,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00012)
        annotation (Placement(transformation(extent={{-30,-6},{-10,14}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k=0)
        annotation (Placement(transformation(extent={{-94,34},{-76,48}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=17771874.242419)
        annotation (Placement(transformation(extent={{-42,54},{-26,68}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 1479878.5003065)
        annotation (Placement(transformation(extent={{-90,64},{-74,80}})));
    equation
      connect(pulmonaryArteries.q_in, outflow) annotation (Line(
          points={{-20,4},{40,4},{40,-2},{96,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydraulicElastance2Compliance.y, pulmonaryArteries.compliance)
        annotation (Line(
          points={{-24,61},{-20,61},{-20,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-72,72},{-64,72},{-64,10.8},{-56.8,10.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-73.75,41},{-73.75,25.5},{-69.4,25.5},{-69.4,9.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-96,0},{-84,0},{-84,1.8},{-71.8,1.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, pulmonaryArteries.q_in) annotation (Line(
          points={{-52,2},{-36,2},{-36,4},{-20,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-78,20},{84,-30}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,-38},{86,-56}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end sistemapulmonararterial;

    model sistemapulmonarvenoso
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-104,-12},{-84,8}}),
            iconTransformation(extent={{-106,-10},{-86,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{88,-12},{108,8}}),
            iconTransformation(extent={{84,-14},{104,6}})));
      Physiolibrary.Hydraulic.Components.Conductor conductor(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
          useComplianceInput=true, volume_start=0.00024)
        annotation (Placement(transformation(extent={{62,-8},{82,12}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=4399638.784695)
        annotation (Placement(transformation(extent={{48,30},{72,52}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k(displayUnit="ml/(mmHg.s)") = 5.2504310309196e-08)
        annotation (Placement(transformation(extent={{-2,38},{18,54}})));
    equation
      connect(hydraulicElastance2Compliance.y, pulmonaryVeins.compliance)
        annotation (Line(
          points={{75,41},{75,19.5},{72,19.5},{72,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, conductor.cond) annotation (Line(
          points={{20.5,46},{20.5,26},{32,26},{32,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inflow, conductor.q_in) annotation (Line(
          points={{-94,-2},{-36,-2},{-36,0},{22,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(conductor.q_out, pulmonaryVeins.q_in) annotation (Line(
          points={{42,0},{58,0},{58,2},{72,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, outflow) annotation (Line(
          points={{72,2},{86,2},{86,-2},{98,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,30},{82,-38}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-42},{102,-56}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end sistemapulmonarvenoso;

    model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      sistemapulmonararterial sistemapulmonararterial1
        annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
      sistemapulmonarvenoso sistemapulmonarvenoso1
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-90,-10},{-70,10}}), iconTransformation(
              extent={{-108,-12},{-88,8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{70,-12},{90,8}}), iconTransformation(
              extent={{90,-10},{110,10}})));
    equation
      connect(inflow, sistemapulmonararterial1.inflow) annotation (Line(
          points={{-80,0},{-70,0},{-70,-0.2},{-61.4,-0.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sistemapulmonararterial1.outflow, sistemapulmonarvenoso1.inflow)
        annotation (Line(
          points={{-42.2,0},{22.4,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(sistemapulmonarvenoso1.outflow, outflow) annotation (Line(
          points={{41.4,-0.4},{60.7,-0.4},{60.7,-2},{80,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end PulmonaryCirculation;

    model SystemicCirculation
    extends Physiolibrary.Icons.SystemicCirculation;
      arteriaaorta arteriaaorta1
        annotation (Placement(transformation(extent={{48,-26},{76,12}})));
      circulatorosystemica circulatorosystemica1 annotation (Placement(
            transformation(
            extent={{-15,-21},{15,21}},
            rotation=180,
            origin={15,-7})));
      venacava venacava1 annotation (Placement(transformation(
            extent={{-17,-15},{17,15}},
            rotation=180,
            origin={-35,-7})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{86,-10},{106,10}}), iconTransformation(
              extent={{84,-8},{104,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-92,-10},{-72,10}}), iconTransformation(
              extent={{-102,-10},{-82,10}})));
    equation
      connect(inflow, arteriaaorta1.inflow) annotation (Line(
          points={{96,0},{86,0},{86,-7},{75.16,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta1.outflow, circulatorosystemica1.inflow) annotation (Line(
          points={{49.12,-7},{29.4,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(circulatorosystemica1.outflow, venacava1.inflow) annotation (Line(
          points={{0.9,-6.16},{-3.7,-6.16},{-3.7,-7},{-18.68,-7}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava1.outflow, outflow) annotation (Line(
          points={{-50.98,-6.4},{-59.7,-6.4},{-59.7,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end SystemicCirculation;

    model Hemodynamics_pure

      replaceable Heart heart
        annotation (Placement(transformation(extent={{-24,-22},{18,14}})));
      replaceable SystemicCirculation systemicCirculation
        annotation (Placement(transformation(extent={{-20,-66},{12,-34}})));
      PulmonaryCirculation pulmonaryCirculation
        annotation (Placement(transformation(extent={{-18,70},{16,102}})));
    equation
      connect(heart.leftHeartOutflow, systemicCirculation.inflow) annotation (
          Line(
          points={{2.46,-9.76},{26,-9.76},{26,-49.68},{11.04,-49.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (
          Line(
          points={{-18.72,-50},{-32,-50},{-32,-6.52},{-15.6,-6.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation (
         Line(
          points={{-15.6,2.48},{-34,2.48},{-34,85.68},{-17.66,85.68}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryCirculation.outflow, heart.leftHeartInflow) annotation (
          Line(
          points={{16,86},{28,86},{28,-0.4},{7.5,-0.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end Hemodynamics_pure;

    model arteriaaorta_controllable
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{-102,-10},{-82,10}}),
            iconTransformation(extent={{84,-10},{104,10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{86,-6},{106,14}}),
            iconTransformation(extent={{-102,-10},{-82,10}})));
      Cardiovascular.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{-62,2},{-42,22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
        useComplianceInput=true,
        volume_start=0.0001,
        ZeroPressureVolume=0)
        annotation (Placement(transformation(extent={{-20,4},{0,24}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        hydraulicConductance(k=0)
        annotation (Placement(transformation(extent={{-84,52},{-66,66}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        hydraulicElastance2Compliance(k=106657909.932)
        annotation (Placement(transformation(extent={{-32,72},{-16,86}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst
        hydraulicResistance(k(displayUnit="(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{-80,82},{-64,98}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{12,2},{32,22}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-14,18},{26,58}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,36})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{28,-26},{48,-6}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={66,28})));
    equation
      connect(hydraulicElastance2Compliance.y, arteries.compliance) annotation (
         Line(
          points={{-14,79},{-10,79},{-10,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicResistance.y, cardiacValve.outflowResistance)
        annotation (Line(
          points={{-62,90},{-54,90},{-54,20.8},{-46.8,20.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hydraulicConductance.y, cardiacValve.backflowConductance)
        annotation (Line(
          points={{-63.75,59},{-63.75,39.5},{-59.4,39.5},{-59.4,19.6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(inflow, cardiacValve.inflow) annotation (Line(
          points={{-92,0},{-78,0},{-78,11.8},{-61.8,11.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(cardiacValve.outflow, arteries.q_in) annotation (Line(
          points={{-42,12},{-26,12},{-26,14},{-10,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(arteries.q_in, flowPressureMeasurement.q_in) annotation (Line(
          points={{-10,14},{2,14},{2,12},{12,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowPressureMeasurement.q_out, outflow) annotation (Line(
          points={{32,12},{64,12},{64,4},{96,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(HR, flowPressureMeasurement.HR) annotation (Line(
          points={{6,38},{14,38},{14,18.6},{22,18.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.Pmean, Pmean) annotation (Line(
          points={{18.2,9},{18.2,-16},{38,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-76,16},{78,-20}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid), Text(
              extent={{-74,-22},{98,-44}},
              lineColor={0,0,255},
              fillColor={255,170,213},
              fillPattern=FillPattern.Solid,
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end arteriaaorta_controllable;

    model SystemicCirculation_controllable
    extends Physiolibrary.Icons.SystemicCirculation;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
          Placement(transformation(extent={{86,-10},{106,10}}), iconTransformation(
              extent={{84,-8},{104,12}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
          Placement(transformation(extent={{-92,-10},{-72,10}}), iconTransformation(
              extent={{-102,-10},{-82,10}})));
      venacava_controllable venacava1
        annotation (Placement(transformation(extent={{-20,-14},{-38,6}})));
      circulatorosystemica_controllable circulatorosystemica_controllable1
        annotation (Placement(transformation(extent={{24,-14},{4,6}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSO annotation (
          Placement(transformation(extent={{-22,12},{18,52}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={72,60})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput EVenaCava annotation (
         Placement(transformation(extent={{-92,16},{-52,56}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-74,58})));
      arteriaaorta_controllable arteriaaorta_controllable1
        annotation (Placement(transformation(extent={{44,-14},{64,6}})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{12,12},{52,52}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-18,64})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{72,22},{92,42}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,60})));
    equation
      connect(venacava1.outflow, outflow) annotation (Line(
          points={{-37.46,-4.4},{-59.73,-4.4},{-59.73,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacava1.inflow, circulatorosystemica_controllable1.outflow)
        annotation (Line(
          points={{-20.36,-4},{-8,-4},{-8,-4.4},{4.6,-4.4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RSO, circulatorosystemica_controllable1.RSO) annotation (Line(
          points={{-2,32},{24,32},{24,0.8},{14.6,0.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EVenaCava, venacava1.hydrauliccompliance) annotation (Line(
          points={{-72,36},{-52,36},{-52,34},{-29,34},{-29,1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(circulatorosystemica_controllable1.inflow,
        arteriaaorta_controllable1.outflow) annotation (Line(
          points={{23.6,-4},{44.8,-4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.inflow, inflow) annotation (Line(
          points={{63.4,-4},{80,-4},{80,0},{96,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.HR, HR) annotation (Line(
          points={{54,-0.4},{50,-0.4},{50,32},{32,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteriaaorta_controllable1.Pmean, Pmean) annotation (Line(
          points={{60.6,-1.2},{60.6,32.4},{82,32.4},{82,32}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end SystemicCirculation_controllable;

    model Heart_controllable
      extends Heart;
      Cardiovascular.Types.RealIO.HydraulicElastanceInput ERMax annotation (
          Placement(transformation(extent={{58,28},{98,68}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-20,50})));
      Cardiovascular.Types.RealIO.HydraulicElastanceInput hydraulicelastance1
        annotation (Placement(transformation(extent={{64,-20},{104,20}}),
            iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=270,
            origin={17,51})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end Heart_controllable;

    model Heart_controllable2
      extends Physiolibrary.Icons.Heart;
    //  extends Physiolibrary.Icons.RightHeart;

      RightHeart rightHeart
        annotation (Placement(transformation(extent={{-52,-32},{-2,24}})));
      LeftHeart leftHeart
        annotation (Placement(transformation(extent={{-12,-32},{30,16}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
        annotation (Placement(transformation(extent={{-86,-32},{-58,-4}}),
            iconTransformation(extent={{-70,-24},{-50,-4}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
        annotation (Placement(transformation(extent={{-30,44},{0,74}}),
            iconTransformation(extent={{-70,26},{-50,46}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
        annotation (Placement(transformation(extent={{16,-40},{46,-10}}),
            iconTransformation(extent={{40,10},{60,30}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
        annotation (Placement(transformation(extent={{78,-14},{108,16}}),
            iconTransformation(extent={{16,-42},{36,-22}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement
        flowPressureMeasurement
        annotation (Placement(transformation(extent={{46,16},{66,36}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ERMax annotation (
          Placement(transformation(extent={{-74,34},{-34,74}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-38,52})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ELMax annotation (
          Placement(transformation(extent={{-12,52},{28,92}}),  iconTransformation(
            extent={{-9,-9},{9,9}},
            rotation=270,
            origin={17,55})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-116,18},{-76,58}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={-7,45})));
      Physiolibrary.Types.RealIO.PressureOutput pressure annotation (Placement(
            transformation(extent={{46,-16},{66,4}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={48,44})));
    equation
      connect(rightHeartInflow, rightHeart.inflow) annotation (Line(
          points={{-72,-18},{-50,-18},{-50,-3.44},{-31,-3.44}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.outflow, rightHeartOutflow) annotation (Line(
          points={{-17,12.8},{-17,25.4},{-15,25.4},{-15,59}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftHeart.inflow) annotation (Line(
          points={{31,-25},{31,-7.52},{5.64,-7.52}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.outflow, flowPressureMeasurement.q_in) annotation (Line(
          points={{17.4,6.4},{17.4,26},{46,26}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(flowPressureMeasurement.q_out, leftHeartOutflow) annotation (Line(
          points={{66,26},{93,26},{93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(HR, rightHeart.heartRate) annotation (Line(
          points={{-96,38},{-67,38},{-67,15.04},{-36,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HR, leftHeart.heartRate) annotation (Line(
          points={{-96,38},{-68,38},{-68,90},{1.44,90},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.HR, leftHeart.heartRate) annotation (Line(
          points={{56,32.6},{54,32.6},{54,90},{1.44,90},{1.44,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ELMax, leftHeart.maxelastance) annotation (Line(
          points={{8,72},{10.26,72},{10.26,8.32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ERMax, rightHeart.maxelastance) annotation (Line(
          points={{-54,54},{-42,54},{-42,52},{-25.5,52},{-25.5,15.04}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowPressureMeasurement.Pmean, pressure) annotation (Line(
          points={{52.2,23},{52.2,10.5},{56,10.5},{56,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end Heart_controllable2;

    model Hemodynamics_with_baro
      extends Obsolete.Hemodynamics_pure(redeclare Obsolete.Heart_controllable2
                                                                                heart,
          redeclare Obsolete.SystemicCirculation_controllable systemicCirculation(
            venacava1(venacava(volume_start=0.0001))));

      Experiment.Baroreceptor baroreceptor(
        EV0right=115990477.05105,
        EV0left=106657909.932,
        EV0venacava=1.8751539396141e-06,
        RS0=81793284.679103)
        annotation (Placement(transformation(extent={{-18,36},{22,68}})));
    equation
      connect(baroreceptor.evleft, heart.ELMax) annotation (Line(
          points={{-1.2,57.76},{-1.2,17.52},{0.57,17.52},{0.57,5.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, heart.HR) annotation (Line(
          points={{-0.2,44.48},{-0.2,16.6},{-4.47,16.6},{-4.47,4.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evright, heart.ERMax) annotation (Line(
          points={{-10.4,57.12},{-10.4,5.36},{-10.98,5.36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evenacava, systemicCirculation.EVenaCava)
        annotation (Line(
          points={{-15.6,44.64},{-44,44.64},{-44,-40.72},{-15.84,-40.72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, systemicCirculation.HR) annotation (Line(
          points={{-0.2,44.48},{-0.2,-5.4},{-6.88,-5.4},{-6.88,-39.76}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicCirculation.RSO, baroreceptor.RS) annotation (Line(
          points={{7.52,-40.4},{40,-40.4},{40,44.64},{-8.8,44.64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.PAo, systemicCirculation.Pmean) annotation (Line(
          points={{10,44.64},{14,44.64},{14,-28},{2.4,-28},{2.4,-40.4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end Hemodynamics_with_baro;
  end Obsolete;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1"),
      MeursModel(version="2")));
  package Experiment
    model SystemicCirculation_baro
      extends FernandezModel.Parts.SystemicCirculation(
        redeclare Cardiovascular.Types.Constants.HydraulicConductanceControl
          RPS,
        redeclare Cardiovascular.Types.Constants.HydraulicComplianceControl ECV,

        redeclare Cardiovascular.Types.Constants.FrequencyControl heartRate);
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RPSin annotation (
          Placement(transformation(extent={{-58,30},{-18,70}}),
            iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={1,65})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECVin annotation (
          Placement(transformation(extent={{-136,28},{-96,68}}),
            iconTransformation(
            extent={{-12,-12},{12,12}},
            rotation=270,
            origin={-54,62})));
      Physiolibrary.Types.RealIO.FrequencyInput HRin annotation (Placement(
            transformation(extent={{-24,28},{16,68}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={51,59})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{46,-52},{66,-32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={86,34})));
    equation
      connect(RPS.c, RPSin) annotation (Line(
          points={{-5.5,25},{-16,25},{-16,50},{-38,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ECV.c, ECVin) annotation (Line(
          points={{-96,29},{-102,29},{-102,30},{-116,30},{-116,48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heartRate.c, HRin) annotation (Line(
          points={{17.5,33},{17.5,43.5},{-4,43.5},{-4,48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Pmean, Pmean) annotation (Line(
          points={{56,-42},{56,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.Pmean, Pmean) annotation (Line(
          points={{37.8,-5},{37.8,-42},{56,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -120,-60},{120,60}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
            graphics));
    end SystemicCirculation_baro;

    model Heart_baro
      extends Parts.Heart(
        redeclare Cardiovascular.Types.Constants.HydraulicComplianceControl
          ERMAX,
        redeclare Cardiovascular.Types.Constants.HydraulicComplianceControl
          ELMAX,
        redeclare Cardiovascular.Types.Constants.FrequencyControl heartRate);
      Physiolibrary.Types.RealIO.FrequencyInput HRin annotation (Placement(
            transformation(extent={{-132,42},{-92,82}}), iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={49,63})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ERMaxIn annotation (
          Placement(transformation(extent={{40,18},{0,58}}), iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-30,62})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ELMaxIn annotation (
          Placement(transformation(extent={{130,44},{90,84}}),
            iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=270,
            origin={16,62})));
    equation
      connect(HRin, heartRate.c) annotation (Line(
          points={{-112,62},{-101,62},{-101,55},{-81.5,55}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ERMAX.c, ERMaxIn) annotation (Line(
          points={{-20.5,45},{-2.25,45},{-2.25,38},{20,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ELMaxIn, ELMAX.c) annotation (Line(
          points={{110,64},{106,64},{106,52},{92,52}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -120,-60},{120,80}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,80}}),
            graphics));
    end Heart_baro;

    model Hemodynamics_baro
      extends Models.Hemodynamics_pure(redeclare Heart_baro heart, redeclare
          SystemicCirculation_baro systemicCirculation);
      Baroreceptor baroreceptor(
        activationDelay(displayUnit="s"),
        EV0right=115990477.05105,
        EV0left=106657909.932,
        EV0venacava=1.8751539396141e-06,
        RS0=81793284.679103)
        annotation (Placement(transformation(extent={{30,-22},{76,24}})));
    equation
      connect(baroreceptor.evenacava, systemicCirculation.ECVin) annotation (
          Line(
          points={{32.76,-9.58},{32.76,-22},{-10.45,-22},{-10.45,-27.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.RS, systemicCirculation.RPSin) annotation (Line(
          points={{40.58,-9.58},{40.58,-26},{-0.825,-26},{-0.825,-26.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, systemicCirculation.HRin) annotation (Line(
          points={{50.47,-9.81},{50.47,-28.3},{7.925,-28.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(systemicCirculation.Pmean, baroreceptor.PAo) annotation (Line(
          points={{14.05,-35.8},{62.2,-35.8},{62.2,-9.58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evright, heart.ERMaxIn) annotation (Line(
          points={{38.74,8.36},{38.74,18},{-8.25,18},{-8.25,9.37143}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evleft, heart.ELMaxIn) annotation (Line(
          points={{49.32,9.28},{49.32,22},{-0.2,22},{-0.2,9.37143}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.HRin, baroreceptor.HR) annotation (Line(
          points={{5.575,9.62857},{5.575,14},{28,14},{28,-2},{50.47,-2},{50.47,
              -9.81}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-60,-80},{60,80}},
              preserveAspectRatio=false), graphics), Icon(coordinateSystem(
              extent={{-60,-80},{60,80}})));
    end Hemodynamics_baro;

    model Baroreceptor
      Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1});
      Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048});
      Modelica.Blocks.Continuous.TransferFunction H3(a={15,1},b={0.154});// from orign.mo(a={30,1}, b={0.194});
      Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1});
      Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=0.1, uMin=-0.1);
      parameter Physiolibrary.Types.Pressure PAOmedia=13863.981751466;

      parameter Physiolibrary.Types.Frequency HR0Param=1.3333333333333
        annotation (Dialog(enable=not useConductanceInput));
      parameter Boolean useHRInput = false
        "=true, if external HR value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      Physiolibrary.Types.RealIO.FrequencyInput cond(start=HR0Param)=HR0 if useHRInput annotation (Placement(
            transformation(extent={{-62,36},{-22,76}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={34,36})));

      Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta" annotation (
          Placement(transformation(extent={{2,-58},{42,-18}}),
            iconTransformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={40,-46})));
      Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block" annotation (Placement(
            transformation(extent={{-76,60},{-56,80}}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=270,
            origin={-11,-47})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright annotation (
          Placement(transformation(extent={{80,22},{100,42}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=90,
            origin={-62,32})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation (
          Placement(transformation(extent={{78,-18},{98,2}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=90,
            origin={-16,36})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava annotation (
          Placement(transformation(extent={{78,-54},{98,-34}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=270,
            origin={-88,-46})));
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation (
          Placement(transformation(extent={{80,-90},{100,-70}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-54,-46})));
      parameter Physiolibrary.Types.HydraulicElastance EV0right=106657909.932, EV0left=103991462.1837;
    /*    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=4.5003694550739e-09
    
    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=1.8751539396141e-06,
    RS0(displayUnit="ml/(mmHg.s)") = 4.6016277678131e-09)*/
      parameter Physiolibrary.Types.HydraulicCompliance EV0venacava=3.0002463033826e-11;
      parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit="(mmHg.s)/ml") = 106657909.932;
      parameter Physiolibrary.Types.Time activationDelay=40;

    //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
      Physiolibrary.Types.Frequency HR0;
    equation
      if not useHRInput then
        HR0=HR0Param;
      end if;
      if time>activationDelay then
      deadZone.u=(PAOmedia-PAo)/133.322387415/2;
      else
        deadZone.u=0;
      end if;
      H1.u =deadZone.y;
      HR = (HR0*60+H1.y)/60; //recount to SI Hz
      H2.u = deadZone.y;
      evright = 1/(EV0right+ H2.y*(1e+6)*(133.322387415)); //recount to SI
      evleft = 1/(EV0left+ H2.y*(1e+6)*(133.322387415)); //recount to SI
      H3.u = deadZone.y;
      evenacava = (EV0venacava+ H3.y*(1e-6)/(133.322387415));
      H4.u = deadZone.y;
      RS = 1/(RS0+ H4.y*(1e+6)*(133.322387415)); //recount to conductance
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(
              extent={{56,22},{-72,-30}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-24,-8},{0,-32}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{-100,18},{-28,0}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVright"),
            Text(
              extent={{-58,18},{28,0}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVleft"),
            Text(
              extent={{-148,-12},{-34,-28}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="ECV"),
            Text(
              extent={{-86,-12},{-12,-32}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="RPS"),
            Text(
              extent={{60,62},{84,38}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HRInit"),
            Text(
              extent={{26,-10},{50,-28}},
              lineColor={0,0,127},
              textString="PAo")}),Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end Baroreceptor;
  end Experiment;
end FernandezModel;
