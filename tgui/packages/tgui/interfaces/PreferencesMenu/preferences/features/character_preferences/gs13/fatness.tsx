import {
  CheckboxInput,
  type Feature,
  FeatureNumberInput,
  type FeatureNumeric,
  type FeatureToggle,
} from '../../base';

export const starting_fatness: Feature<number> = {
  name: 'Starting Fatness',
  description: 'How fat is your character when starting the round?',
  component: FeatureNumberInput,
};

export const weight_gain_rate: FeatureNumeric = {
  name: 'Weight Gain Rate',
  description: 'How quickly do you get fat?',
  component: FeatureNumberInput,
};

export const weight_loss_rate: FeatureNumeric = {
  name: 'Weight Loss Rate',
  description: 'How quickly do you lose fat?',
  component: FeatureNumberInput,
};

export const max_weight: Feature<number> = {
  name: 'Maximum Weight',
  description:
    'What is the maximum weight your character can reach? 0 means there will be no weight cap.',
  component: FeatureNumberInput,
};

export const weight_gain_persistent: FeatureToggle = {
  name: 'Persistent weight',
  description:
    'Toggle whether endround/cryo weight will become your new start weight. This will override your starting fatness.',
  component: CheckboxInput,
};

export const weight_gain_permanent: FeatureToggle = {
  name: 'Permanent weight',
  description: 'Toggle whether you want to be affected by permanent weight; a special type of fatness that is persistent and impossible to remove using normal means.',
  component: CheckboxInput,
};

export const severe_fatness_penalty: FeatureToggle = {
  name: 'Severe fatness penalties',
  description:
    'Toggle if you want to allow your character to be affected by mechanics which may put severe fatness-related penalties onto your character (such as micro-calorite poisoning).',
  component: CheckboxInput,
};

export const safe_bursting: FeatureToggle = {
  name: 'Safe bursting',
  description:
    'Toggle if you want your character to be unharmed after bursting. Basically putting them back into a non inflated state.',
  component: CheckboxInput,
};

export const see_bursting: FeatureToggle = {
  name: 'See bursting',
  description: 'Toggle if you want to see people bursting by inflation.',
  component: CheckboxInput,
};
