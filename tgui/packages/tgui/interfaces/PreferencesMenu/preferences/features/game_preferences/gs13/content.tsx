import { CheckboxInput, type FeatureToggle } from '../../base';

export const weight_gain_food: FeatureToggle = {
  name: 'Weight gain from food',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_chems: FeatureToggle = {
  name: 'Weight gain from chems',
  description: 'Toggle whenever you want fattening chemicals to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_items: FeatureToggle = {
  name: 'Weight gain from items',
  description: 'Toggle whenever you want fattening items to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_weapons: FeatureToggle = {
  name: 'Weight gain from weapons',
  description: 'Toggle whenever you want fattening weaponry to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_magic: FeatureToggle = {
  name: 'Weight gain from magic',
  description: 'Toggle whenever you want fattening magic to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_viruses: FeatureToggle = {
  name: 'Weight gain from viruses',
  description: 'Toggle whenever you want fattening viruses to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_nanites: FeatureToggle = {
  name: 'Weight gain from nanites',
  description: 'Toggle whenever you want fattening nanite programs to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_atmos: FeatureToggle = {
  name: 'Weight gain from atmos gasses',
  description: 'Toggle whenever you want fattening atmos gasses to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_gain_mobs: FeatureToggle = {
  name: 'Weight gain from mobs',
  description: 'Toggle whenever you want fattening mobs to affect you.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const blueberry_inflation: FeatureToggle = {
  name: 'Blueberryfication',
  description: 'Toggle whether you want to be affected by blueberry inflation mechanics.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const weight_size_scaling: FeatureToggle = {
  name: 'Scale sprite size with weight',
  category: 'Size',
  component: CheckboxInput,
};

export const size_xwg: FeatureToggle = {
  name: '200%+ Sprite size on weight gain (XWG)',
  category: 'Size',
  component: CheckboxInput,
};

export const muscle_gain: FeatureToggle = {
  name: 'Muscle gain',
  description: 'Toggle whether you want exercising to contribute to muscle growth.',
  category: 'WG Sources',
  component: CheckboxInput,
};

export const burping_noises: FeatureToggle = {
  name: 'Enable burping noises',
  category: 'SOUND',
  component: CheckboxInput,
};

export const farting_noises: FeatureToggle = {
  name: 'Enable farting noises',
  category: 'SOUND',
  component: CheckboxInput,
};
