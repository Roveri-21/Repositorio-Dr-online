// EstoqueItem.js
import React from 'react';

const EstoqueItem = ({ item, onSelect }) => {
  return (
    <tr onClick={onSelect}>
      <td>{item.nome}</td>
      <td>{item.quantidade}</td>
      <td>{item.preco}</td>
    </tr>
  );
};

export default EstoqueItem;
