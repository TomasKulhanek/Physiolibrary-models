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
      Cardiovascular.Blocks.Interpolation.Curve curve(
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
      connect(curve.val, hydrauliccompliance1.hydraulicelastance) annotation (Line(
          points={{-10,58},{-6,58},{-6,57.9},{-0.1,57.9}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
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
              points={{-52,4},{-44,22},{-36,48},{-30,48},{-28,36},{-26,6},{-20,6},{0,
                  6}},
              color={0,0,255},
              smooth=Smooth.Bezier)}), Diagram(coordinateSystem(preserveAspectRatio=
               false, extent={{-100,-100},{100,100}}), graphics));
    end VariableElasticityGenerator;

    model Heart
      extends Cardiovascular.Heart;

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
                                                   heartRate(k=1.3333333333333)
        annotation (Placement(transformation(extent={{-86,48},{-68,62}})));
      Cardiovascular.Hydraulic.Components.CardiacValve tricuspidValve
        annotation (Placement(transformation(extent={{-74,-42},{-54,-22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00015)
        annotation (Placement(transformation(extent={{-50,-8},{-30,12}})));
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
        annotation (Placement(transformation(extent={{66,-10},{86,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst backflowConductance1(k=0)
        annotation (Placement(transformation(extent={{18,-22},{36,-8}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RLV(k(displayUnit="(mmHg.s)/ml")=
             7839356.380002)
        annotation (Placement(transformation(extent={{40,-12},{56,4}})));
      VariableElasticityGenerator variableElasticityGenerator(const(k=0.87))
        annotation (Placement(transformation(extent={{-70,4},{-22,46}})));
      VariableElasticityGenerator variableElasticityGenerator1(
        const(k=0.8),
        curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,0.25,0.0033,0.0033}, slope={0,5.0136,
              2.56,1.36,0.24,-4.4,-6.0536,0,0}))
        annotation (Placement(transformation(extent={{56,2},{104,44}})));
    equation
      connect(RRV.y, tricuspidValve.outflowResistance) annotation (Line(
          points={{-58,-2},{-58,-23.2},{-58.8,-23.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(backflowConductance.y, tricuspidValve.backflowConductance)
        annotation (Line(
          points={{-85.75,-9},{-85.75,-12},{-86,-12},{-86,-16},{-71.4,-16},{-71.4,-24.4}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(rightHeartInflow, tricuspidValve.inflow) annotation (Line(
          points={{-100,-20},{-82,-20},{-82,-32.2},{-73.8,-32.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(backflowConductance1.y, mitralValve.backflowConductance) annotation (
          Line(
          points={{38.25,-15},{38.25,-13.5},{42.6,-13.5},{42.6,-20.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RLV.y, mitralValve.outflowResistance) annotation (Line(
          points={{58,-4},{58,-19.2},{55.2,-19.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(variableElasticityGenerator.hydrauliccompliance, rightVentricle.compliance)
        annotation (Line(
          points={{-49.36,22.06},{-49.36,15.45},{-40,15.45},{-40,10}},
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
          points={{76.64,20.06},{76.64,15.45},{76,15.45},{76,8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartRate.y, variableElasticityGenerator1.heartRate) annotation (Line(
          points={{-65.75,55},{71.12,55},{71.12,39.17}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(ELMAX.y, variableElasticityGenerator1.maxelastance) annotation (Line(
          points={{78,52},{78,52.5},{79.04,52.5},{79.04,38.96}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(tricuspidValve.outflow, rightVentricle.q_in) annotation (Line(
          points={{-54,-32},{-26,-32},{-26,2},{-40,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightVentricle.q_in, rightHeartOutflow) annotation (Line(
          points={{-40,2},{-52,2},{-52,20},{-100,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, mitralValve.inflow) annotation (Line(
          points={{100,20},{100,-44},{34,-44},{34,-28.2},{40.2,-28.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(mitralValve.outflow, leftVentricle.q_in) annotation (Line(
          points={{60,-28},{72,-28},{72,-30},{90,-30},{90,0},{76,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftVentricle.q_in, leftHeartOutflow) annotation (Line(
          points={{76,0},{60,0},{60,20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,80}}),        graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,80}}),
            graphics));
    end Heart;

    model SystemicCirculation
    extends Cardiovascular.SystemicCirculation;

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
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EAO(k=106657909.932)
        annotation (Placement(transformation(extent={{32,14},{48,28}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RAO(k(displayUnit="(mmHg.s)/ml")=
             1666529.8426875)
        annotation (Placement(transformation(extent={{56,18},{72,34}})));
      Physiolibrary.Hydraulic.Components.Conductor peripheralResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{20,-14},{0,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel peripheralVessels(
          useComplianceInput=true, volume_start=0.00334)
        annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPS(k(
            displayUnit="(mmHg.s)/ml") = 81793284.679103)
        annotation (Placement(transformation(extent={{-10,16},{8,34}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(k=2039832.5274495)
        annotation (Placement(transformation(extent={{-38,18},{-22,32}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-40,-14},{-60,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(useComplianceInput=true,
          volume_start=0.0005)
        annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        ECV(k(displayUnit="mmHg/ml") = 533289.54966)
        annotation (Placement(transformation(extent={{-100,22},{-84,36}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RCV(k(
            displayUnit="(mmHg.s)/ml") = 80793366.77349)
        annotation (Placement(transformation(extent={{-70,18},{-52,36}})));
      Cardiovascular.Hydraulic.Components.AortaFlowMeasurement bloodFlowMeasurement
        annotation (Placement(transformation(extent={{44,-12},{24,8}})));
    equation
      connect(aorticValve.inflow, inflow) annotation (Line(
          points={{87.8,0.78},{95.9,0.78},{95.9,0},{100,0}},
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
      connect(backflowConductance.y, aorticValve.backflowConductance) annotation (
          Line(
          points={{89.75,25},{89.75,22.5},{85.4,22.5},{85.4,9.36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, peripheralResistance.q_out) annotation (Line(
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
          points={{-82,2.22045e-016},{-92,2.22045e-016},{-92,0},{-100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorticValve.outflowResistance, RAO.y) annotation (Line(
          points={{72.8,10.68},{72.8,18.34},{74,18.34},{74,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralResistance.q_in, bloodFlowMeasurement.q_out) annotation (
          Line(
          points={{20,-2},{24,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_in, aorta.q_in) annotation (Line(
          points={{44,-2},{50,-2},{50,0},{54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,60}}),   graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
            graphics));
    end SystemicCirculation;

    model PulmonaryCirculation
      extends Cardiovascular.PulmonaryCirculation;

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
          points={{-100,0},{-68,0},{-68,5.8},{-55.8,5.8}},
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
          points={{100,0},{82,0},{82,6},{62,6}},
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

    model SystemicCirculation_test "with bloodflowmeasurement need heart rate"
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
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EAO(k=106657909.932)
        annotation (Placement(transformation(extent={{32,14},{48,28}})));
      Physiolibrary.Types.Constants.HydraulicResistanceConst RAO(k(displayUnit="(mmHg.s)/ml")=
             1666529.8426875)
        annotation (Placement(transformation(extent={{56,18},{72,34}})));
      Physiolibrary.Hydraulic.Components.Conductor peripheralResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{20,-14},{0,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel peripheralVessels(
          useComplianceInput=true, volume_start=0.00334)
        annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RPS(k(
            displayUnit="(mmHg.s)/ml") = 81793284.679103)
        annotation (Placement(transformation(extent={{-10,16},{8,34}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(k=2039832.5274495)
        annotation (Placement(transformation(extent={{-38,18},{-22,32}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-40,-14},{-60,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(useComplianceInput=true,
          volume_start=0.0005)
        annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        ECV(k=533289.54966)
        annotation (Placement(transformation(extent={{-100,22},{-84,36}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst RCV(k(
            displayUnit="(mmHg.s)/ml") = 80793366.77349)
        annotation (Placement(transformation(extent={{-70,18},{-52,36}})));
      Cardiovascular.Hydraulic.Components.BloodFlowMeasurement bloodFlowMeasurement
        annotation (Placement(transformation(extent={{24,-12},{44,8}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                   heartRate(k=1.2)
        annotation (Placement(transformation(extent={{10,34},{28,48}})));
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
      connect(backflowConductance.y, aorticValve.backflowConductance) annotation (
          Line(
          points={{89.75,25},{89.75,22.5},{85.4,22.5},{85.4,9.36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, peripheralResistance.q_out) annotation (Line(
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
      connect(bloodFlowMeasurement.q_out, aorta.q_in) annotation (Line(
          points={{44,-2},{50,-2},{50,0},{54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_in, peripheralResistance.q_in) annotation (
          Line(
          points={{24,-2},{20,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(heartRate.y, bloodFlowMeasurement.HR) annotation (Line(
          points={{30.25,41},{30.25,23.5},{34,23.5},{34,4.6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,60}}),   graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
            graphics));
    end SystemicCirculation_test;
  end Parts;

  package Models

    model HemodynamicsFernandez
      extends Cardiovascular.System(
        redeclare Parts.PulmonaryCirculation pulmonaryCirculation,
        redeclare Parts.Heart heart,
        redeclare Parts.SystemicCirculation systemicCirculation);

    end HemodynamicsFernandez;

    model Hemodynamics_stenosiswithbarocontrol
      Experiments.Hemodynamics_controllable hemodynamics_baro
        annotation (Placement(transformation(extent={{-96,-52},{-2,60}})));
      Experiments.Baroreceptor baroreceptor(
        EV0venacava(displayUnit="ml/mmHg"),
        activationDelay(displayUnit="s"),
        PAOmedia=13265.17758063)
        annotation (Placement(transformation(extent={{-8,-44},{58,22}})));
      Experiments.Stenosis stenosis(
        InitialElastance(displayUnit="mmHg/ml"),
        FinalElastance(displayUnit="mmHg/ml"),
        startTime(displayUnit="s"),
        duration(displayUnit="s"))
        annotation (Placement(transformation(extent={{-78,-82},{-30,-38}})));
    equation
      connect(hemodynamics_baro.Pmean, baroreceptor.PAo) annotation (Line(
          points={{-28.6333,-46.4},{-3.31665,-46.4},{-3.31665,-38.06},{-0.08,
              -38.06}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evenacava, hemodynamics_baro.ECV) annotation (Line(
          points={{-0.74,-30.14},{-22.37,-30.14},{-22.37,-32.4},{-47.4333,-32.4}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(baroreceptor.RS, hemodynamics_baro.RSP) annotation (Line(
          points={{-0.08,-18.92},{-17.04,-18.92},{-17.04,-22.6},{-36.4667,-22.6}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(baroreceptor.evright, hemodynamics_baro.ERMax) annotation (Line(
          points={{-0.08,-7.7},{-22.04,-7.7},{-22.04,-7.2},{-49,-7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.evleft, hemodynamics_baro.ELMax) annotation (Line(
          points={{-1.4,2.86},{-18.7,2.86},{-18.7,2.6},{-39.6,2.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(baroreceptor.HR, hemodynamics_baro.HR) annotation (Line(
          points={{-1.73,13.75},{-21.865,13.75},{-21.865,15.2},{-44.3,15.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(stenosis.hydrauliccompliance, baroreceptor.ECV0) annotation (Line(
          points={{-52.08,-54.72},{33.58,-54.72},{33.58,-28.82}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end Hemodynamics_stenosiswithbarocontrol;

    model Hemodynamics_stenosiswithoutbaro
      Experiments.Hemodynamics_VCStenosis hemodynamics_VCStenosis
        annotation (Placement(transformation(extent={{-76,-66},{-2,72}})));
      Experiments.Stenosis stenosis
        annotation (Placement(transformation(extent={{-44,-88},{8,-44}})));
    equation
      connect(stenosis.hydrauliccompliance, hemodynamics_VCStenosis.ECV)
        annotation (Line(
          points={{-15.92,-60.72},{-15.92,-34.95},{-33.45,-34.95}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end Hemodynamics_stenosiswithoutbaro;
  end Models;

  package Experiments
    model SystemicCirculation_baro
      extends FernandezModel.Parts.SystemicCirculation(
        redeclare Cardiovascular.Types.Constants.HydraulicConductanceControl RPS,
        redeclare Cardiovascular.Types.Constants.HydraulicComplianceControl ECV);
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RPSin annotation (
          Placement(transformation(extent={{-58,30},{-18,70}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={1,65})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECVin annotation (
          Placement(transformation(extent={{-132,26},{-92,66}}), iconTransformation(
            extent={{-12,-12},{12,12}},
            rotation=270,
            origin={-54,62})));
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
          points={{-96,29},{-102,29},{-102,30},{-112,30},{-112,46}},
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
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
                -60},{120,80}}),
                            graphics), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-120,-60},{120,80}}), graphics));
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

    model Hemodynamics_controllable
      extends Models.HemodynamicsFernandez(
                                       redeclare Heart_baro heart, redeclare
          SystemicCirculation_baro systemicCirculation);
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ELMax annotation (
          Placement(transformation(extent={{18,8},{58,48}}), iconTransformation(
            extent={{-8,-8},{8,8}},
            rotation=180,
            origin={12,-2})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ERMax annotation (
          Placement(transformation(extent={{-68,-4},{-28,36}}), iconTransformation(
            extent={{-8,-8},{8,8}},
            rotation=180,
            origin={0,-16})));
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{22,-18},{62,22}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={6,16})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput RSP annotation (
          Placement(transformation(extent={{-62,-42},{-22,-2}}), iconTransformation(
            extent={{-8,-8},{8,8}},
            rotation=180,
            origin={16,-38})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECV annotation (Placement(
            transformation(extent={{-70,-66},{-30,-26}}), iconTransformation(
            extent={{-8,-8},{8,8}},
            rotation=180,
            origin={2,-52})));
      Physiolibrary.Types.RealIO.PressureOutput Pmean annotation (Placement(
            transformation(extent={{32,-40},{52,-20}}), iconTransformation(extent={{
                20,-78},{32,-66}})));
    equation

      connect(Pmean, systemicCirculation.Pmean) annotation (Line(
          points={{42,-30},{14.05,-30},{14.05,-39.8286}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RSP, systemicCirculation.RPSin) annotation (Line(
          points={{-42,-22},{-0.825,-22},{-0.825,-31.8571}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.ELMaxIn, ELMax) annotation (Line(
          points={{-0.2,9.37143},{-0.2,28},{38,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.ERMaxIn, ERMax) annotation (Line(
          points={{-8.25,9.37143},{-8.25,15.6857},{-48,15.6857},{-48,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heart.HRin, HR) annotation (Line(
          points={{5.575,9.62857},{5.575,14},{34,14},{34,2},{42,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ECV, systemicCirculation.ECVin) annotation (Line(
          points={{-50,-46},{-34,-46},{-34,-32.6286},{-10.45,-32.6286}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-60,-80},{60,80}},
              preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-60,-80},
                {60,80}}, preserveAspectRatio=false), graphics));
    end Hemodynamics_controllable;

    model Baroreceptor
      Modelica.Blocks.Continuous.TransferFunction H1(a={15,1}, b={1});
      Modelica.Blocks.Continuous.TransferFunction H2(a={15,1}, b={0.048});
      Modelica.Blocks.Continuous.TransferFunction H3(a={15,1},b={0.154});// from orign.mo(a={30,1}, b={0.194});
      Modelica.Blocks.Continuous.TransferFunction H4(a={2,1}, b={0.1});
      Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=0.1, uMin=-0.1);
      parameter Physiolibrary.Types.Pressure PAOmedia=13465.561128915;

      parameter Physiolibrary.Types.Frequency HR0Param=1.3333333333333
        annotation (Dialog(enable=not useConductanceInput));
      parameter Boolean useHRInput = false
        "=true, if external HR value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      Physiolibrary.Types.RealIO.FrequencyInput cond(start=HR0Param)=HR0 if useHRInput annotation (Placement(
            transformation(extent={{-62,36},{-22,76}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={26,76})));

      Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta" annotation (
          Placement(transformation(extent={{2,-58},{42,-18}}),
            iconTransformation(extent={{-16,-16},{16,16}},
            rotation=0,
            origin={-76,-82})));
      Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block" annotation (Placement(
            transformation(extent={{-76,60},{-56,80}}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={-81,75})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright annotation (
          Placement(transformation(extent={{80,22},{100,42}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=180,
            origin={-76,10})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation (
          Placement(transformation(extent={{78,-18},{98,2}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=180,
            origin={-80,42})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava annotation (
          Placement(transformation(extent={{78,-54},{98,-34}}), iconTransformation(
              extent={{-16,-16},{16,16}},
            rotation=180,
            origin={-78,-58})));
      Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation (
          Placement(transformation(extent={{80,-90},{100,-70}}), iconTransformation(
              extent={{-14,-14},{14,14}},
            rotation=180,
            origin={-76,-24})));
      parameter Physiolibrary.Types.HydraulicElastance EV0right=115990477.05105, EV0left=106657909.932;
    /*    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=4.5003694550739e-09
    
    PAOmedia=13465.561128915,
    EV0right=106657909.932,
    EV0left=103991462.1837,
    EV0venacava=1.8751539396141e-06,
    RS0(displayUnit="ml/(mmHg.s)") = 4.6016277678131e-09)
    
    EV0right=115990477.05105,
    EV0left=106657909.932,
    EV0venacava=1.8751539396141e-06,
    RS0=81793284.67910*/
      parameter Physiolibrary.Types.HydraulicCompliance EV0venacava=1.8751539396141e-06;
      parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit="(mmHg.s)/ml") = 81793284.67910;
      parameter Physiolibrary.Types.Time activationDelay=15;

    //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
      Physiolibrary.Types.Frequency HR0;
    public
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECV0 annotation (
          Placement(transformation(extent={{-204,-96},{-164,-56}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={26,-54})));
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
      evenacava = (ECV0+ H3.y*(1e-6)/(133.322387415));
      H4.u = deadZone.y;
      RS = 1/(RS0+ H4.y*(1e+6)*(133.322387415)); //recount to conductance
      connect(evenacava, evenacava) annotation (Line(
          points={{88,-44},{88,-37},{88,-37},{88,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Ellipse(
              extent={{28,102},{-68,-110}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-58,88},{24,64}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="HR"),
            Text(
              extent={{-68,20},{4,2}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVright"),
            Text(
              extent={{-78,58},{8,40}},
              lineColor={0,0,127},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="EVleft"),
            Text(
              extent={{-96,-48},{18,-64}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="ECV"),
            Text(
              extent={{-76,-14},{-2,-34}},
              lineColor={0,0,127},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="RPS"),
            Text(
              extent={{-48,-80},{-24,-98}},
              lineColor={0,0,127},
              textString="PAo"),
            Text(
              extent={{-98,-104},{116,-120}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
                                  Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end Baroreceptor;

    model SystemicCirculation_VCStenosis
      extends Parts.SystemicCirculation(redeclare
          Cardiovascular.Types.Constants.HydraulicComplianceControl ECV);
      Physiolibrary.Types.RealIO.HydraulicComplianceInput EVCin annotation (
          Placement(transformation(extent={{-136,28},{-96,68}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-84,34})));
    equation
      connect(EVCin, ECV.c) annotation (Line(
          points={{-116,48},{-108,48},{-108,29},{-96,29}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -120,-60},{120,60}}), graphics));
    end SystemicCirculation_VCStenosis;

    model Hemodynamics_VCStenosis
      extends Models.HemodynamicsFernandez(
                                       redeclare SystemicCirculation_VCStenosis
          systemicCirculation);
      Physiolibrary.Types.RealIO.HydraulicComplianceInput ECV annotation (Placement(
            transformation(extent={{-64,-54},{-24,-14}}), iconTransformation(
            extent={{-8,-8},{8,8}},
            rotation=180,
            origin={6,-44})));
    equation
      connect(ECV, systemicCirculation.EVCin) annotation (Line(
          points={{-44,-34},{-32,-34},{-32,-35.8},{-15.7,-35.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -40,-80},{40,80}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-40,-80},{40,80}}), graphics));
    end Hemodynamics_VCStenosis;

    model Hemodynamics_baro_VCStenosis
      extends Hemodynamics_controllable(redeclare Baroreceptor_VCStenosis
          baroreceptor(stenosisDelay(displayUnit="s") = 20, activationDelay(
              displayUnit="s") = 15));
    end Hemodynamics_baro_VCStenosis;

    model Stenosis
      parameter Physiolibrary.Types.HydraulicElastance InitialElastance(displayUnit="mmHg/ml") = 533289.54966;
      parameter Physiolibrary.Types.HydraulicElastance  FinalElastance(displayUnit="mmHg/ml") = 266644.77483;
      parameter Physiolibrary.Types.Time startTime(displayUnit="s") = 20;
      parameter Physiolibrary.Types.Time duration(displayUnit="s") = 5;
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput hydrauliccompliance
        annotation (Placement(transformation(extent={{48,-10},{68,10}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={8,24})));
    equation
      hydrauliccompliance = 1 / (InitialElastance + (if time < startTime then
        0 else if time < (startTime + duration) then
          (time - startTime)*(FinalElastance-InitialElastance)/duration else
          (FinalElastance-InitialElastance)));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Rectangle(
              extent={{-64,14},{80,-32}},
              lineThickness=1,
              fillColor={190,0,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-36,36},{52,-2}},
              lineThickness=1,
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-36,-10},{52,-48}},
              lineThickness=1,
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Rectangle(
              extent={{-64,42},{80,14}},
              lineThickness=1,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{-64,-32},{80,-60}},
              lineThickness=1,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Text(
              extent={{-56,-46},{76,-58}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid,
              textString="%name")}),       Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Stenosis;
  end Experiments;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1"),
      MeursModel(version="2")));
end FernandezModel;
