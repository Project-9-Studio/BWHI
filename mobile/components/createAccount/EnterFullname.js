import TextInputView from "./TextInputView";

export default function FullnameInputView(props) {
  function onContinue(name) {
    props.navigation?.push('EnterEmail');
  }

  return <TextInputView title="Enter your full name" onContinue={onContinue} />;
}
