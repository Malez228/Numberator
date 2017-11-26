package com.example.malec.numberator;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class SettingsActivity extends AppCompatActivity
{
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        final EditText EdtTextW = (EditText) findViewById(R.id.EditTextW);
        final EditText EdtTextH = (EditText) findViewById(R.id.EditTextH);
        final TextView TextInfo = (TextView) findViewById(R.id.TextInfo);

        final List<String> MatrixSizes = new ArrayList<>();
        MatrixSizes.add("3x3");
        MatrixSizes.add("3x4");
        MatrixSizes.add("3x5");
        MatrixSizes.add("4x4");
        MatrixSizes.add("4x5");
        MatrixSizes.add("4x6");
        MatrixSizes.add("5x5");
        MatrixSizes.add("5x6");
        MatrixSizes.add("5x7");
        MatrixSizes.add("Собственный размер");

        Spinner MatrixSize = (Spinner) findViewById(R.id.MatrixSize);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, MatrixSizes);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        MatrixSize.setAdapter(adapter);

        MatrixSize.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
        {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id)
            {
                if (position != 9)
                {
                    EdtTextW.setText(String.valueOf(MatrixSizes.get(position).charAt(0)));
                    EdtTextH.setText(String.valueOf(MatrixSizes.get(position).charAt(2)));

                    EdtTextW.setVisibility(View.INVISIBLE);
                    EdtTextH.setVisibility(View.INVISIBLE);
                    TextInfo.setVisibility(View.INVISIBLE);
                } else
                {
                    EdtTextW.setVisibility(View.VISIBLE);
                    EdtTextH.setVisibility(View.VISIBLE);
                    TextInfo.setVisibility(View.VISIBLE);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) { }
        });

        Button StartButton = (Button)findViewById(R.id.StartButton);
        StartButton.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                GameActivity.HidePressed = ((CheckBox)(findViewById(R.id.CheckHide))).isChecked();
                GameActivity.Shuffle = ((CheckBox)(findViewById(R.id.CheckShuffle))).isChecked();

                if (Integer.valueOf(EdtTextW.getText().toString()) < 8 && Integer.valueOf(EdtTextW.getText().toString()) > 1)
                    GameActivity.W = Integer.valueOf(EdtTextW.getText().toString()); else GameActivity.W = 5;
                if (Integer.valueOf(EdtTextH.getText().toString()) < 16 && Integer.valueOf(EdtTextH.getText().toString()) > 1)
                    GameActivity.H = Integer.valueOf(EdtTextH.getText().toString()); else GameActivity.H = 5;

                startActivity(new Intent(SettingsActivity.this, GameActivity.class));
            }
        });
    }
}