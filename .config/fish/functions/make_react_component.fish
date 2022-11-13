function make_react_component
  if test "$argv" = ""
    echo "Input a component name."
  else
    mkdir $argv
    cd ./$argv

    echo \
    "type SampleProps = {

    };

    const Sample = (props:SampleProps) => {
      return <></>;
    };

    export default Sample;" > index.tsx
    gsed -i s/Sample/$argv/g index.tsx
    echo \
    "import { StyleSheet } from 'react-native';

    export const styles = StyleSheet.create({

    });" > styles.ts
    touch hooks.tsx
    cd ../
  end
end
