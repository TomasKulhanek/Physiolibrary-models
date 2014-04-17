within ;
package FernandezModel
  package Parts
    model Circulation
                      extends Physiolibrary.Icons.CardioVascular;

    end Circulation;

    model VentricleRight "ventriculo derecho"
      extends Physiolibrary.Icons.RightHeart;
    end VentricleRight;

    model VentricleLeft "ventriculo izquierdo"
      extends Physiolibrary.Icons.LeftHeart;
    end VentricleLeft;

    model pulsos "generates relative position in heart period from 0 to 1"

      Physiolibrary.Types.RealIO.TimeInput timeInput annotation (Placement(
            transformation(extent={{-96,-32},{-56,8}}), iconTransformation(extent={{
                -96,-32},{-56,8}})));
      Physiolibrary.Types.RealIO.TimeOutput timeOutput annotation (Placement(
            transformation(extent={{86,-12},{106,8}}), iconTransformation(extent={{74,
                -24},{106,8}})));


    equation
    /*  p2 = 1/timeInput * time;
  p1 = time /timeInput;
  a2 = p2;
  RtoI = integer(a2);
  a1 = p1-RtoI;
  timeOutput = a1;*/

      timeOutput = (time - integer(time/timeInput)*timeInput)/timeInput;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(extent={{-46,52},{68,-78}},
                lineColor={0,0,255})}));
    end pulsos;

    model venderecho "right ventricle"
      pulsos pulsos1
        annotation (Placement(transformation(extent={{-68,0},{-48,20}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel ventricle(
        useV0Input=true,
        useComplianceInput=true,
        useExternalPressureInput=true)
        annotation (Placement(transformation(extent={{-10,-14},{10,6}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a
        annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
      PhysiolibraryExtension.Types.RealIO.HydraulicElastanceToCompliance
        hydrauliccompliance annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=270,
            origin={0,16})));
      PhysiolibraryExtension.Hydraulic.Components.CardiacValve cardiacValve
        annotation (Placement(transformation(extent={{24,-16},{44,4}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,52})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={-1,29})));
      Physiolibrary.Blocks.Interpolation.Curve curve(
        x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
        y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
        slope={0,2.5072,2.32,2.44,2.64,-2.84,-6.1872,-0.42144,0})
        annotation (Placement(transformation(extent={{-40,54},{-20,74}})));
    equation
      connect(port_a, ventricle.q_in) annotation (Line(
          points={{-60,-20},{-30,-20},{-30,-4},{0,-4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(hydrauliccompliance.y, ventricle.compliance) annotation (Line(
          points={{0,11},{0,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricle.q_in, cardiacValve.bloodFlowInflow) annotation (Line(
          points={{0,-4},{12,-4},{12,-6.2},{24.2,-6.2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(product.y, product1.u2) annotation (Line(
          points={{-1.9984e-015,41},{-10,41},{-10,35},{-4,35}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, hydrauliccompliance.hydraulicelastance) annotation (
          Line(
          points={{-1,23.5},{-1,21.75},{-0.1,21.75},{-0.1,20.1}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.u2, curve.val) annotation (Line(
          points={{-6,64},{-20,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.timeOutput, curve.u) annotation (Line(
          points={{-49,9.2},{-49,40},{-50,40},{-50,64},{-40,64}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),      graphics));
    end venderecho;
  end Parts;

  package Test
    model testpulsos
      Parts.pulsos pulsos
        annotation (Placement(transformation(extent={{-24,-2},{-4,18}})));
      Physiolibrary.Types.Constants.TimeConst timeConst(k(displayUnit="s")=
          0.7) annotation (Placement(transformation(extent={{-48,6},{-40,14}})));
    equation
      connect(timeConst.y, pulsos.timeInput) annotation (Line(
          points={{-39,10},{-30,10},{-30,6.8},{-21.6,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end testpulsos;
  end Test;
  annotation (uses(Physiolibrary(version="2.1"), Modelica(version="3.2.1")));
end FernandezModel;
