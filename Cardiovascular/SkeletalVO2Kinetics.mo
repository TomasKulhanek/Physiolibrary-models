within ;
package SkeletalVO2Kinetics
  package Parts
    model Tube

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in(q(start=1e-5))  annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out annotation (
          Placement(transformation(extent={{88,-10},{108,10}}), iconTransformation(
              extent={{88,-10},{108,10}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate(start=1)
        "solvent volume flow rate (e.g. cardiac otput)" annotation (Placement(
            transformation(extent={{-44,38},{-4,78}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={6,42})));
      Physiolibrary.Types.RealIO.TimeOutput TD "time delay" annotation (Placement(
            transformation(extent={{-4,-46},{16,-26}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={8,-50})));
      parameter Physiolibrary.Types.Volume TubeVolume(start=0.002);
    equation
      //port_in.conc*CO=port_in.q;

      TD=TubeVolume/SolventFlowRate;//*1000;
      port_out.conc=delay(port_in.conc,TD);
      port_out.q=port_out.conc*SolventFlowRate;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Ellipse(
              extent={{78,40},{100,-40}},
              pattern=LinePattern.None,
              lineColor={0,0,0},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-88,40},{90,-40}},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-100,40},{-76,-40}},
              lineColor={0,0,255},
              fillColor={0,255,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Tube;

    model SoluteElimination

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in annotation (
          Placement(transformation(extent={{-114,-10},{-94,10}}),
            iconTransformation(extent={{-114,-10},{-94,10}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out(conc(start=1e-6)) annotation (
          Placement(transformation(extent={{90,-12},{110,8}}), iconTransformation(
              extent={{90,-12},{110,8}})));
      Physiolibrary.Types.RealIO.MolarFlowRateInput SoluteEliminationRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-38,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput SolventFlowRate
        annotation (Placement(transformation(extent={{-20,2},{20,42}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={42,40})));
    equation
      port_in.q + port_out.q = SoluteEliminationRate;
      port_out.conc = port_out.q/SolventFlowRate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-98,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={0,255,255},
              fillPattern=FillPattern.Solid)}));
    end SoluteElimination;

    model Mixing

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a annotation (Placement(
            transformation(extent={{-108,4},{-88,24}}), iconTransformation(extent={{
                -108,4},{-88,24}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_a1 annotation (
          Placement(transformation(extent={{-108,-24},{-88,-4}}),
            iconTransformation(extent={{-108,-24},{-88,-4}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_b               annotation (Placement(
            transformation(extent={{88,-8},{108,12}}), iconTransformation(extent={{88,
                -8},{108,12}})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventflowrate annotation (
          Placement(transformation(extent={{-24,22},{16,62}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
    equation
      port_a.q + port_a1.q + port_b.q=0;
      port_b.conc = port_b.q/solventflowrate;
      port_a.q/port_a.conc + port_a1.q/port_a1.conc = solventflowrate;
      //port_a.conc*solventflowrate+port_a1.conc*solventflowrate = port_b.conc*solventflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Ellipse(
              extent={{-94,38},{98,-36}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={170,213,255})}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end Mixing;

    model CardioPulmonarySoluteInFlow

      Physiolibrary.Chemical.Interfaces.ChemicalPort_a port_in annotation (
          Placement(transformation(extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibrary.Chemical.Interfaces.ChemicalPort_b port_out annotation (
          Placement(transformation(extent={{88,-10},{108,10}}), iconTransformation(
              extent={{88,-10},{108,10}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput soluteflowrate annotation (
          Placement(transformation(extent={{-82,22},{-42,62}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-62,42})));
      Physiolibrary.Types.RealIO.VolumeFlowRateInput solventflowrate annotation (
          Placement(transformation(extent={{-26,24},{14,64}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,42})));

        Physiolibrary.Types.RealIO.ConcentrationInput outflowSoluteConcentration annotation (Placement(transformation(extent={{52,30},{92,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={52,42})));
    equation
      port_in.q + port_out.q + soluteflowrate = 0;
      //port_out.q = soluteflowrate;
      outflowSoluteConcentration = port_out.conc;
      soluteflowrate/port_out.conc = solventflowrate;
      //soluteflowrate/port_in.conc = solventflowrate;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={Rectangle(
              extent={{-98,20},{98,-20}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end CardioPulmonarySoluteInFlow;

    model PerfusionDeterminationFromCO

      Physiolibrary.Types.RealIO.VolumeFlowRateInput CO annotation (Placement(
            transformation(extent={{-38,36},{2,76}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-30,40})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput Qmusc annotation (
          Placement(transformation(extent={{-22,-52},{-2,-32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-30,-32})));
      Physiolibrary.Types.RealIO.VolumeFlowRateOutput Qremout annotation (Placement(
            transformation(extent={{-22,-52},{-2,-32}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={56,-32})));

      parameter Physiolibrary.Types.VolumeFlowRate Qrem;
    equation
      Qmusc= CO - Qrem;
      Qremout = Qrem;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Polygon(
              points={{-60,0},{-78,22},{82,22},{64,-2},{78,-20},{-78,-20},{-76,-20},
                  {-60,0}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}));
    end PerfusionDeterminationFromCO;

    model SkeletalVO2Kinetics

      Tube tube(TubeVolume(displayUnit="l") = 0.002,
        port_in(q(start=1.6666666666667e-05)),
        SolventFlowRate(start=8.3333333333333e-05, fixed=true))
                                                     annotation (Placement(
            transformation(
            extent={{-11,-12},{11,12}},
            rotation=90,
            origin={-36,13})));
      PerfusionDeterminationFromCO perfusionDeterminationFromCO(Qrem(
            displayUnit="l/min") = 3.3333333333333e-05) annotation (Placement(
            transformation(
            extent={{15,-10},{-15,10}},
            rotation=180,
            origin={35,-36})));
      SoluteElimination soluteElimination annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      SoluteElimination soluteElimination1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={0,0})));
      Mixing mixing(port_b(q(start=8.3333333333333e-05)))
        annotation (Placement(transformation(
            extent={{-13,-31},{13,31}},
            rotation=90,
            origin={-33,49})));
      CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(
              start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate(k=0.00035)
        annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={16,-18})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,20})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,58},{-76,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{7.8,60},{34,60},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_in, soluteElimination.port_in)
        annotation (Line(
          points={{10.4,0},{34,0},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_out, tube.port_in) annotation (Line(
          points={{-10,0.2},{-24,0.2},{-24,2},{-36,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a) annotation (Line(
          points={{-36,23.78},{-37.34,23.78},{-37.34,36.26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-20,26.2},{-20,26},{-28.66,26},{-28.66,36.26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate.y, soluteElimination1.SoluteEliminationRate)
        annotation (Line(
          points={{11,-18},{3.8,-18},{3.8,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,20},{10,20},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, mixing.solventflowrate) annotation (Line(
          points={{-73.75,66},{-62,66},{-62,49},{-45.4,49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, perfusionDeterminationFromCO.CO) annotation (
          Line(
          points={{-73.75,66},{-62,66},{-62,-60},{32,-60},{32,-40},{30.5,-40}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-73.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(perfusionDeterminationFromCO.Qremout, soluteElimination.SolventFlowRate)
        annotation (Line(
          points={{43.4,-32.8},{43.4,8},{-6.2,8},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(perfusionDeterminationFromCO.Qmusc, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{30.5,-32.8},{30.5,-28},{-4.2,-28},{-4.2,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tube.SolventFlowRate, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{-41.04,13.66},{-54,13.66},{-54,-28},{-4.2,-28},{-4.2,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{-33.62,61.74},{-22.81,61.74},{-22.81,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end SkeletalVO2Kinetics;

  end Parts;

  package Model
  end Model;

  package Test
    model TestCardioInflow
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-90,54},{-72,70}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-86,80},{-68,92}})));
      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow
        annotation (Placement(transformation(extent={{-6,42},{14,62}})));
      Physiolibrary.Chemical.Components.Substance substance(Simulation=
            Physiolibrary.Types.SimulationType.NoInit)
        annotation (Placement(transformation(extent={{54,42},{74,62}})));
      Physiolibrary.Chemical.Components.Substance substance1(Simulation=
            Physiolibrary.Types.SimulationType.NoInit, solute_start=0.005)
        annotation (Placement(transformation(extent={{-40,34},{-20,54}})));
      Physiolibrary.Chemical.Components.SolutePump solutePump(
          useSoluteFlowInput=true, SoluteFlow=0.00016666666666667)
        annotation (Placement(transformation(extent={{24,42},{44,62}})));
    equation
      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-69.75,62},{4,62},{4,56.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.outflowSoluteConcentration,
        concentration.y) annotation (Line(
          points={{9.2,56.2},{9.2,86},{-65.75,86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(substance1.q_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-30,44},{-18,44},{-18,52},{-6,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, solutePump.q_in)
        annotation (Line(
          points={{13.8,52},{24,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(solutePump.q_out, substance.q_out) annotation (Line(
          points={{44,52},{64,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.soluteflowrate, solutePump.soluteFlow)
        annotation (Line(
          points={{-2.2,56.2},{-2.2,66},{38,66},{38,56}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),        graphics));
    end TestCardioInflow;

    model testSkeletalVO2Kinetics

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(
            conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-70,-14},{-50,6}})));
      Modelica.Blocks.Sources.Constant const(k=0)
        annotation (Placement(transformation(extent={{-102,-22},{-82,-2}})));
    equation
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-75.75,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{-81,-12},{-76,-12},{-76,-10},{-72,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-49,-4},{-28,-4},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(soluteElimination.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-12,26.2},{-16,26.2},{-16,26},{-20,26},{-20,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{7.8,60},{26,60},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics;

    model testSkeletalVO2Kinetics2

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(
            conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            8.3333333333333e-05) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="ml/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-70,-14},{-50,6}})));
      Modelica.Blocks.Sources.Constant const(k=2)
        annotation (Placement(transformation(extent={{-102,-22},{-82,-2}})));
      Parts.Mixing mixing annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-34,42})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
          SoluteFlow=3.6666666666667e-05)
        annotation (Placement(transformation(extent={{-64,12},{-44,32}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{7.8,60},{34,60},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-75.75,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{-81,-12},{-76,-12},{-76,-10},{-72,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-49,-4},{-28,-4},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{-34.2,51.8},{-34.2,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-32.6,26.2},{-32.6,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(mixing.solventflowrate, add.u1) annotation (Line(
          points={{-38,42},{-76,42},{-75.75,34},{-72,34},{-72,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(unlimitedSolutePump.q_out, mixing.port_a) annotation (Line(
          points={{-44,22},{-35.4,22},{-35.4,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics2;

    model testSkeletalVO2Kinetics3

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(
              start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=8.3333333333333e-05)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={22,-6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-74,-44},{-54,-24}})));
      Modelica.Blocks.Sources.Constant const(k=2)
        annotation (Placement(transformation(extent={{-106,-72},{-86,-52}})));
      Parts.Mixing mixing(port_a(conc(start=0.02))) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-32,42})));
      Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
          SoluteFlow=3.6666666666667e-05,q_out(conc(start=0.33))) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,-18})));
      Parts.Tube tube(TubeVolume(displayUnit="l") = 0.002) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,12})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{-68,2},{-48,22}})));
    equation
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{7.8,60},{34,60},{34,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{17,-6},{10,-6},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(const.y, add.u2) annotation (Line(
          points={{-85,-62},{-78,-62},{-78,-40},{-76,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-53,-34},{-28,-34},{-28,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mixing.port_b, cardioPulmonarySoluteInFlow.port_in) annotation (Line(
          points={{-32.2,51.8},{-32.2,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination.port_out, mixing.port_a1) annotation (Line(
          points={{-12,26.2},{-30.6,26.2},{-30.6,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(unlimitedSolutePump.q_out, tube.port_in) annotation (Line(
          points={{-38,-8},{-38,2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, mixing.port_a) annotation (Line(
          points={{-38,21.8},{-36,21.8},{-36,32.2},{-33.4,32.2}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{-47,12},{-44,12},{-44,12.6},{-42.2,12.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, add1.u1) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,18},{-70,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, add.u1) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate.y, mixing.solventflowrate) annotation (Line(
          points={{-75.75,66},{-76,66},{-76,42},{-36,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, add1.u2) annotation (Line(
          points={{-53,-34},{-52,-34},{-52,-12},{-70,-12},{-70,6}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics3;

    model testSkeletalVO2Kinetics4

      Parts.SoluteElimination soluteElimination annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-2,26})));
      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(
            conc(start=9.8)))
        annotation (Placement(transformation(extent={{-12,50},{8,70}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={16,10})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-48,-16},{-28,4}})));
      Parts.SoluteElimination soluteElimination1
                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={0,-24})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={20,-40})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst flowdistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{-78,-44},{-60,-28}})));
    equation
      connect(molarFlowRate1.y, soluteElimination.SoluteEliminationRate)
        annotation (Line(
          points={{11,10},{10,10},{10,22},{1.8,22}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(volumeFlowRate.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-75.75,66},{-62,66},{-62,80},{-2,80},{-2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-71.75,90},{3.2,90},{3.2,64.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(add.y, soluteElimination.SolventFlowRate) annotation (Line(
          points={{-27,-6},{-6.2,-6},{-6.2,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(soluteElimination.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-12,26.2},{-16,26.2},{-16,26},{-20,26},{-20,60},{-12,60}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination.port_in)
        annotation (Line(
          points={{7.8,60},{26,60},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_in, soluteElimination.port_in)
        annotation (Line(
          points={{10.4,-24},{26,-24},{26,26},{8.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{-10,-23.8},{-16,-23.8},{-16,-24},{-20,-24},{-20,60},{-12,60}},

          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination1.SoluteEliminationRate, molarFlowRate2.y)
        annotation (Line(
          points={{3.8,-28},{4,-28},{4,-40},{15,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u1, volumeFlowRate.y) annotation (Line(
          points={{-50,0},{-75.75,0},{-75.75,66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowdistribution.y, add.u2) annotation (Line(
          points={{-57.75,-36},{-54,-36},{-54,-12},{-50,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowdistribution.y, soluteElimination1.SolventFlowRate)
        annotation (Line(
          points={{-57.75,-36},{-4.2,-36},{-4.2,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics4;

    model testSkeletalVO2Kinetics5

      Parts.CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(
            conc(start=9.8)))
        annotation (Placement(transformation(extent={{50,42},{70,62}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-30,76},{-12,88}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{6,18},{16,28}})));
      Parts.SoluteElimination soluteElimination1
                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={62,-32})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate2(k=0.00035)
                                 annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={82,-48})));
      Modelica.Blocks.Math.Add add1(
                                   k2=-1)
        annotation (Placement(transformation(extent={{18,-38},{38,-58}})));
      Parts.Tube tube(SolventFlowRate(start=8.3333333333333e-05, displayUnit=
              "ml/min"), TubeVolume(displayUnit="l") = 0.002) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={48,0})));
      Parts.SoluteElimination soluteElimination2
                                                annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={64,26})));
      Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
            0.00016666666666667) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={74,6})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst FlowRateDistribution(k(
            displayUnit="l/min") = 3.3333333333333e-05)
        annotation (Placement(transformation(extent={{14,-6},{-4,10}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=1,
        duration=30,
        offset=1,
        startTime=10)
        annotation (Placement(transformation(extent={{-94,26},{-74,46}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(
                                                                       k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,56},{-76,72}})));
    equation

      connect(concentration.y, cardioPulmonarySoluteInFlow.outflowSoluteConcentration)
        annotation (Line(
          points={{-9.75,82},{65.2,82},{65.2,56.2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(soluteElimination1.SoluteEliminationRate, molarFlowRate2.y)
        annotation (Line(
          points={{65.8,-36},{66,-36},{66,-48},{77,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, soluteElimination1.SolventFlowRate) annotation (Line(
          points={{39,-48},{57.8,-48},{57.8,-36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(soluteElimination1.port_out, tube.port_in) annotation (Line(
          points={{52,-31.8},{46,-31.8},{46,-10},{48,-10}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(tube.port_out, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{48,9.8},{48,52},{50,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination1.port_in)
        annotation (Line(
          points={{69.8,52},{82,52},{82,-32},{72.4,-32}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(add1.u2, add.y) annotation (Line(
          points={{16,-42},{16,-26},{16.5,-26},{16.5,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, tube.SolventFlowRate) annotation (Line(
          points={{39,-48},{40,-48},{40,0.6},{43.8,0.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(cardioPulmonarySoluteInFlow.port_out, soluteElimination2.port_in)
        annotation (Line(
          points={{69.8,52},{82,52},{82,26},{74.4,26}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(soluteElimination2.port_out, cardioPulmonarySoluteInFlow.port_in)
        annotation (Line(
          points={{54,26.2},{50,26.2},{50,26},{48,26},{48,52},{50,52}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(molarFlowRate1.y, soluteElimination2.SoluteEliminationRate)
        annotation (Line(
          points={{69,6},{67.8,6},{67.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, soluteElimination2.SolventFlowRate) annotation (Line(
          points={{16.5,23},{38.25,23},{38.25,22},{59.8,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FlowRateDistribution.y, add.u2) annotation (Line(
          points={{-6.25,2},{-6,2},{-6,20},{5,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, product1.u2) annotation (Line(
          points={{-73,36},{-66,36},{-66,46},{-58,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(volumeFlowRate1.y, product1.u1) annotation (Line(
          points={{-73.75,64},{-66,64},{-66,58},{-58,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, cardioPulmonarySoluteInFlow.solventflowrate)
        annotation (Line(
          points={{-35,52},{4,52},{4,62},{60,62},{60,56.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,26},{5,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, add1.u1) annotation (Line(
          points={{-35,52},{-34,52},{-34,-54},{16,-54},{16,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Ellipse(
              extent={{-36,38},{38,-34}},
              lineColor={0,0,255},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics),
        experiment(
          StopTime=60,
          Tolerance=0.1,
          __Dymola_fixedstepsize=1,
          __Dymola_Algorithm="Dassl"),
        __Dymola_experimentSetupOutput);
    end testSkeletalVO2Kinetics5;
  end Test;
  annotation (uses(Physiolibrary(version="2.1.1"), Modelica(version="3.2")));
end SkeletalVO2Kinetics;
