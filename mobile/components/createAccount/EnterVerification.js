import { useState } from "react";
import { StyleSheet, Text, View } from "react-native";
import BackBtn from '../BackBtn';
import NextBtn from '../NextBtn';
import InputView from './InputView';
import { CodeField, useBlurOnFulfill, useClearByFocusCell, Cursor } from 'react-native-confirmation-code-field';

const CELL_COUNT = 6;

export default function CreateAccountVerification(props) {
  const [value, setValue] = useState('');
  const ref = useBlurOnFulfill({value, cellCount: CELL_COUNT});
  const [cellProps, getCellOnLayoutHandler] = useClearByFocusCell({ value, setValue });

  function onFulfill(input) {
    setIsFulfilled(true);
  }

  return (
    <InputView>
      <BackBtn onPress={() => props.navigation?.goBack()} />
      <Text style={styles.title}>Enter verification code</Text>
      <Text style={styles.subtitle}>Enter the code sent to your phone number</Text>

      <CodeField
        ref={ref}
        {...cellProps}
        value={value}
        onChangeText={setValue}
        cellCount={CELL_COUNT}
        keyboardType="number-pad"
        textContentType="oneTimeCode"
        rootStyle={styles.codeFieldRoot}
        renderCell={({index, symbol, isFocused}) => (
          <Text
            key={index}
            style={[styles.cell, isFocused && styles.focusCell]}
            onLayout={getCellOnLayoutHandler(index)}>
            {(symbol && '•') || (isFocused ? <Cursor /> : null)}
          </Text>
        )}
      />

      <View style={{ flex: 1}} />

      <NextBtn
        text="Continue"
        disabled={value.length !== 6}
        onPress={() => props.navigation?.push('EnterFullname')}
      />
    </InputView>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 24,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 8,
    textAlign: 'center',
    marginTop: 62
  },

  subtitle: {
    fontSize: 18,
    lineHeight: 22,
    textAlign: 'center',
    marginBottom: 20
  },

  codeFieldRoot: {
    marginLeft: 28,
    marginRight: 28
  },

  cell: {
    width: 55,
    height: 55,
    lineHeight: 55,
    fontSize: 30,
    fontWeight: '500',
    textAlign: 'center',
    borderRadius: 12,
    backgroundColor: '#eee',
  }
});
