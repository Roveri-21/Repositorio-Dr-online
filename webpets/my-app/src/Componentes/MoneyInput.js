import React from 'react';
import { NumericFormat } from 'react-number-format';

const MoneyInput = ({ id }) => {
  return (
    <div id={id}>
      <NumericFormat
        thousandSeparator=","
        decimalSeparator="."
        prefix="R$ "
        decimalScale={2}
      />
    </div>
  );
};

export default MoneyInput;
