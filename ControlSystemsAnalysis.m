%% Control Systems Analysis App
% This app provides a graphical user interface for analyzing control systems.
% Users can input numerator and denominator coefficients and generate various plots.

classdef ControlSystemsAnalysis < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        NumeratorEditFieldLabel  matlab.ui.control.Label
        NumeratorEditField  matlab.ui.control.EditField
        DenominatorEditFieldLabel  matlab.ui.control.Label
        DenominatorEditField  matlab.ui.control.EditField
        GenerateStepResponseButton  matlab.ui.control.Button
        GenerateBodePlotButton  matlab.ui.control.Button
        PoleZeroAnalysisButton  matlab.ui.control.Button
        StepResponseAxes  matlab.ui.control.UIAxes
        BodePlotAxes  matlab.ui.control.UIAxes
        PoleZeroAxes  matlab.ui.control.UIAxes
    end

    methods (Access = private)

        % Callback function for generating a step response
        function GenerateStepResponseButtonPushed(app, event)
            num = str2num(app.NumeratorEditField.Value);
            den = str2num(app.DenominatorEditField.Value);
            sys = tf(num, den);
            step(sys, 'Parent', app.StepResponseAxes);
            title(app.StepResponseAxes, 'Step Response');
        end

        % Callback function for generating Bode plot
        function GenerateBodePlotButtonPushed(app, event)
            num = str2num(app.NumeratorEditField.Value);
            den = str2num(app.DenominatorEditField.Value);
            sys = tf(num, den);
            bode(sys, 'Parent', app.BodePlotAxes);
            title(app.BodePlotAxes, 'Bode Plot');
        end

        % Callback function for pole-zero analysis
        function PoleZeroAnalysisButtonPushed(app, event)
            num = str2num(app.NumeratorEditField.Value);
            den = str2num(app.DenominatorEditField.Value);
            sys = tf(num, den);
            pzmap(sys, 'Parent', app.PoleZeroAxes);
            title(app.PoleZeroAxes, 'Pole-Zero Map');
        end
    end

    % Component initialization
    methods (Access = private)
        function createComponents(app)
            % Create and configure components
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 800 600];
            app.UIFigure.Name = 'Control Systems Analysis';

            app.NumeratorEditFieldLabel = uilabel(app.UIFigure);
            app.NumeratorEditFieldLabel.Position = [50 550 100 22];
            app.NumeratorEditFieldLabel.Text = 'Numerator Coefficients:';

            app.NumeratorEditField = uieditfield(app.UIFigure, 'text');
            app.NumeratorEditField.Position = [200 550 100 22];

            app.DenominatorEditFieldLabel = uilabel(app.UIFigure);
            app.DenominatorEditFieldLabel.Position = [50 500 100 22];
            app.DenominatorEditFieldLabel.Text = 'Denominator Coefficients:';

            app.DenominatorEditField = uieditfield(app.UIFigure, 'text');
            app.DenominatorEditField.Position = [200 500 100 22];

            app.GenerateStepResponseButton = uibutton(app.UIFigure, 'push');
            app.GenerateStepResponseButton.Position = [50 450 150 22];
            app.GenerateStepResponseButton.Text = 'Generate Step Response';
            app.GenerateStepResponseButton.ButtonPushedFcn = @(src, event) GenerateStepResponseButtonPushed(app, event);

            app.GenerateBodePlotButton = uibutton(app.UIFigure, 'push');
            app.GenerateBodePlotButton.Position = [250 450 150 22];
            app.GenerateBodePlotButton.Text = 'Generate Bode Plot';
            app.GenerateBodePlotButton.ButtonPushedFcn = @(src, event) GenerateBodePlotButtonPushed(app, event);

            app.PoleZeroAnalysisButton = uibutton(app.UIFigure, 'push');
            app.PoleZeroAnalysisButton.Position = [450 450 150 22];
            app.PoleZeroAnalysisButton.Text = 'Pole-Zero Analysis';
            app.PoleZeroAnalysisButton.ButtonPushedFcn = @(src, event) PoleZeroAnalysisButtonPushed(app, event);

            app.StepResponseAxes = uiaxes(app.UIFigure);
            app.StepResponseAxes.Position = [50 50 300 300];

            app.BodePlotAxes = uiaxes(app.UIFigure);
            app.BodePlotAxes.Position = [400 50 300 300];

            app.PoleZeroAxes = uiaxes(app.UIFigure);
            app.PoleZeroAxes.Position = [755 50 300 300];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    methods (Access = public)

        % Construct app
        function app = ControlSystemsAnalysis
            createComponents(app)
        end
    end
end
