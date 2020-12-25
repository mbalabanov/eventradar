<?php

namespace App\Form;

use App\Entity\Event;
use App\Entity\Contest;
use App\Entity\Location;
use App\Entity\Category;
use App\Entity\Team;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('eventdate')
            ->add('name')
            ->add('imageurl')
            ->add('note')
            ->add('categoryid', EntityType::class, array("class"=> Category::class , "choice_label"=>"name"))
            ->add('teamida', EntityType::class, array("class"=> Team::class , "choice_label"=>"name"))
            ->add('teamidb', EntityType::class, array("class"=> Team::class , "choice_label"=>"name"))
            ->add('contestid', EntityType::class, array("class"=> Contest::class , "choice_label"=>"name"))
            ->add('locationid', EntityType::class, array("class"=> Location::class , "choice_label"=>"name"))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
