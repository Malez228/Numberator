package com.example.malec.numberator;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Chronometer;
import android.widget.GridLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class GameActivity extends AppCompatActivity
{
    Random rnd = new Random();
    List<Integer> Colors = new ArrayList<>();
    List<Integer> Numbers;
    GridLayout Field;
    Integer CurrentNumber = 1;

    public static boolean HidePressed, Shuffle;
    public static Integer W, H;

    int GetRandomColor()
    {
        if (Colors.isEmpty())
        {
            Colors.add(Color.rgb(100, 64, 15));
            Colors.add(Color.rgb(121, 85, 61));
            Colors.add(Color.rgb(108, 104, 116));
            Colors.add(Color.rgb(76, 88, 102));
            Colors.add(Color.rgb(71, 74, 81));
            Colors.add(Color.rgb(71, 42, 63));
            Colors.add(Color.rgb(173, 0, 95));
            Colors.add(Color.rgb(66, 16, 97));
            Colors.add(Color.rgb(50, 18, 102));
            Colors.add(Color.rgb(102, 0, 53));
            Colors.add(Color.rgb(18, 10, 143));
            Colors.add(Color.rgb(139, 0, 255));
            Colors.add(Color.rgb(123, 104, 238));
            Colors.add(Color.rgb(28, 211, 162));
            Colors.add(Color.rgb(255, 77, 0));
            Colors.add(Color.rgb(255, 46, 46));
            Colors.add(Color.rgb(165, 38, 10));
            Colors.add(Color.rgb(227, 36, 23));
            Colors.add(Color.rgb(247, 82, 22));
            Colors.add(Color.rgb(237, 32, 77));
            Colors.add(Color.rgb(255, 36, 131));
            Colors.add(Color.rgb(255, 0, 204));
            Colors.add(Color.rgb(205, 0, 205));
            Colors.add(Color.rgb(51, 51, 255));
            Colors.add(Color.rgb(0, 140, 240));
            Colors.add(Color.rgb(66, 94, 23));
            Colors.add(Color.rgb(0, 143, 0));
            Colors.add(Color.rgb(255, 202, 90));
            Colors.add(Color.rgb(250, 183, 0));
            Colors.add(Color.rgb(255, 36, 0));
            Colors.add(Color.rgb(95, 230, 32));
            Colors.add(Color.rgb(60, 170, 60));
            Colors.add(Color.rgb(18, 47, 170));
            Colors.add(Color.rgb(20, 118, 255));
            Colors.add(Color.rgb(0, 140, 240));
        }

        Integer color = Colors.get(rnd.nextInt(Colors.size()));
        Colors.remove(color);
        return color;
    }

    Drawable GetRandomColorOld()
    {
        switch (rnd.nextInt(35))
        {
            case 0 : return getResources().getDrawable(R.drawable.round_rect_1);
            case 1 : return getResources().getDrawable(R.drawable.round_rect_2);
            case 2 : return getResources().getDrawable(R.drawable.round_rect_3);
            case 3 : return getResources().getDrawable(R.drawable.round_rect_4);
            case 4 : return getResources().getDrawable(R.drawable.round_rect_5);
            case 5 : return getResources().getDrawable(R.drawable.round_rect_6);
            case 6 : return getResources().getDrawable(R.drawable.round_rect_7);
            case 7 : return getResources().getDrawable(R.drawable.round_rect_8);
            case 8 : return getResources().getDrawable(R.drawable.round_rect_9);
            case 9 :return getResources().getDrawable(R.drawable.round_rect_10);
            case 10:return getResources().getDrawable(R.drawable.round_rect_11);
            case 11:return getResources().getDrawable(R.drawable.round_rect_12);
            case 12:return getResources().getDrawable(R.drawable.round_rect_13);
            case 13:return getResources().getDrawable(R.drawable.round_rect_14);
            case 14:return getResources().getDrawable(R.drawable.round_rect_15);
            case 15:return getResources().getDrawable(R.drawable.round_rect_16);
            case 16:return getResources().getDrawable(R.drawable.round_rect_17);
            case 17:return getResources().getDrawable(R.drawable.round_rect_18);
            case 18:return getResources().getDrawable(R.drawable.round_rect_19);
            case 19:return getResources().getDrawable(R.drawable.round_rect_20);
            case 20:return getResources().getDrawable(R.drawable.round_rect_21);
            case 21:return getResources().getDrawable(R.drawable.round_rect_22);
            case 22:return getResources().getDrawable(R.drawable.round_rect_23);
            case 23:return getResources().getDrawable(R.drawable.round_rect_24);
            case 24:return getResources().getDrawable(R.drawable.round_rect_25);
            case 25:return getResources().getDrawable(R.drawable.round_rect_26);
            case 26:return getResources().getDrawable(R.drawable.round_rect_27);
            case 27:return getResources().getDrawable(R.drawable.round_rect_28);
            case 28:return getResources().getDrawable(R.drawable.round_rect_29);
            case 29:return getResources().getDrawable(R.drawable.round_rect_30);
            case 30:return getResources().getDrawable(R.drawable.round_rect_31);
            case 31:return getResources().getDrawable(R.drawable.round_rect_32);
            case 32:return getResources().getDrawable(R.drawable.round_rect_33);
            case 33:return getResources().getDrawable(R.drawable.round_rect_34);
            case 34:return getResources().getDrawable(R.drawable.round_rect_35);

            default: return getResources().getDrawable(R.drawable.round_rect_1);
        }
    }

    List<Integer> GenerateNumbers()
    {
        List<Integer> n = new ArrayList<>();
        for (int i = 1; i < W * H + 1; i++)
            n.add(i);

        return n;
    }

    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game);

        Field = (GridLayout) findViewById(R.id.Field);
        Field.setColumnCount(W);
        Field.setRowCount(H);
        Numbers = GenerateNumbers();

        final ProgressBar TimeProgress = (ProgressBar) findViewById(R.id.TimeProgress);
        TimeProgress.setMax((int)(Math.max(W, H) * 1.65));
        TimeProgress.setProgress(0);
        final Chronometer chrono = (Chronometer)findViewById(R.id.timer);
        chrono.setOnChronometerTickListener(new Chronometer.OnChronometerTickListener()
        {
            @Override
            public void onChronometerTick(Chronometer chronometer)
            {
                long elapsedMillis = SystemClock.elapsedRealtime() - chrono.getBase();

                TimeProgress.setProgress((int)(elapsedMillis / 1000 + (CurrentNumber * 0.1)));

                if (TimeProgress.getProgress() >= TimeProgress.getMax())
                {
                    chrono.stop();
                    Toast.makeText(GameActivity.this, "Поражение", Toast.LENGTH_SHORT).show();
                    finish();
                }
            }
        });

        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        Integer ScreenHeight = displayMetrics.heightPixels - (int) (118 * (displayMetrics.densityDpi / 160));
        Integer ScreenWidth = displayMetrics.widthPixels;

        for (Integer i = 0; i < W * H; i++)
        {
            final TextView Text = new TextView(Field.getContext());

            Integer NewWidth = (Integer) (ScreenWidth / W);
            Integer NewHeight = (Integer) (ScreenHeight / H);
            Text.setWidth(NewWidth);
            Text.setHeight(NewHeight);
            Text.setVisibility(View.VISIBLE);
            Integer num = Numbers.get(rnd.nextInt(Numbers.size()));
            Text.setText(num.toString());
            Numbers.remove(num);
            Text.setTextColor(Color.WHITE);
            Text.setTextSize((Integer) (Math.min(NewWidth, NewHeight) / 7));
            Text.setGravity(Gravity.CENTER);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
            {
                Text.setBackground(getDrawable(android.R.drawable.editbox_background));
                Text.setBackgroundTintList(ColorStateList.valueOf(GetRandomColor()));

            } else
                Text.setBackground(GetRandomColorOld());

            Text.setOnClickListener(new View.OnClickListener()
            {
                @Override
                public void onClick(View view)
                {
                    TextView t = (TextView) view;
                    if (Integer.valueOf(t.getText().toString()) == CurrentNumber)
                    {
                        if (CurrentNumber + 1 == W * H + 1)
                        {
                            Toast.makeText(GameActivity.this, "Победа", Toast.LENGTH_SHORT).show();
                            finish();
                            return;
                        }

                        chrono.setBase(SystemClock.elapsedRealtime());
                        TimeProgress.setProgress(0);
                        chrono.start();

                        CurrentNumber++;
                        if (HidePressed)
                            t.setVisibility(View.INVISIBLE);

                        if (Shuffle)
                            for (Integer i = 0; i < W * H; i++)
                            {
                                int aPos, bPos;

                                TextView a;

                                GenerateFirstNumber:
                                {
                                    while (true)
                                    {
                                        aPos = rnd.nextInt(W * H);
                                        a = (TextView) Field.getChildAt(aPos);

                                        if (a.getVisibility() == View.VISIBLE) break GenerateFirstNumber;
                                    }
                                }

                                TextView b;

                                GenerateSecondNumber:
                                {
                                    while (true)
                                    {
                                        bPos = rnd.nextInt(W * H);
                                        b = (TextView) Field.getChildAt(bPos);

                                        if (b.getVisibility() == View.VISIBLE) break GenerateSecondNumber;
                                    }
                                }

                                TextView c = new TextView(Field.getContext());
                                c.setText(a.getText());
                                a.setText(b.getText());
                                b.setText(c.getText());
                                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
                                {
                                    c.setBackgroundTintList(a.getBackgroundTintList());
                                    a.setBackgroundTintList(b.getBackgroundTintList());
                                    b.setBackgroundTintList(c.getBackgroundTintList());
                                } else
                                {
                                    a.setBackground(GetRandomColorOld());
                                    b.setBackground(GetRandomColorOld());
                                }
                            }
                    }
                }
            });

            Field.addView(Text);
        }
    }
}
