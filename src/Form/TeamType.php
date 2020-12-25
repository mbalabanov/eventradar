<?php

namespace App\Form;

use App\Entity\Team;
use App\Entity\League;
use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class TeamType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('logourl')
            ->add('leagueranking')
            ->add('description')
            ->add('categoryid', EntityType::class, array("class"=> Category::class , "choice_label"=>"name"))
            ->add('leagueid', EntityType::class, array("class"=> League::class , "choice_label"=>"name"))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Team::class,
        ]);
    }
}
