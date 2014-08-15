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

      TD=TubeVolume/SolventFlowRate;
      port_out.conc=port_in.conc; //if (time<TD) then port_in.conc else delay(port_in.conc,TD,60);
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
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(
              extent={{-98,20},{100,-16}},
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
      outflowSoluteConcentration = port_out.conc;
      soluteflowrate/port_in.conc = solventflowrate;
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
            origin={22,18})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
            displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-94,58},{-76,74}})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
        annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
      Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
            8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-36,62},{-16,82}})));
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
          points={{17,18},{10,18},{10,22},{1.8,22}},
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
      connect(mixing.port_b, Stream.q_in) annotation (Line(
          points={{-33.62,61.74},{-34,61.74},{-34,72},{-36,72}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.None));
      connect(Stream.q_out, cardioPulmonarySoluteInFlow.port_in) annotation (
          Line(
          points={{-16,72},{-14,72},{-14,60},{-12,60}},
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

    package Model
    end Model;

    package Test
      model TestCardioInflow
        Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
              displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-90,54},{-72,70}})));
        Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
          annotation (Placement(transformation(extent={{-86,80},{-68,92}})));
        CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow
          annotation (Placement(transformation(extent={{-6,42},{14,62}})));
        Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
            SoluteFlow=8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-58,26},{-38,46}})));
        Physiolibrary.Chemical.Components.Substance substance
          annotation (Placement(transformation(extent={{38,12},{58,32}})));
        Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
              8.3333333333333e-08)
          annotation (Placement(transformation(extent={{10,10},{30,30}})));
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
        connect(unlimitedSolutePump.q_out, cardioPulmonarySoluteInFlow.port_in)
          annotation (Line(
            points={{-38,36},{-22,36},{-22,52},{-6,52}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Stream.q_out, substance.q_out) annotation (Line(
            points={{30,20},{40,20},{40,22},{48,22}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(Stream.q_in, cardioPulmonarySoluteInFlow.port_out) annotation (
            Line(
            points={{10,20},{12,20},{12,52},{13.8,52}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                  {{-100,-100},{100,100}}), graphics));
      end TestCardioInflow;

      model testSkeletalVO2Kinetics

        SoluteElimination soluteElimination annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-2,26})));
        CardioPulmonarySoluteInFlow cardioPulmonarySoluteInFlow(port_in(conc(
                start=9.8)))
          annotation (Placement(transformation(extent={{-12,50},{8,70}})));
        Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate1(k=
              1.6666666666667e-13) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=180,
              origin={22,-6})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
              displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-96,58},{-78,74}})));
        Physiolibrary.Types.Constants.ConcentrationConst concentration(k=9.8)
          annotation (Placement(transformation(extent={{-92,84},{-74,96}})));
        Physiolibrary.Chemical.Components.Stream Stream(SolutionFlow=
              8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-36,62},{-16,82}})));
        Modelica.Blocks.Math.Add add(k2=-1)
          annotation (Placement(transformation(extent={{-70,-14},{-50,6}})));
        Modelica.Blocks.Sources.Constant const(k=2)
          annotation (Placement(transformation(extent={{-102,-22},{-82,-2}})));
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
        connect(Stream.q_out, cardioPulmonarySoluteInFlow.port_in) annotation (
            Line(
            points={{-16,72},{-14,72},{-14,60},{-12,60}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(soluteElimination.port_out, Stream.q_in) annotation (Line(
            points={{-12,26.2},{-28,26.2},{-28,28},{-44,28},{-44,72},{-36,72}},

            color={107,45,134},
            thickness=1,
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
    end Test;
  end Parts;
  annotation (uses(Physiolibrary(version="2.1.1"), Modelica(version="3.2.1")));
end SkeletalVO2Kinetics;
