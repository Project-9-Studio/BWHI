import TextInputView from "./TextInputView";

export default function EmailInputView(props) {
  function onContinue(email) {
    props.navigation?.push('AddProfilePic');
  }

  return (
    <TextInputView
      title="Enter you email address"
      onContinue={onContinue}
      keyboardType="email-address"
    />
  );
}
