import { StyleSheet, TouchableOpacity, Text } from 'react-native';

export default function OnboardNextBtn(props) {
    return (
      <TouchableOpacity style={styles.btn} onPress={props.onPress}>
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
}
});
