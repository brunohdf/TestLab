package com.ciandt.testlab;

import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class DetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        TextView textViewDetail = (TextView) findViewById(R.id.textview_detail);

        if (getIntent().hasExtra(MainActivity.BUNDLE_NAME)) {

            String name = getIntent().getStringExtra(MainActivity.BUNDLE_NAME);
            textViewDetail.setText(String.format("Ok captain %s, you got it!", name));

            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
                //throw new NullPointerException("Not this time captain!");
            }
        }
    }
}
