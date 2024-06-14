//0316/0529/24
#priority 3
//生肉
<ore:rawMeat>.add(<minecraft:mutton>);//生羊肉
<ore:rawMeat>.add(<minecraft:rabbit>);//生兔肉
<ore:rawMeat>.add(<minecraft:chicken>);//生鸡肉
<ore:rawMeat>.add(<minecraft:beef>);//生牛肉
<ore:rawMeat>.add(<minecraft:porkchop>);//生猪肉
//精华液材料
<ore:materialNutrient>.add(<minecraft:rotten_flesh>);//腐肉
<ore:materialNutrient>.addAll(<ore:itemSkull>);//所有头颅
<ore:materialNutrient>.addAll(<ore:rawMeat>);//所有生肉
//透镜
<ore:everyGtLens>.addAll(<ore:craftingLensGlass>);//玻璃透镜
<ore:everyGtLens>.addAll(<ore:lensDiamond>);//钻石透镜
<ore:everyGtLens>.addAll(<ore:lensEmerald>);//绿宝石透镜
<ore:everyGtLens>.addAll(<ore:lensRuby>);//红宝石透镜
<ore:everyGtLens>.addAll(<ore:lensSapphire>);//蓝宝石透镜
<ore:everyGtLens>.addAll(<ore:lensNetherStar>);//界星透镜
//全部物品(测试)
for item in game.items {
  <ore:allItems>.add(item);
}
