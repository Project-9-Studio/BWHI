import { StyleSheet, TouchableOpacity, Text } from 'react-native';

export default function NextBtn(props) {
    return (
      <TouchableOpacity
        style={[styles.btn, props.disabled && styles.disabled, props.style]}
        onPress={props.onPress}
        disabled={props.disabled}
      >
        <Text style={styles.btnText}>{props.text}</Text>
      </TouchableOpacity>
    );
}

const styles = StyleSheet.create({
  btn: {
    marginLeft: 24,
    marginRight: 24,
    marginBottom: 60,
    backgroundColor: '#000',
    alignSelf: 'stretch',
    padding: 15,
    borderRadius: 12
  },

  btnText: {
    color: '#fff',
    textAlign: 'center',
    fontSize: 22
  },

  disabled: {
    backgroundColor: 'rgba(0,0,0,0.65)'
  }
});
