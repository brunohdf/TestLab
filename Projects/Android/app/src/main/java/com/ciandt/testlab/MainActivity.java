package com.ciandt.testlab;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    public static final String BUNDLE_NAME = "BUNDLE_NAME";

    private LinearLayout mLinearLayoutMain;
    private EditText mEditTextName;
    private Button mButtonNext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mLinearLayoutMain = (LinearLayout) findViewById(R.id.linearlayout_main);
        mEditTextName = (EditText) mLinearLayoutMain.findViewById(R.id.edittext_name);
        mButtonNext = (Button) mLinearLayoutMain.findViewById(R.id.button_next);

        setListeners();
    }

    private void setListeners() {

        mButtonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String name = mEditTextName.getText().toString();

                if (!name.isEmpty()) {

                    Bundle bundle = new Bundle();
                    bundle.putString(BUNDLE_NAME, name);

                    Intent intent = new Intent(MainActivity.this, DetailActivity.class);
                    intent.putExtras(bundle);

                    startActivity(intent);
                } else {

                    mEditTextName.setError("Name is required");
                    //Snackbar.make(mLinearLayoutMain, "snackbar: campo obrigatorio", Snackbar.LENGTH_SHORT).show();
                }
            }
        });
    }
}
