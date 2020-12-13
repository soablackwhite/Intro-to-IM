float super_shape(float theta){
  float part1 = (1 / a) * cos(theta * m / 4);
  part1 = abs(part1);
  part1 = pow(part1, n2);

  float part2 = (1 / b) * sin(theta * m / 4);
  part2 = abs(part2);
  part2 = pow(part2, n3);

  float part3 = pow(part1 + part2, 1 / n1);

  if (part3 == 0) {
    return 0;
  }

  return (1 / part3);
}
