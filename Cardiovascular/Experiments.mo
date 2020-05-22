within Cardiovascular;
package Experiments

  model CatheterDataFitting
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LongerDrain(r=0.0018,
        l=0.31)
      annotation (Placement(transformation(extent={{42,2},{22,22}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-30,22},{-10,2}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedVolume unlimitedVolume
      annotation (Placement(transformation(extent={{100,-20},{80,0}})));
    Modelica.Blocks.Sources.Ramp ramp(height=0.00012,duration=1)
      annotation (Placement(transformation(extent={{-88,-12},{-68,8}})));
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR ShorterOutflow(l=0.22,
        r=0.0014)
      annotation (Placement(transformation(extent={{44,-26},{24,-6}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump1(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-30,-26},{-10,-6}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump2(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-28,72},{-8,52}})));
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LVDrainExtension(l=1.2,
        r=0.0018)
      annotation (Placement(transformation(extent={{44,52},{24,72}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump3(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-28,98},{-8,78}})));
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR VenousDrain(l=0.33, r=
          0.0021)
      annotation (Placement(transformation(extent={{42,78},{22,98}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump ECMOExp(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-30,-170},{-10,-150}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump4(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-22,-76},{-2,-96}})));
    Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
      LVDrainExp(Base=5.53E+11, Exp=1.771662)
      annotation (Placement(transformation(extent={{28,-96},{48,-76}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump unlimitedPump5(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-22,-50},{-2,-70}})));
    Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
      VenousDrainExp(Base=6.2e11, Exp=1.855311)
      annotation (Placement(transformation(extent={{28,-70},{48,-50}})));
    Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
      VenousDrainECMOExp(Base=6.2e11, Exp=1.855311)
      annotation (Placement(transformation(extent={{20,-168},{40,-148}})));
    Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
      LVDrainECMOExp(Exp=1.771662, Base=4*5.53E+11)
      annotation (Placement(transformation(extent={{40,-192},{20,-172}})));
    Physiolibrary.Hydraulic.Sources.UnlimitedPump ECMOLin(
        useSolutionFlowInput=true)
      annotation (Placement(transformation(extent={{-32,-216},{-12,-196}})));
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR LVDrainECMOLin(l=1.2,
        r=0.0018)
      annotation (Placement(transformation(extent={{40,-240},{20,-220}})));
    Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR VenousDrainECMOLin(l=
          0.33, r=0.0021)
      annotation (Placement(transformation(extent={{40,-214},{20,-194}})));
  equation
    connect(ramp.y, unlimitedPump.solutionFlow)
      annotation (Line(points={{-67,-2},{-20,-2},{-20,5}}, color={0,0,127}));
    connect(unlimitedPump.q_out, LongerDrain.cOut) annotation (Line(
        points={{-10,12},{24,12}},
        color={0,0,0},
        thickness=1));
    connect(LongerDrain.cIn, unlimitedVolume.y) annotation (Line(points={{40,
            12},{60,12},{60,-10},{80,-10}}, color={127,0,0}));
    connect(ShorterOutflow.cIn, unlimitedVolume.y) annotation (Line(points={{
            42,-16},{62,-16},{62,-10},{80,-10}}, color={127,0,0}));
    connect(unlimitedPump1.q_out, ShorterOutflow.cOut) annotation (Line(
        points={{-10,-16},{26,-16}},
        color={0,0,0},
        thickness=1));
    connect(unlimitedPump1.solutionFlow, unlimitedPump.solutionFlow)
      annotation (Line(points={{-20,-9},{-32,-9},{-32,-2},{-20,-2},{-20,5}},
          color={0,0,127}));
    connect(ramp.y, unlimitedPump2.solutionFlow) annotation (Line(points={{-67,
            -2},{-42,-2},{-42,55},{-18,55}}, color={0,0,127}));
    connect(unlimitedPump2.q_out, LVDrainExtension.cOut) annotation (Line(
        points={{-8,62},{26,62}},
        color={0,0,0},
        thickness=1));
    connect(LVDrainExtension.cIn, unlimitedVolume.y) annotation (Line(points=
            {{42,62},{56,62},{56,60},{80,60},{80,-10}}, color={127,0,0}));
    connect(unlimitedPump3.q_out, VenousDrain.cOut) annotation (Line(
        points={{-8,88},{24,88}},
        color={0,0,0},
        thickness=1));
    connect(VenousDrain.cIn, unlimitedVolume.y) annotation (Line(points={{40,
            88},{56,88},{56,86},{80,86},{80,-10}}, color={127,0,0}));
    connect(unlimitedPump3.solutionFlow, unlimitedPump2.solutionFlow)
      annotation (Line(points={{-18,81},{-18,55}}, color={0,0,127}));
    connect(ramp.y, unlimitedPump4.solutionFlow) annotation (Line(points={{-67,
            -2},{-46,-2},{-46,-93},{-12,-93}}, color={0,0,127}));
    connect(unlimitedPump5.solutionFlow, unlimitedPump4.solutionFlow)
      annotation (Line(points={{-12,-67},{-12,-70},{-2,-70},{-2,-74},{-12,-74},
            {-12,-93}}, color={0,0,127}));
    connect(ECMOExp.solutionFlow, unlimitedPump4.solutionFlow) annotation (
        Line(
        points={{-20,-153},{-14,-153},{-14,-93},{-12,-93}},
        color={0,0,127},
        smooth=Smooth.Bezier));
    connect(unlimitedPump5.q_out, VenousDrainExp.cIn) annotation (Line(
        points={{-2,-60},{30,-60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.Bezier));
    connect(unlimitedPump4.q_out, LVDrainExp.cIn) annotation (Line(
        points={{-2,-86},{30,-86}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.Bezier));
    connect(ECMOExp.q_out, VenousDrainECMOExp.cIn) annotation (Line(
        points={{-10,-160},{8,-160},{8,-158},{22,-158}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.Bezier));
    connect(VenousDrainECMOExp.cOut, LVDrainExp.cOut) annotation (Line(
        points={{38,-158},{46,-158},{46,-86}},
        color={229,133,64},
        smooth=Smooth.Bezier));
    connect(LVDrainExp.cOut, VenousDrainExp.cOut) annotation (Line(
        points={{46,-86},{46,-60}},
        color={229,133,64},
        smooth=Smooth.Bezier));
    connect(VenousDrainExp.cOut, unlimitedVolume.y) annotation (Line(
        points={{46,-60},{66,-60},{66,-10},{80,-10}},
        color={229,133,64},
        smooth=Smooth.Bezier));
    connect(ECMOLin.solutionFlow, ECMOExp.solutionFlow) annotation (Line(
        points={{-22,-199},{-22,-153},{-20,-153}},
        color={0,0,127},
        smooth=Smooth.Bezier));
    connect(LVDrainECMOLin.cIn, unlimitedVolume.y) annotation (Line(points={{
            38,-230},{80,-230},{80,-10}}, color={127,0,0}));
    connect(VenousDrainECMOLin.cIn, unlimitedVolume.y) annotation (Line(
          points={{38,-204},{80,-204},{80,-10}}, color={127,0,0}));
    connect(ECMOLin.q_out, VenousDrainECMOLin.cOut) annotation (Line(
        points={{-12,-206},{22,-206},{22,-204}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.Bezier));
    connect(ECMOLin.q_out, LVDrainECMOLin.cOut) annotation (Line(
        points={{-12,-206},{4,-206},{4,-230},{22,-230}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.Bezier));
    connect(ECMOExp.q_out, LVDrainECMOExp.cOut) annotation (Line(
        points={{-10,-160},{6,-160},{6,-182},{22,-182}},
        color={0,0,0},
        thickness=1));
    connect(LVDrainECMOExp.cIn, VenousDrainECMOExp.cOut)
      annotation (Line(points={{38,-182},{38,-158}}, color={127,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -240},{100,100}})), Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-240},{100,100}}),
          graphics={Polygon(
                points={{-44,44},{-44,-36},{76,-36},{76,44},{-44,44}},
            lineColor={28,108,200},
            lineThickness=1,
            fillPattern=FillPattern.Sphere,
                fillColor={255,255,255}),Text(
            extent={{-44,28},{58,38}},
            lineColor={28,108,200},
            lineThickness=1,
            fillPattern=FillPattern.Sphere,
            fillColor={255,255,255},
                textString="Maquet catheter"),Polygon(
                points={{-50,-40},{-50,-120},{70,-120},{70,-40},{-50,-40}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255}),Text(
                extent={{-42,-114},{60,-104}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255},
                textString="Non-linear venous drain and LV drain catheters"),
            Polygon(
                points={{-48,-122},{-48,-190},{72,-190},{72,-122},{-48,-122}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255}),Polygon(
                points={{-52,-198},{-52,-266},{68,-266},{68,-198},{-52,-198}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255}),Text(
                extent={{-46,-138},{56,-128}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255},
                textString="Non-linear venous drain divider"),Text(
                extent={{-44,-264},{58,-254}},
                lineColor={28,108,200},
                lineThickness=1,
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255},
                textString="Linear venous drain divider")}));
  end CatheterDataFitting;

  model LVUnloadingTriSeg
    extends Cardiovascular.System(
      redeclare Model.Complex.Components.Pulmonary pulmonaryCirculation,
      redeclare Model.Complex.Components.Heart heart(useLVCannula=true),
      redeclare Model.Complex.Components.Systemic systemicCirculation(
          useAortalCanulla=true, redeclare
          Model.Complex.Components.Main.SystemicArteries.Original_CircAdapt SA(
            V_init=6e-05)));
    extends Cardiovascular.Icons.Runnable_System;
    import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
    import Cardiovascular.Constants.*;
    import Cardiovascular.Types.*;
    import Physiolibrary.Hydraulic.Sources.*;
    import Physiolibrary.Types.*;
    inner Model.Complex.Environment.ComplexEnvironment settings(redeclare
        Model.Complex.Environment.Conditions.Rest_MinimalAdapt condition)
      annotation (Placement(transformation(extent={{-20,34},{-14,40}})));

    // protected
    //   Averager avg_V(
    //     redeclare type T = Volume,
    //     signal = V,
    //     control = settings. stepCycle);

  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (
        Line(
        points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
        color={0,0,0},
        thickness=1));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{20,
              40}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{
              20,40}})),
      experiment(
        StopTime=15,
        Tolerance=1e-006,
        __Dymola_Algorithm="Sdirk34hw"));
  end LVUnloadingTriSeg;

  model LVUnloadingSmith
    extends Cardiovascular.System(
      redeclare Model.Smith2004.Parts.Pulmonary pulmonaryCirculation,
      redeclare Model.Smith2004.Parts.Heart heart(useLVCannula=true),
      redeclare Model.Smith2004.Parts.Systemic systemicCirculation(
          useAortalCanulla=true));
    extends Cardiovascular.Icons.Runnable_System;
    import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
    import Cardiovascular.Constants.*;
    import Cardiovascular.Types.*;
    import Physiolibrary.Hydraulic.Sources.*;
    import Physiolibrary.Types.*;
    inner Model.Complex.Environment.ComplexEnvironment settings(redeclare
        Model.Complex.Environment.Conditions.Rest_MinimalAdapt condition)
      annotation (Placement(transformation(extent={{-20,34},{-14,40}})));

    // protected
    //   Averager avg_V(
    //     redeclare type T = Volume,
    //     signal = V,
    //     control = settings. stepCycle);

  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (
        Line(
        points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
        color={0,0,0},
        thickness=1));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{20,
              40}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{
              20,40}})),
      experiment(
        StopTime=15,
        Tolerance=1e-006,
        __Dymola_Algorithm="Sdirk34hw"));
  end LVUnloadingSmith;

  package LVUnload_states
    model Healthy_noEcmo
      extends LVUnloadingTriSeg(systemicCirculation(useAortalCanulla=false),
          heart(useLVCannula=false));
      annotation (experiment(
          StopTime=15,
          Tolerance=1e-006,
          __Dymola_Algorithm="Sdirk34hw"));
    end Healthy_noEcmo;

    model LVFailure_noEcmo
      extends LVUnloadingTriSeg(
                          settings(redeclare
            Model.Complex.Environment.ModelConstants.LVFailure constants),
        systemicCirculation(useAortalCanulla=false),
        heart(useLVCannula=false));
      annotation (experiment(StopTime=15, __Dymola_Algorithm="Sdirk34hw"));
    end LVFailure_noEcmo;

    model LVFailure_Ecmo
      extends LVUnloadingTriSeg(
                          settings(redeclare
            Model.Complex.Environment.ModelConstants.LVFailure constants,
            redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
            supports));
      Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
        cycleDuration=settings.supports.ECMO_cycleDuration,
        pulseDuration=settings.supports.ECMO_pulseDuration,
        pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
        qMeanRef=settings.supports.ECMO_qMeanRef,
        isEnabled=settings.supports.ECMO_isEnabled,
        ecmoPump(qRef2=1.6666666666667e-06))
        annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
      Model.Complex.Components.Auxiliary.RLC.Tubes.TubeR arterialInfusion(l=
            0.22, r=0.0021) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={18,-46})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        VenousDrainECMOExp(Base=6.2e11, Exp=1.855311) annotation (Placement(
            transformation(
            extent={{4,4},{-4,-4}},
            rotation=90,
            origin={-12,-46})));
    equation
      connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
          points={{-12,-49.2},{-12,-60},{-9.6,-60}},
          color={28,108,200},
          thickness=1));
      connect(systemicCirculation.q_out, VenousDrainECMOExp.cIn) annotation (
          Line(
          points={{-10,-26},{-12,-26},{-12,-42.8}},
          color={28,108,200},
          thickness=1));
      connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
        annotation (Line(
          points={{7,-35},{18,-35},{18,-42.8}},
          color={217,67,180},
          thickness=1));
      connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
          points={{9.6,-60},{18,-60},{18,-49.2}},
          color={217,67,180},
          thickness=1));
      annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
    end LVFailure_Ecmo;

    model LVFailure_Ecmo_LVDrainNonLin10Fr
      extends LVUnloadingTriSeg(
                          settings(redeclare
            Model.Complex.Environment.ModelConstants.LVFailure constants,
            redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
            supports));
      Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
        cycleDuration=settings.supports.ECMO_cycleDuration,
        pulseDuration=settings.supports.ECMO_pulseDuration,
        pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
        isEnabled=settings.supports.ECMO_isEnabled,
        qMeanRef(displayUnit="l/min") = 1.6666666666667e-06,
        ecmoPump(qRef2=8.3333333333333e-05))
        annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
                                                         arterialInfusion(
        Base=2883640000000,
        Exp=1.822029,
        FrenchGauge=12,
        wallThickness(displayUnit="mm") = 0.0005,
        relativeViscosity=1,
        l=0.31)             annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={18,-46})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        VenousDrainECMOExp(Base=6.2e11, Exp=1.855311,
        FrenchGauge=19,
        relativeViscosity=1.5,
        l(displayUnit="cm") = 0.33)                   annotation (Placement(
            transformation(
            extent={{4,4},{-4,-4}},
            rotation=90,
            origin={-12,-46})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        LVDrainECMOExp(Base=1.22E+14, Exp=1.919743,
        FrenchGauge=12,
        relativeViscosity=1.5,
        l(displayUnit="cm") = 0.33)                   annotation (Placement(
            transformation(
            extent={{4,4},{-4,-4}},
            rotation=90,
            origin={14,-46})));

    equation

      connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
        annotation (Line(
          points={{7,-35},{18,-35},{18,-42.8}},
          color={217,67,180},
          thickness=1));
      connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
          points={{9.6,-60},{18,-60},{18,-49.2}},
          color={217,67,180},
          thickness=1));
      connect(VenousDrainECMOExp.cIn, systemicCirculation.q_out) annotation (
          Line(
          points={{-12,-42.8},{-12,-26},{-10,-26}},
          color={28,108,200},
          thickness=1));
      connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
          points={{-12,-49.2},{-12,-60},{-9.6,-60}},
          color={28,108,200},
          thickness=1));
      connect(heart.LVCannula, LVDrainECMOExp.cIn) annotation (Line(
          points={{4.56,-4.8},{4.56,-4},{14,-4},{14,-42.8}},
          color={28,108,200},
          thickness=1));
      connect(LVDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
          points={{14,-49.2},{14,-52},{-12,-52},{-12,-60},{-9.6,-60}},
          color={28,108,200},
          thickness=1));
      annotation (experiment(
          StopTime=30,
          Interval=0.01,
          Tolerance=1e-07,
          __Dymola_Algorithm="Cvode"));
    end LVFailure_Ecmo_LVDrainNonLin10Fr;

    model Smith_LVFailure_Ecmo_LVDrain
      extends LVUnloadingSmith(
                          settings(redeclare
            Model.Complex.Environment.ModelConstants.LVFailure constants,
            redeclare Model.Complex.Environment.Supports.ECMO_Nonpulsatile
            supports));
      Model.Complex.Components.Main.ECMO.ECMO_bare ecmo(
        cycleDuration=settings.supports.ECMO_cycleDuration,
        pulseDuration=settings.supports.ECMO_pulseDuration,
        pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
        isEnabled=settings.supports.ECMO_isEnabled,
        qMeanRef(displayUnit="l/min") = 1.6666666666667e-06,
        ecmoPump(qRef2=8.3333333333333e-05))
        annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
                                                         arterialInfusion(
        Base=2883640000000,
        Exp=1.822029,
        FrenchGauge=12,
        wallThickness(displayUnit="mm") = 0.0005,
        relativeViscosity=1,
        l=0.31)             annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={18,-46})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        VenousDrainECMOExp(Base=6.2e11, Exp=1.855311,
        FrenchGauge=19,
        relativeViscosity=1.5,
        l(displayUnit="cm") = 0.33)                   annotation (Placement(
            transformation(
            extent={{4,4},{-4,-4}},
            rotation=90,
            origin={-12,-46})));
      Model.Complex.Components.Auxiliary.RLC.Elements.ExponentialResistance
        LVDrainECMOExp(Base=1.22E+14, Exp=1.919743,
        FrenchGauge=12,
        relativeViscosity=1.5,
        l(displayUnit="cm") = 0.33)                   annotation (Placement(
            transformation(
            extent={{4,4},{-4,-4}},
            rotation=90,
            origin={14,-46})));

    equation

      connect(systemicCirculation.AortaCannulla, arterialInfusion.cOut)
        annotation (Line(
          points={{7,-35},{18,-35},{18,-42.8}},
          color={217,67,180},
          thickness=1));
      connect(ecmo.cOut, arterialInfusion.cIn) annotation (Line(
          points={{9.6,-60},{18,-60},{18,-49.2}},
          color={217,67,180},
          thickness=1));
      connect(VenousDrainECMOExp.cIn, systemicCirculation.q_out) annotation (
          Line(
          points={{-12,-42.8},{-12,-26},{-10,-26}},
          color={28,108,200},
          thickness=1));
      connect(VenousDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
          points={{-12,-49.2},{-12,-60},{-9.6,-60}},
          color={28,108,200},
          thickness=1));
      connect(heart.LVCannula, LVDrainECMOExp.cIn) annotation (Line(
          points={{4.56,-4.8},{4.56,-4},{14,-4},{14,-42.8}},
          color={28,108,200},
          thickness=1));
      connect(LVDrainECMOExp.cOut, ecmo.cIn) annotation (Line(
          points={{14,-49.2},{14,-52},{-12,-52},{-12,-60},{-9.6,-60}},
          color={28,108,200},
          thickness=1));
      annotation (experiment(StopTime=15, __Dymola_Algorithm="Cvode"));
    end Smith_LVFailure_Ecmo_LVDrain;

    model LVAD_smith
      extends Experiments.LVUnload_states.Smith_LVFailure_Ecmo_LVDrain(
        ecmo(ecmoPump(qRef2=0)),
        LVDrainECMOExp(closed=false, l(displayUnit="cm")),
        heart(ventricularInteraction_flat(Eslv=38394200.0)),
        pulmonaryCirculation(pulmonaryVeins(ZeroPressureVolume(displayUnit=
                  "ml") = 0)),
        VenousDrainECMOExp(wallThickness(displayUnit="mm"), l(displayUnit=
                "cm")));
      annotation (experiment(
          StopTime=30,
          Interval=0.01,
          Tolerance=1e-09,
          __Dymola_Algorithm="Cvode"));
    end LVAD_smith;

    model LVAD_smith_No_Unload
      extends Experiments.LVUnload_states.LVAD_smith(
                         LVDrainECMOExp(closed=true));
      annotation (experiment(
          StopTime=60,
          Tolerance=1e-06,
          __Dymola_Algorithm="Cvode"));
    end LVAD_smith_No_Unload;
  end LVUnload_states;
end Experiments;
